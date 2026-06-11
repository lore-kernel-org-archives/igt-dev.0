Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C45CD98D2
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 11:11:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB5910E54C;
	Thu, 11 Jun 2026 11:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L3/pt0QM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0A710EE94;
 Thu, 11 Jun 2026 11:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781176271; x=1812712271;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:references:in-reply-to:mime-version;
 bh=WD6zgqtDUBe59OxZXrjZTjBJpWMEk3C+DXllsRtgJKo=;
 b=L3/pt0QMqWUhXvO44n/rW24NnpGexhUDXjMUqtiEAFosHduXRMFrGUOw
 a4PC/HJUABzhXl4GMna1GpPGgWPE2Oxz8YCtHelJ9i72FTrAWmhhSNTfa
 41M+xIkBKUXLA0cjAmnmsxfGdlYlown55hoHSeqwtzOKZpAOZRdFO2n8G
 nNsyhkqrpfOI1nqxccooXEbPa8PR05WuroMmN48zuZcaW0m2r7INNJZug
 jFNauWxb3FC63pQ/EYvAcczEi9/pq+sA97bjuJ6pmVrpFNgsm7+gVBWPV
 ofzn3PDgW2nAaFWZ2picmHD+k+p8yqFKjVOoU3uFifKKmNbJzWD2REr0T Q==;
X-CSE-ConnectionGUID: lzBqDBQyRy+RzPKzyVDFbg==
X-CSE-MsgGUID: vgBXUKqlSPCh/zBQahBw1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82092991"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="82092991"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 04:11:11 -0700
X-CSE-ConnectionGUID: t0KPMH85SSq1bgFXExfzBw==
X-CSE-MsgGUID: FVrmI1C0Q0aP24Fzef0lFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="246527829"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 04:11:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 04:11:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 04:11:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 04:11:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCpMIiTsH8CT9NLaqGqKkMXtRqs1WwcWs14ByY+r4iH/ewK0C9cQ4LZlvuoxatNhwA3UQjbyFuhvQ8qU05pvN6mscorzW74M4oQKxJX3oyEdXl7oQ1Gpp0xBlhrBNEpmnJnnutfAStc7fpfxpbUH+LyMDCu6wwXnqoCJknsh3pD2y/BhdVRqdqQNcS8A5A1u48+P02Ojfz7zSA9HWHLECLawy0tu+myTw/j2gIvffjzkgK8NaphMdu76DabEUrNmZ0tqbP70sI+K1iAH5wu9meZaZICp5J2xijrJpGWNnbs4mhEk6jkdXEPqym/CSdeybEKYKzKYUKg7/ZZnX++L2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOpdVSeT8BPzVe9ha+usn1sEpVz/PucX2KKx56/mu/0=;
 b=bX9dcX9GkY67dyJekRXxSk/ZgfhSUuzntHIt/tbmp6VPi8qFeZ7sW44Jj8z5464ClYdiI2vp9SVwSp2CAnTsZUccEYePpbM60Rrc66gSr9XrDPFLSX7zoe21gdx4/aJWZKlVer15PR0Tufdk1yxjyK+B6sZ3RJj3RGGCSA0Sf3/1rK3YL1mw2AloJzVbf5qd5Q5wU3A1oOx7jg5XxHtrnB4Wcisd3eMwepllF+huBpCjLqnKM5/eSz7C9shs+0q2TPiddW/trrcHoVkn61+1Jy8fHbIdh8Qi+JrHpch5qxW/RumgjSfRqXf/FisVxcAi00IqRsORx5Fuswu22Rfa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:11:08 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 11:11:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Jun 2026 13:11:23 +0200
Message-ID: <DJ66AOHYAJG8.27KMG46KCAI2H@intel.com>
Subject: =?utf-8?q?Re:_=E2=9C=97_Xe.CI.FULL:_failure_for_tools/igt=5Fpower:_fix_Xe?=
 =?utf-8?q?_crash_via_drmtest_path_helpers?=
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, <I915-ci-infra@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <cover.1780397630.git.sebastian.brzezinka@intel.com>
 <178044129776.36136.6785974111637637560@6beec6c84f66>
