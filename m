Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66036CC6B1A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD7210FC8A;
	Wed, 14 Oct 2026 09:43:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3680610FC8A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791970960; x=1823506960;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=zg2raXub8Ee3DMwiUNunaH/4kM+OHuSYkB0BMIQ1DSk=;
 b=Va7NPN8BcIWoKKui5FP+kDJL+fP2njI9UsKb6c+PuntSUiS3N79ypx+O
 Ks0IBE87L71lAIy6Oon6MUHkmfE5xtfAH7gREJFGEVRw+4HxXtX2xTnhk
 3eyNoMB6Vt2kPnck1W49CluXOHQfEer6dV9fccsZU6caOhBaFnTA5bppG
 KknYNhaO75RPP9ugtQS8FB2cupXxKfLe7HNHFrt220dGe/LGYqF0eUph8
 9WJAPQqSvVed5cJh6eufkS9joWo9FoB4pWxcaOfjHS+cgUOus76kNJs4u
 9x0vodOCDOmYlO0/xHkr/H20LEsi+uPzsY2VEws8TUw3nM2kFfjov5Sa7 Q==;
X-CSE-ConnectionGUID: ZqwDfYQtQ02Egs8w0MWPpw==
X-CSE-MsgGUID: CYo379A7S1ebHKypr61sxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="599158"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="599158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:42:39 -0700
X-CSE-ConnectionGUID: 8l9Q0byVR/Ko8kTF2mJmqQ==
X-CSE-MsgGUID: 5idqRhugSXyS24lP0VJ+0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1602104"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:42:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:42:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:42:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:42:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7/okQh3tN6y1fWBxNHVOI6COL7ING2s8tl1jltB9wtGA3u5mb50/zd7B+Ypwo7ij144hiNbyHEz6KBjKWpkWlo6Oe2hk3Z40WBEH1NxDJiURPA+KRcgYc6XFbql+13ZK1MwM56yOEuIPvrYIWMgPVGpaoGP2QXmrNpr3+bISC0/AZbpynAGOw5ukf5Rni5w0VIqFKfyd4E53Ry8vtAftiD1In9NrBcspJkwFo3KpLGQXuNisBnN2hWljULwX6zLJkqh6JBRzbtWivyMP5JeD3SBzGOQDIcnmn32i2yhjQrD1RCd3ViDlEDfqhqsiFMAU2LPivqM34pOInRRke8XPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRsPUFMs63e4Y9kquy0KQBNsS5fSjGTHykMhe1qG8Rw=;
 b=DH1HWCFEVarG0MvtsxWg64NZqR6HVSg2jFpZxWyl+sfC3zStLlnU4esmZt3px7Pm+3bSalMEFoLMRZ3S//H0pokBCceHHqxqtLnLIrJ2Av/mVPn83u6FMPPE+ytx4dDY5Vy1Gqw9FnyzfN//rQNWErJ73yd0tFHkzJHKyU2zbg24+s0czGNybbiueXT1HDsIJVLU2MR3n7ux5QOtF7RNkN0MSw5S7HoNzEi4csM3FIvks7i+mEc9rjp1/PlRP9eSshunoZb9t8C/rh75b47RiTI3m3wre2Bk6dcEA1Q2T07UqX4TDYxMbuxgj+OufcRZGqLuTC0Lm4UIQG71DozmEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DSWPR11MB9690.namprd11.prod.outlook.com (2603:10b6:8:356::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 09:42:34 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 09:42:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Oct 2026 11:42:28 +0200
Message-ID: <DM4GOOY2F8D7.1RBHG2IGLKI7N@intel.com>
CC: <tvrtko.ursulin@igalia.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: David Francis <David.Francis@amd.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261007141209.2928162-1-David.Francis@amd.com>
In-Reply-To: <20261007141209.2928162-1-David.Francis@amd.com>
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DSWPR11MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ae23f4-e19a-4fed-8bdb-08df29d7794d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|22082099003|18002099003|11063799006|261009223027099003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: wM3sww2FI2MHuwLfJrx+2we+w+wux8pBD8/wA6UjWuZ4D86dixnWIhua6rHeKs74Ik93/FcVgi8MXnWpswce1lr6+5t9fPat8e8UOO5JopA3kIF8OZpT+PFYgZBnGBUYJPITfMT8vvWZeQf1ipfW8q/exX5nBCtRjLnNYDbKGNWHmLkRWNm+YsyZMQFRP9fosmnjhiXXmDu095jiypfj9pCbbEh5x182dgI4DCXds/J+TRyahVM+APdGhivgWGUqLOdOZyeGf2Vhs8VfYx2GZo2kkx3H6nE7OvA3PL1H/QUkLRd/yd2Y4+hHjTwZ5TF0DESfUuYTNyIug2D/Bft0YsXK4yWkSQQdBZ3nQw12e47ZenEhEwI+79smeluTsP2ouXPEjdYKKFiKfnPjBsDjB1Uv9S+fEl5G6yJtoGJ3GZM6UINT2qB9b1lBdz6jtfs04xZuoqMDSTQq6TEdcey+DYc8cnJ41ZnTghnbmMgNX2czZt3+KxD9ZVfmEqrb7zhrYYd+4PdsmXfDJXcKhlsKBBzp0dqM2iNESwmIa42/69XyJJGcxZOFHZoEPIEipNEeCnZ0wkuJ9FWa8DsgLo7VOnFCuBe1HAsImK7iOt+EBKYpNaoya8sWcFFVeNy4Byzp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(261009221227099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTNzcW0yYks5NElab0hXQ3VCaWFhMWx5RzBoUTFycENlbEJPZ3NpNzhMYWVJ?=
 =?utf-8?B?cnFPVEdXOExaaVVmZXB5V0MzbzZiNnFsWVVQSVV5MzZSN0N2bnF6TXNYZjZh?=
 =?utf-8?B?Q1dVdUY2aXl2QzVvbHA3aUlzWHdlaitFcDZHNFRlMlBHU2krZnhVb2JZTFB0?=
 =?utf-8?B?dGRYajJEZWN3Zlk1Z0lqd0M4TkNjUWZaWElweDRPSDJVZ2pEOTRKWExCbTR2?=
 =?utf-8?B?MnpLYTcvQjg3dGNtQmEwWW51dE5wMUY3UzE1SFdGeVFLY1pOVy9rNldhYnlG?=
 =?utf-8?B?RDNBZnBQby95YWNsWS9tSzJjQmpkSlF6cVJVczNpd1Yxc2hMREpIWmNURjAr?=
 =?utf-8?B?YjZXcUVuNy9IcTJkZHZxQXFJZ1ZKWlVOWDZNaCtZNmFoZURqN3ZzTCtsYXFJ?=
 =?utf-8?B?MFpPOHY0aXBvSzM3ejhUd2NPN05vdVZQNnY3bVNMWm5CdWFjVEE1enk5SStD?=
 =?utf-8?B?Q1BtelVCNzFqRkRzUi91REJ1SE1pM2VIcFNaNHFOelBhdCtCbFBQNW1HckNK?=
 =?utf-8?B?R1U1S1ZxQUhFUk1PVFpNY29wZlQ5c3RFcll1YkIwb093VTdJL3EvS0hwRFRM?=
 =?utf-8?B?aFl5Q3dLY1NnS2d3em1uTXVJbEZDR0JkK3phc1pPY3JhZTdSOXQxN1pGUXJh?=
 =?utf-8?B?dU1CamFuMXM3WDRJa2YrRVUzWlprUUFVRlFsTExwK3RHOTF4am1Ba1hWVmNZ?=
 =?utf-8?B?eS9sNFhiT1FhWC8zQURYWFQ4ZHFBMzBQZVB2TFRBazVkMjVOSVhBL3M3UUM2?=
 =?utf-8?B?bWpKamdzNXZVSng3bUwvR2dYTlByM0N4dUU3OFlWYjc0dm5abFVRcnlHL3I1?=
 =?utf-8?B?L2tpQnJYaFNZVjNPNkNwZHpoQlBhQ0VSajdlZ3VaaVRFQ1hocVE3UG8yTFRu?=
 =?utf-8?B?dTR2UDByUWlDeUliTTVTUGhPY054K0lvZ2JwNkRYQ1IvK1J0OUJLazJlUlVW?=
 =?utf-8?B?OEVIOW11SEhNVHo1RFZ4ZkcydnRHS0RRRVFBN2YxZFpDaG0xMFc2QzNPeHYy?=
 =?utf-8?B?dlVrbXRDYmFkRzE3WGVxbmc2U2kxR3IzVGtzKzNPZGRweDZrWS9vSjlMb292?=
 =?utf-8?B?Q1FLUTlxeWhpdktLVXAxMWNnczhQNXpEVHdVekp6cS9JdjF0NDJ4QlNBTnRn?=
 =?utf-8?B?VEhsRkF5M1hlNVJCbUNibEY2c0NxaTNZZHJrVUl5STlFMDMrRXczeFhHSm1i?=
 =?utf-8?B?aS9Ra2E1TkJrczMreS9ScDNib2QvaFIwa2hNcGRBZS9vRU5nb0dQcmo4TlNW?=
 =?utf-8?B?MFBQZU41MzdLWDJmMjFPK0hzNmxua1NhR25hdnFuTUxFMThkN1VYditlM24w?=
 =?utf-8?B?V1lqYmVvSzBQNzlFcStyajV6L2RBakhaNXlPY1U0Zk5DZ3lJZmxZaHRycU55?=
 =?utf-8?B?cHpYZ2JKMXA5VjdtN1B3TVA3am1mMEtTSk10Zk0wYmFBeUpxT29aa0txR0w3?=
 =?utf-8?B?ZVdlVDR1NElzTzNEWGEySC9KSXBlU29NMmNDTjQ3QWV1SW1xZXZoNGtwdVY1?=
 =?utf-8?B?dFpiNHB2Zmg5MjZyZjZ2Q1hTV2UyWkVWaXlMdVlZd0NnVitKRlVqT0E1UXpt?=
 =?utf-8?B?TGdEckxWUVowRnZkYWdEUk1ZVVQzSU1hcnNGdGNXbDZQKys1TTZscDFhclda?=
 =?utf-8?B?ZHI3YkNUWTlrL1UvOHVlUCt1R3FxT1RvMW93d291YjhtMDNMWmw5UXV3ODJP?=
 =?utf-8?B?cUVnZ0M4eHZTR1VpYm5JVWU5Z0ExR2tIZzZYMUk2N2x0dlJJMVE0Z1RNNDBi?=
 =?utf-8?B?eUJickxYdWdmYkphUWY3cDFaYnVLbmJxYmdXTDRVcTFLbVBYY24wNW5rSnN3?=
 =?utf-8?B?U0JPdHlJdUdNdlBvU1NVYlJ4WGlxdTZNWlN1SENEQU85dmNJL05oVjVmWnBV?=
 =?utf-8?B?QmlsQktJMmZ1MnFHaDVBRTRjQU91WUx5NWRyb25IUklKSkVSdzM0dlJFNllu?=
 =?utf-8?B?Ly9ZeGZJbzdzc2tzNFgwZGk2ZkJFdW9Kc2xXNVgwK1VVWUNUZ0tQWFE2cWpV?=
 =?utf-8?B?bmZqQjNXU0RPRjhCam9NUXM5TFEyN0VDZk5SZU9Za2J3dEhTdEIyYkoySjBH?=
 =?utf-8?B?NUVyQmEramdyZVo3dkpEeDdQKzI0ZGdEMU5SdTVHNTZKV2xUZzA3SVoyVDlZ?=
 =?utf-8?B?TmtNeUNhYmpPUFhVL3MvV1Y3elNMOU5CL0FWN0NnM0ExZk5mNnB4N0ZwaytW?=
 =?utf-8?B?TXdpK3dMLzV5dm5XTGJQWXQ4ZGlQUXRjT1FUQlNlNHJwQi9HSE9SbTVJUWth?=
 =?utf-8?B?QmJxak1wVkJFZkVvSE1nZExDUzB6T0NySEpMNHk3cUdHbnRCU1VFb0JjUCtS?=
 =?utf-8?B?MVRvYUlPYTgzSENPc0JmNlpLZUNpMkcvbEkvejFLUzdqblFIdUcyN2lEeEIz?=
 =?utf-8?Q?5bG5CBPi1HzsApKo=3D?=
X-Exchange-RoutingPolicyChecked: l22Qk2dCOlQKhh+1GqK0kBZpuF0w7JQO7SZ8bPbGlH3cnCPOgHh1ohF0sU3DjeAslgqcBfSttkrU+F1QxDNqGNtEoFnaV6Z7Ki0tGoB13soSsQjqxbgq6ZY7HQf8u+ZxrWwElps181wUaeFk4BDoACs0wlhN87YHslwYZngGy5t77aulPZa+ixvNtnTfkJet19lyyxV54sV2vjaCgKy5qsS/GSfDetpbGAAl4TyTkbrl+YCBezINchmiM4K0Y2wShj8q6tpu6IjJIdX/fRpF8DyjxzvJtevJerBa99mr8HvHK0Dc4n8KuQOOvMSwcpYwEtexg6y/uqR3t0k89OP+NA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ae23f4-e19a-4fed-8bdb-08df29d7794d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:42:34.2590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wL0zxTSekHmfI5W919iOSnU8FYgHB5mgFl8NhZXA3HFaqJ43mrP3VjVyA5w8FSU+1eIsumEUhEtDTwgX98hckia18XU4/b9DGLBhgXFOIK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9690
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi David,

On Wed Oct 7, 2026 at 4:12 PM CEST, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
>
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This =
IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
>  tests/meson.build               |   1 +
>  2 files changed, 748 insertions(+)
>  create mode 100644 tests/intel/gem_change_handle.c
>
> diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_han=
dle.c
> new file mode 100644
> index 000000000..23f2f8b39
> --- /dev/null
> +++ b/tests/intel/gem_change_handle.c
> @@ -0,0 +1,747 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2026 Advanced Micro Devices, Inc.
> + * Copyright 2026 Intel Corporation
> + *
> + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> + *
> + * NOTE: This test is located in tests/intel/ directory because:
> + * 1. All gem_* tests are traditionally placed in tests/intel/ regardles=
s
> + *    of GPU vendor, following IGT convention for GEM-related tests
> + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object crea=
tion
> + *    on Intel platforms, though it works vendor-agnostically via DRM co=
re
> + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functio=
nal-*)
> + *    were proposed by Simona Vetter (Intel), hence Intel copyright head=
er
> + *
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
a
It looks like fcntl is not used anymore.