In-Reply-To: <178044129776.36136.6785974111637637560@6beec6c84f66>
X-ClientProxiedBy: DU7PR01CA0037.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::27) To SN7PR11MB6897.namprd11.prod.outlook.com
 (2603:10b6:806:2a5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: 638aa607-99af-41c5-5b2d-08dec7aa22f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|5023799004|18002099003|22082099003|56012099006|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: tuh3kM08d3jmP2ynpMPzXw7gCYKZkk3Y+2tF4s4SNH7BnYycOIs382BGHFDVsRffmFgLrEQMQ/eIGpo6Vmg7OGf0YGGNwgWQOQ1bgH9YZBicAdqjiDZPovYDzbxvfdcV6uJE7LNyNMdMU2EXuLM/wXpDBojj6A3hitjJoZ3k1g7D7k+g87dC9H7bXrfz4GFL5mJXXli/yR0WPQ3yvENMSgqwAbW/aL2qEVWJMwOPPuySdOkdiKLgqE6Nepr3TkuEqwZBsEniV5UfUp0cmV3ziYYNpD+IbN+thtZqidA05RxRIuW7CE4OQGS5XvGXpyOR7jjhHdgIFc5/2FBVMj7lI2m+ORGeGxpuOYyMtREqtOhUxe5RaxDGO8l83FhQgwXYTVGhkjZfjZYyQIH++saFcdvMaOSnSOR8q/mIfgcJddZvU1tJ2CGQK3w44PBgVun8GANjOQiGT8hi8xenSeZ8l9Msd5jKIFef4Jzw4otJHD4st3qOD0Pc5In5lWr9PioIKA3vBhv8LaTH3EfRoV7247cEk8KSg9YL9iFEDm9sLgkOZJW07AbY+qhftyB0U2kqlUlVPXi4KaFjCJs+jvD4HNq0dV5Py+Y8aQKRK0q5xsqOgZSpNJhLVTSCBivvaLj2yxhLmJNtY9dIVMsAQwbilw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(5023799004)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0VLblM2UjBPVEVxbm4ydnQ2alZlbWpleDgrMHdvVzNSTkpEWDI5OVMrOGlt?=
 =?utf-8?B?MG1PK0t1ZjhJTHRPUVNkR1dBV1lRNmZWSXdBaVZSNWNBM2ozS2M3clRlUXJq?=
 =?utf-8?B?UEJwM3Fianl0VnhSL28vbHVCS21MMnRNYXdncXIyVTkxOWdrUE5NUThyUkdT?=
 =?utf-8?B?THZsTUdnMDUvNXp5dkoxVVA0d1lrY3UvbTVVNWJLM3FpTWZ2Q1dHTnZNak8w?=
 =?utf-8?B?YTlTTFRIK3d4ODRHb1lOTEl5c2ZXWlZZWG1tOXdaZUtNWk5rdWNWMU9IbmZU?=
 =?utf-8?B?L3k3RVM1TFoxdHFhZjk4UGE0TEw0ZkNYM3o4Y2NLcTZpMGxxekdsYU1Vaitu?=
 =?utf-8?B?TjdoNGx0OWRzOHlmODRuUFVuNUFabFlrUDhoK0NnaW0yRFM5UVl2bXZrN3ZQ?=
 =?utf-8?B?WXphUzQwcUZiQ0s3eUFUMzdHdE1ORXZKRE50K21NSmN2NTZmb1loOXhvRjhx?=
 =?utf-8?B?dDBSNjdsdHQrTFNvR2ZaODlMMjlrb0h4TXFEUTQzQW1yT0l2U2JPQVdPeGJS?=
 =?utf-8?B?ZWhCU2dmeG9Yd2FjU2hnb3AxU0hMRUxadGxpOS9KL0NJMG42ZlVsbmhqb0Fj?=
 =?utf-8?B?bnpFZFZZb2Jia0diRmJTY2N2NE5nLzJObERJRXBra1JGNEU1T1N1a0R5dGc1?=
 =?utf-8?B?MTNkc29YcTErUDFRK3VtMlAyUTF5cVljL1I2OWdlQng4cUo3aHB2c0RsYzFm?=
 =?utf-8?B?T1hseDJISHpCbmhIY0toVnl3VFN6UUxtWm11N0lHK2dya2hDYzZlYjFaNm92?=
 =?utf-8?B?KzN5S0t6dHBhZlRlemhtc2lkbTBKRVA1VXhRR2VROVBiYlBDRHZKZkllOXVi?=
 =?utf-8?B?Q3JqSUpSdEI1UFpTUmhDTTNpU2FqUDRtNVk1TGFCYlREdnJCNjQ4dGlXV3Yw?=
 =?utf-8?B?SEV6d0R6cEF2dUw4YXdhdkhiMXExcXBZMUQxQTBTb01Ya0RUbTJSUUVyY05J?=
 =?utf-8?B?SlZOVTMzTytPTkdSWXlabFMyczI1cUFSUVJaWk5RYXhoakQwZ1VtWXh3NUEx?=
 =?utf-8?B?QlNOLzlta1BxQlBVdGQ4V1FMNGVwcEZ0TC9yM0V2Z3FaM2hsN3lZOUtHWHRX?=
 =?utf-8?B?L2ZrZVFJNEtFdGMycmJMeXBUUnV1YWh5Z3NLRlY5ZjZZZFl1L3drVVBtTGpa?=
 =?utf-8?B?NzN6akNxWVNYMm5ZbkFIRUNiTTFZdDZwK01IYkFsaHJTaUowWnlLTjhpRktz?=
 =?utf-8?B?NzR2czF6RG1WTmVmbnRxWVFXUm9CS3k5WnlvMFRCYlZZUFplN2M2WFJoVUUx?=
 =?utf-8?B?Q2haUzkzczJBdThycTR3eU5zVHBac3Qya1hhcVJJRlpWMVF6QkVQd3hmNVVp?=
 =?utf-8?B?d0pBNTZYbHhhYm0wV2VBTUNRK1NyV3dKSk9lNzJqZ3FvbFNXNit4QnhXUTd5?=
 =?utf-8?B?SFZhM2ZpQ2hhZU9vajlUTEhUYjZPb0RQYVNCYmhSOEgvYitsRFZYS2kxYTVq?=
 =?utf-8?B?NXVnNVBDYUtqT0tESnU4enhqaU43WlNTRkNYeElKZUd3aVRFMUkzYjhLeXBT?=
 =?utf-8?B?WnQ3dHgyT0Y4b3Nzdk1udUhzR2RLY21xcnBtaDN6MzgzWXRIdXJaajFnT0dX?=
 =?utf-8?B?N2FaU2xjUW1oTis0aTZtT21SeE5lMzZGTU50K2oxaGYvbUpjd2JZb21laXBx?=
 =?utf-8?B?SHBSRTE0SXBFcTBkK0VwN1pBbVlvdmZyeUxSVGNwbFVRYjgvcTY2MEpvakdv?=
 =?utf-8?B?d2ozVThWdFpmcTY1MWI1VjdMaW16RXYrOHhMeTVRK3c5eUc1WTUwSGpJcEJ0?=
 =?utf-8?B?Y0J2ZEtkcTUxQWQvMTlkZGZTZDR0SkU0N1phemFxU2pGcWJUZmNaaGVRNkcr?=
 =?utf-8?B?WUpQWS90MEhaUHA5bVpGcGR2OERsYWljSlJRL1Q1Z0UxUkJDTUJic1VDMUNu?=
 =?utf-8?B?RjFlQUxJN1l3bk1OUUROb3ZUc1I4S2k2emNWN1VxSnUvUWhyZ0pVTy9vL0s1?=
 =?utf-8?B?Zk5xbkE1UUVXeWt0UGFjYTBpbXZVODVxbzNyS0hHL1RWWVRFYjdURk8vLy9o?=
 =?utf-8?B?UXJjd2ZZc3BjYnFFSjduZHNvcW5udVZPM2NUczJGUjdNUEJVakFjK3Y4aXFk?=
 =?utf-8?B?VUxLT1pGM1IrcmsxNjB4NmhYZzE0enVDdWJKaW5OMldoekYyVDh0dUVpYklQ?=
 =?utf-8?B?a2k1TzZ6TXZQcXEzQ0Z6cGZ3Q0pCZUZqRDhjeGx2Y3NFZFZiMFIrTzZDa0pY?=
 =?utf-8?B?QVNrMVBod2ZzLzVsS3V2azc5T010cCt6NFBDQ1ZxQ1BmbnFPQVpNVDZEMy9a?=
 =?utf-8?B?OHJkZ3g5allRdlQyZExvc0dGUTM2VTZJVGtXdjlDNW56bUFRU3FzRkplR1hE?=
 =?utf-8?B?NlZCMjRVaDltd1E4aFlHTWxXVjY1bkZBbE1yZXE2bDU0c1EvaER2NWF2a1Uy?=
 =?utf-8?Q?PI4ZxF1hSaFBFPzs=3D?=
X-Exchange-RoutingPolicyChecked: kcbxaId8PIrj7KZb/Hrsg5beVZzZg3zEGbXBMSOpNRBqC1ZcY8rt+ue1S4CyeNqwh6x5QARCKfU0WvcIS7uzafBgiA5TGMrRZoS0yI5q7Jud3OSfHPeU+H9Tq3wZU3TyuRn9iJvL1WGLkgwBDU8McBUilL15BtFMw3s9xQmQPmRI2Bfc1skQDpKmNB8OPASfx5tVLGpZHg8ofSc97xZRiqMDKD70lu0UnbZQkGLbip4vv5UUdPLg/EqZSd4WfFWS1UzRrXsKkPJsFBSjmiqS/jNet+gspqmsThIh8hbFY5CweuxIl/9pJZlxwMs0x+7HT1bYBYwd3xryWWGmQMWONA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 638aa607-99af-41c5-5b2d-08dec7aa22f2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:11:07.9277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R990zIFSSQxjE3eLYPuzayBbE/p+5nDI3EQMNX+/oY5MEyHHmPk7r+jSZykRhBgCkA0GNqHRNEqW4TG+0LkuoBVhvjnDGk7I1G0m4TFFiKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
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

Hi ci-infra team,

On Wed Jun 3, 2026 at 1:01 AM CEST, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>
> Series: tools/igt_power: fix Xe crash via drmtest path helpers
> URL   : https://patchwork.freedesktop.org/series/167738/
> State : failure
>
> =3D=3D Summary =3D=3D
>
> CI Bug Log - changes from XEIGT_8946_FULL -> XEIGTPW_15285_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
> Summary
> -------
>
>   **FAILURE**
>
>   Serious unknown changes coming with XEIGTPW_15285_FULL absolutely need =
to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15285_FULL, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>
>  =20
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>   No changes in participating hosts
>
> Possible new issues
> -------------------
>
>   Here are the unknown changes that may have been introduced in XEIGTPW_1=
5285_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>   * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-=
10:
>     - shard-bmg:          [PASS][1] -> [SKIP][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8946/shard-bmg-5/ig=
t@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15285/shard-bmg-6=
/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.ht=
ml
>
>  =20
These failures are not related to the series. The series only resolves
the issue with the tool.

--=20
Best regards,
Sebastian