> +#include <limits.h>
> +#include <pthread.h>
> +#include <sched.h>
> +#include <semaphore.h>
same here

> +#include <signal.h>
and here
> +#include <string.h>
> +#include <sys/stat.h>
and here, please double check it, I may have missed some usage.

> +
> +#include "igt.h"
> +#include "igt_device.h"
> +#include "i915/gem.h"
> +#include "i915/gem_create.h"
> +
> +/* AMDGPU includes (if available) */
> +#if __has_include("igt_amd.h")
> +#include "lib/amdgpu/amd_memory.h"
> +#include "igt_amd.h"
> +#define HAS_AMDGPU 1
> +#else
> +#define HAS_AMDGPU 0
> +#endif
> +
> +#define BO_SIZE (16 * 1024)
> +#define RACE_DURATION_SEC 1
> +
> +static bool verbose_logging;
> +
> +/**
> + * TEST: gem change handle
> + * Description: tests for drm ioctl GEM_CHANGE_HANDLE
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: GEM handles
> + * Functionality: gem change handle
> + * Feature: gem
> + * Run type: FULL
> + *
> + * SUBTEST: sanity
> + * Description: Changing a handle to a new value works as intended
> + *
> + * SUBTEST: change_prime
> + * Description: Changing a handle affects the result of prime import
> + *
> + * SUBTEST: new_handle_zero
> + * Description: Changing a handle to 0 should fail
> + *
> + * SUBTEST: new_handle_exceeds_int_max
> + * Description: Changing a handle to > INT_MAX should fail
> + *
> + * SUBTEST: new_handle_equals_old_handle
> + * Description: Changing a handle to itself should fail
> + *
> + * SUBTEST: new_handle_taken
> + * Description: Changing a handle to a value already in use should fail
> + *
> + * SUBTEST: invalid_handle
> + * Description: Changing a non-existent handle should fail
> + *
> + * SUBTEST: race_change_change
> + * Description: Test for race conditions between two GEM_CHANGE_HANDLE
> + *
> + * SUBTEST: race_change_create_close
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, GEM_=
CREATE, and GEM_CLOSE
> + *
> + * SUBTEST: race_change_export_import
> + * Description: Test for race conditions between GEM_CHANGE_HANDLE, prim=
e export, and prime import
> + */
> +
> +IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANGE_=
HANDLE");
> +
> +/* Structs */
> +
> +/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers=
 */
> +#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
> +struct drm_gem_change_handle {
> +	__u32 handle;
> +	__u32 new_handle;
> +};
> +
> +#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_cha=
nge_handle)
> +#endif
> +
> +/* Driver type detection */
> +enum gpu_driver {
> +	DRIVER_TYPE_UNKNOWN =3D 0,
> +	DRIVER_TYPE_I915,
> +	DRIVER_TYPE_AMDGPU,
> +};
> +
> +/* GPU context structure */
> +struct gpu_ctx {
> +	int fd;
> +	enum gpu_driver driver;
> +};
> +
> +/* Helpers */
> +
> +static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
> +{
> +	uint32_t handle =3D 0;
> +
> +	switch (ctx->driver) {
> +	case DRIVER_TYPE_I915: {
> +		struct drm_i915_gem_create create =3D { .size =3D size };
> +
> +		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
> +		handle =3D create.handle;
> +		break;
> +	}
> +	case DRIVER_TYPE_AMDGPU:
> +#if HAS_AMDGPU
> +		handle =3D igt_amd_create_bo(ctx->fd, size);
> +#else
> +		igt_require_f(0, "AMDGPU header not found for AMDGPU driver\n");
> +#endif
> +		break;
> +	default:
> +		igt_assert_f(0, "Unsupported driver\n");
> +	}
> +
> +	igt_assert(handle !=3D 0);
> +	return handle;
> +}
> +
> +static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
> +{
> +	struct drm_gem_close close_args =3D { .handle =3D handle };
> +
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
> +}
> +
> +static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, u=
int32_t new_handle)
> +{
> +	struct drm_gem_change_handle args =3D {
> +		.handle =3D old_handle,
> +		.new_handle =3D new_handle,
> +	};
> +	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
> +}
> +
> +static enum gpu_driver detect_driver(int fd)
> +{
> +	/* Check AMDGPU first (primary target) */
> +	if (is_amdgpu_device(fd))
> +		return DRIVER_TYPE_AMDGPU;
> +	if (is_i915_device(fd))
> +		return DRIVER_TYPE_I915;
> +	return DRIVER_TYPE_UNKNOWN;
> +}
> +
> +/* Sanity and Functionality tests */
> +
> +/**
> + * test_sanity - verify rename actually works
> + *
> + * After a successful rename:
> + * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
> + * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
> + */
> +static void test_sanity(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle, new_h;
> +	int ret;
> +
> +	handle =3D gem_create_bo(ctx, 4096);
> +	new_h =3D handle + 1000;
> +
> +	/* Perform the rename */
> +	ret =3D gem_change_handle(ctx, handle, new_h);
> +	igt_assert_f(ret =3D=3D 0,
> +		     "gem_change_handle(%u -> %u) failed: %s\n",
> +		     handle, new_h, strerror(errno));
> +
> +	/* Old handle must be invalid now */
> +	ret =3D gem_close_bo(ctx, handle);
> +	igt_assert_f(ret < 0 && errno =3D=3D EINVAL,
> +		     "GEM_CLOSE(old_handle=3D%u) should fail with EINVAL, "
> +		     "got ret=3D%d errno=3D%d (%s)\n",
> +		     handle, ret, errno, strerror(errno));
> +
> +	/* New handle must be valid */
> +	ret =3D gem_close_bo(ctx, new_h);
> +	igt_assert_f(ret =3D=3D 0,
> +		     "GEM_CLOSE(new_handle=3D%u) should succeed, "
> +		     "got ret=3D%d errno=3D%d (%s)\n",
> +		     new_h, ret, errno, strerror(errno));
> +}
> +
> +/**
> + * test_change_export - changing a handle affects prime import
> + *
> + * Importing a prime object that has had its handle changed since it was
> + * exported should get the new handle
> + */
> +static void test_change_export(struct gpu_ctx *ctx)
> +{
> +	int ret, handle1, handle2, dmabuf_fd, imported_handle;
> +
> +	/* Create a handle and export it */
> +	handle1 =3D gem_create_bo(ctx, 4096);
> +	handle2 =3D handle1 + 1;
> +	dmabuf_fd =3D prime_handle_to_fd(ctx->fd, handle1);
> +
> +	/* When you import, you get the same handle back */
> +	imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +	igt_assert_eq(imported_handle, handle1);
> +
> +	/* Change the handle (should succeed) */
> +	ret =3D gem_change_handle(ctx, handle1, handle2);
> +	igt_assert_eq(ret, 0);
> +
> +	/* Import, should get the new handle */
> +	imported_handle =3D prime_fd_to_handle(ctx->fd, dmabuf_fd);
> +	igt_assert_eq(imported_handle, handle2);
> +
> +	/* Confirm gem object is at the new handle */
> +	igt_assert_eq(gem_close_bo(ctx, handle2), 0);
> +
> +	ret =3D gem_close_bo(ctx, handle1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	close(dmabuf_fd);
> +}
> +
> +/* Edge case and fail case tests */
> +
> +/**
> + * test_new_handle_zero - new_handle =3D 0 should fail
> + *
> + * 0 is not a valid gem handle.
> + */
> +static void test_new_handle_zero(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle =3D gem_create_bo(ctx, 4096);
> +
> +	/* new_handle =3D 0 must fail with -EINVAL */
> +	ret =3D gem_change_handle(ctx, handle, 0);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
> + *
> + * The kernel enforces an idr_alloc() limitation: new_handle must be <=
=3D INT_MAX.
> + */
> +static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle =3D gem_create_bo(ctx, 4096);
> +
> +	/* new_handle > INT_MAX must fail with -EINVAL */
> +	ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Also test 0xFFFFFFFF */
> +	ret =3D gem_change_handle(ctx, handle, 0xFFFFFFFF);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_equals_old_handle - new_handle =3D old_handle should =
fail
> + *
> + * The ioctl treats old_handle =3D new_handle as invalid input.
> + */
> +static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle;
> +	int ret;
> +
> +	handle =3D gem_create_bo(ctx, 4096);
> +
> +	/* new_handle =3D old_handle must fail with -EINVAL */
> +	ret =3D gem_change_handle(ctx, handle, handle);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* same thing if handle doesn't exist */
> +	ret =3D gem_change_handle(ctx, handle + 1, handle + 1);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	/* Original handle should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +}
> +
> +/**
> + * test_new_handle_taken - new_handle being the handle of another gem ob=
ject must fail
> + *
> + * Not allowed to change a handle to a handle that's already taken
> + */
> +static void test_new_handle_taken(struct gpu_ctx *ctx)
> +{
> +	uint32_t handle, handle_2;
> +	int ret;
> +
> +	handle =3D gem_create_bo(ctx, 4096);
> +	handle_2 =3D gem_create_bo(ctx, 4096);
> +
> +	/* new_handle is taken must fail with -ENOSPC (direct from idr_alloc) *=
/
> +	ret =3D gem_change_handle(ctx, handle, handle_2);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOSPC);
> +
> +	/* And the other way */
> +	ret =3D gem_change_handle(ctx, handle_2, handle);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOSPC);
> +
> +	/* Original handles should still be valid */
> +	igt_assert_eq(gem_close_bo(ctx, handle), 0);
> +	igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
> +}
> +
> +/**
> + * test_invalid_handle - non-existent handle should fail
> + *
> + * Using a handle that doesn't exist should return -ENOENT.
> + */
> +static void test_invalid_handle(struct gpu_ctx *ctx)
> +{
> +	int ret;
> +
> +	/* Use a handle that was never allocated */
> +	ret =3D gem_change_handle(ctx, 0xDEAD, 0xBEEF);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOENT);
> +
> +	/* Handle 0 is also invalid */
> +	ret =3D gem_change_handle(ctx, 0, 100);
> +	igt_assert(ret < 0);
> +	igt_assert_eq(errno, ENOENT);
> +}
> +
> +/* Race condition test structs and helpers */
> +
> +struct change_handle_thread_data {
> +	struct gpu_ctx *ctx;
> +	uint32_t handles[4];
> +	bool running;
> +	int unexpected_errno;
> +	pthread_barrier_t barrier;
> +};
> +
> +static void set_up_context(struct change_handle_thread_data *data, struc=
t gpu_ctx *ctx)
> +{
> +	data->handles[0] =3D gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(data->handles[0] !=3D 0);
> +	data->handles[1] =3D gem_create_bo(ctx, BO_SIZE);
> +	igt_assert(data->handles[1] !=3D 0);
> +
> +	data->ctx =3D ctx;
> +	data->handles[2] =3D max(data->handles[0], data->handles[1]) + 0x10;
> +	data->handles[3] =3D max(data->handles[0], data->handles[1]) + 0x20;
> +	data->unexpected_errno =3D 0;
> +	__atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
> +
> +	pthread_barrier_init(&data->barrier, NULL, 2);
> +}
> +
> +/* Race condition test threads */
> +
> +static void *change_handle_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data =3D arg;
> +	uint32_t *h =3D data->handles;
> +	int from[] =3D {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2], h=
[1], h[0], h[2]};
> +	int to[] =3D   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0], h=
[3], h[3], h[1]};
It may be a nit, but from[] and to[]=C2=A0are=C2=A0int while holding uint32=
_t
values, it would be good to unify the types.

> +	int ret;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		for (int i =3D 0; i < 12; i++) {
> +			ret =3D gem_change_handle(data->ctx, from[i], to[i]);
> +			/*
> +			 * Expected errors:
> +			 * - ENOENT: old handle invalid
> +			 * - ENOSPC: target handle occupied (collision detected during idr_al=
loc)
> +			 */
> +			if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D ENOSPC)
> +				data->unexpected_errno =3D errno;
> +		}
> +
> +		sched_yield();
> +	}
> +
> +       return NULL;
spaces instead of a tab

> +}
> +
> +static void *close_recreate_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data =3D arg;
> +	uint32_t *h =3D data->handles;
> +	pthread_t tid =3D pthread_self();
> +	int handle, i, ret;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Close a handle; keep trying until success */
> +		i =3D 0;
> +		while (true) {
> +			ret =3D gem_close_bo(data->ctx, h[i]);
> +			if (ret =3D=3D 0) {
> +				if (verbose_logging) {
> +					igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
> +						 (unsigned long)tid, h[i]);
> +				}
> +				break;
> +			}
> +
> +			i +=3D 1;
> +			if (i > 3)
> +				i =3D 0;
> +
> +			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +				return NULL;
> +		}
> +
> +		/* Open a handle */
> +		handle =3D gem_create_bo(data->ctx, BO_SIZE);
> +		if (verbose_logging) {
> +			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +
> +		/* If the opened handle isn't one of the four ones being
> +		 * shuffled, change_handle it in. Keep trying until success.
> +		 */
> +		if (handle !=3D h[0] && handle !=3D h[1] && handle !=3D h[2] && handle=
 !=3D h[3]) {
> +			i =3D 0;
> +			while (true) {
> +				ret =3D gem_change_handle(data->ctx, handle, h[i]);
> +				if (ret =3D=3D 0) {
> +					if (verbose_logging) {
> +						igt_info("[CLOSE-TID:%lu] Change handle %u to %u\n",
> +							 (unsigned long)tid, handle, h[i]);
> +					}
> +					break;
> +				}
> +
> +				if (ret !=3D 0 && errno !=3D ENOENT && errno !=3D ENOSPC)
> +					data->unexpected_errno =3D errno;
> +
> +				i +=3D 1;
> +				if (i > 3)
> +					i =3D 0;
> +
> +				if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +					return NULL;
> +			}
> +		}
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +static void *export_import_thread(void *arg)
> +{
> +	struct change_handle_thread_data *data =3D arg;
> +	struct drm_prime_handle prime_args;
> +	uint32_t *h =3D data->handles;
> +	pthread_t tid =3D pthread_self();
> +	int handle, i, ret, dmabuf_fd;
> +
> +	pthread_barrier_wait(&data->barrier);
> +
> +	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
> +		/* Export a handle; keep trying until success */
> +		i =3D 0;
> +		while (true) {
> +			prime_args.handle =3D h[i];
> +			prime_args.flags =3D DRM_CLOEXEC | DRM_RDWR;
> +			ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime=
_args);
> +			if (ret =3D=3D 0) {
> +				if (verbose_logging) {
> +					igt_info("[PRIME-TID:%lu] Exported handle %u\n",
> +						 (unsigned long)tid, h[i]);
> +				}
> +				break;
> +			}
> +
> +			i +=3D 1;
> +			if (i > 3)
> +				i =3D 0;
> +
> +			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
> +				return NULL;
> +		}
> +
> +		dmabuf_fd =3D prime_args.fd;
> +
> +		/* Import the handle; it should be one of the four handles in the shuf=
fle */
> +		prime_args.fd =3D dmabuf_fd;
> +		prime_args.flags =3D 0;
> +		ret =3D igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_=
args);
> +
> +		igt_assert_eq(ret, 0);
I don't think you can assert in a worker thread. It doesn't return
cleanly.

> +		handle =3D prime_args.handle;
> +		if (verbose_logging) {
> +			igt_info("[PRIME-TID:%lu] Imported; got handle %u\n",
> +				 (unsigned long)tid, handle);
> +		}
> +		igt_assert(handle =3D=3D h[0] || handle =3D=3D h[1] || handle =3D=3D h=
[2] || handle =3D=3D h[3]);
Same here.

> +
> +		close(dmabuf_fd);
> +
> +		sched_yield();
> +	}
> +
> +	return NULL;
> +}
> +
> +/* Race condition tests */
> +
> +/**
> + * test_race_change_change - Test for race conditions of change_handle a=
gainst itself
> + *
> + * Start two threads, each of which constantly attempt changes between f=
our different handles
> + * Try to catch race conditions such as changing same handle to two diff=
erent handles,
> + * Changing two handles to the same handle, changing a handle to a handl=
e itself being changed,
> + * etc.
> + */
> +static void test_race_change_change(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change_1, thread_change_2;
> +	struct change_handle_thread_data data =3D {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handle_thre=
ad, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handle_thre=
ad, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change_1, NULL);
> +	pthread_join(thread_change_2, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Exactly two gem objects should still exist */
> +	num_handles =3D 0;
> +	for (int i =3D 0; i < 4; i++) {
> +		ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret =3D=3D 0) {
> +			num_handles +=3D 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert_eq(num_handles, 2);
> +}
> +
> +/**
> + * test_race_change_create_close - Test for race conditions of change_ha=
ndle against gem create / close
> + *
> + * Start two threads, one of which attempts to change between four handl=
es while the other alternates
> + * closing a gem handle and creating new ones. Test for race conditions =
such as change a handle that's
> + * being closed or change a handle to a value that's being created.
> + */
> +static void test_race_change_create_close(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_create_close;
> +	struct change_handle_thread_data data =3D {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread=
, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_create_close, NULL, close_recreate=
_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_create_close, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Depending on where create / close ended up, there can be 1 or 2 hand=
les open */
> +	num_handles =3D 0;
> +	for (int i =3D 0; i < 4; i++) {
> +		ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret =3D=3D 0) {
> +			num_handles +=3D 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert(num_handles >=3D 1 && num_handles <=3D 2);
> +}
> +
> +/**
> + * test_race_change_export_import - Test for race conditions of change_h=
andle against prime export / import
> + *
> + * Start two threads, one of which attempts to change between four handl=
es while the other exports
> + * handles, then imports them again. Check for race conditions such as c=
hanging a handle while exporting
> + * it or important a handle while changing it.
> + */
> +static void test_race_change_export_import(struct gpu_ctx *ctx)
> +{
> +	pthread_t thread_change, thread_export_import;
> +	struct change_handle_thread_data data =3D {0};
> +	int num_handles, ret;
> +
> +	set_up_context(&data, ctx);
> +
> +	/* Start both threads simultaneously */
> +	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread=
, &data), 0);
> +	igt_assert_eq(pthread_create(&thread_export_import, NULL, export_import=
_thread, &data), 0);
> +
> +	/* Let them race */
> +	sleep(RACE_DURATION_SEC);
> +
> +	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
> +	pthread_join(thread_change, NULL);
> +	pthread_join(thread_export_import, NULL);
> +
> +	pthread_barrier_destroy(&data.barrier);
> +
> +	igt_assert_eq(data.unexpected_errno, 0);
> +
> +	/* Exporting a handle doesn't close it, so should still be exactly 2 */
> +	num_handles =3D 0;
> +	for (int i =3D 0; i < 4; i++) {
> +		ret =3D gem_close_bo(ctx, data.handles[i]);
> +
> +		if (ret =3D=3D 0) {
> +			num_handles +=3D 1;
> +		} else {
> +			igt_assert_eq(errno, EINVAL);
> +		}
> +	}
> +	igt_assert_eq(num_handles, 2);
> +}
> +
> +int igt_main()
> +{
> +	struct gpu_ctx ctx =3D { .fd =3D -1 };
> +
> +	igt_fixture() {
> +		ctx.fd =3D drm_open_driver_render(DRIVER_ANY);
> +		igt_require(ctx.fd >=3D 0);
> +
> +		ctx.driver =3D detect_driver(ctx.fd);
> +		igt_require_f(ctx.driver !=3D DRIVER_TYPE_UNKNOWN,
> +			      "Unsupported GPU driver\n");
> +
> +		if (ctx.driver =3D=3D DRIVER_TYPE_I915)
> +			igt_require_gem(ctx.fd);
> +	}
> +
> +	igt_describe("Sanity Test: Change handle actually changes handle");
> +	igt_subtest("sanity")
> +		test_sanity(&ctx);
> +
> +	igt_describe("Functinality Test: Change handle affects result of prime =
import");
/Functinality/Functionality/

> +	igt_subtest("change_prime")
> +		test_change_export(&ctx);
> +
> +
> +	igt_describe("Edge Case: New handle =3D 0 should fail");
> +	igt_subtest("new_handle_zero")
> +		test_new_handle_zero(&ctx);
> +
> +	igt_describe("Edge Case: New handle > INT_MAX should fail");
> +	igt_subtest("new_handle_exceeds_int_max")
> +		test_new_handle_exceeds_int_max(&ctx);
> +
> +	igt_describe("Edge Case: Changing a handle to itself should fail");
> +	igt_subtest("new_handle_equals_old_handle")
> +		test_new_handle_equals_old_handle(&ctx);
> +
> +	igt_describe("Edge Case: Change a handle to a value which is taken shou=
ld fail");
> +	igt_subtest("new_handle_taken")
> +		test_new_handle_taken(&ctx);
> +
> +	igt_describe("Edge Case: Changing a non-existent handle should fail");
> +	igt_subtest("invalid_handle")
> +		test_invalid_handle(&ctx);
> +
> +
I'm not sure the extra blank line here is needed

> +	igt_describe("Race: Changing handle vs. Changing handle");
> +	igt_subtest("race_change_change")
> +		test_race_change_change(&ctx);
> +
> +	igt_describe("Race: Changing handle vs. Create / Close");
> +	igt_subtest("race_change_create_close")
> +		test_race_change_create_close(&ctx);
> +
> +	igt_describe("Race: Changing handle vs. Export / Import");
> +	igt_subtest("race_change_export_import")
> +		test_race_change_export_import(&ctx);
> +
> +	igt_fixture() {
> +		drm_close_driver(ctx.fd);
> +	}
> +
> +}
> \ No newline at end of file
Add newline at the end of the file.

> diff --git a/tests/meson.build b/tests/meson.build
> index 4f5c9be7b..ab083916d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -104,6 +104,7 @@ intel_i915_progs =3D [
>  	'gem_blits',
>  	'gem_busy',
>  	'gem_caching',
> +	'gem_change_handle',
>  	'gem_create',
>  	'gem_ccs',
>
Overall, this series looks much better now. One open question for Kamil:
since these tests exercise functionality that's currently disabled in
the kernel (drm_invalid_op), and the IGT coverage is meant to be a
prerequisite for bringing this feature back, how do we properly test it
in the meantime?

Also can you look at patchwork this changes currently failed to git am
https://patchwork.freedesktop.org/series/175696/#rev3


--=20
Best regards,
Sebastian

