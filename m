Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CBCCA5FD4
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 11:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2480A10E45B;
	Fri,  2 Oct 2026 11:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kw34O9yI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D49710E475
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790940865; x=1822476865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lAIOKY7Tv7gGBuyZjfosHYCih5oVA7M4kFto6FPIy1E=;
 b=kw34O9yIc5X82xw2jk+s5BeSCxXhn9I85sWxQwuo5/LieZxqWERQxI+9
 T6jrJKRM8DCVSADcqPhkiR4WJSbJHXB6ZdJgbeK+s7L1i96riF2zO9jcn
 3rv/m1gWdkiyoyAeH3Zu6UfVyEg/FkFP7YFMMvTYMm/r/bmTTXcIKAaC1
 q59C+g5JaHeZ2iRphMT4GRRU164ot4/KNAIBX02W1vw3MtWhECMb2A6QH
 tr90XzLKAQpJDzgArNghGMc3dv/OuVDZMGP4vAIFNuHLCPZNHpgRVzHM+
 U9g8HCkA0dLZUXtluMZFOB6DCtx/KBuk76GeXx2fkG8MpdBtvKrv+fBG/ A==;
X-CSE-ConnectionGUID: awemXRXLR3isS6TwHbB1xg==
X-CSE-MsgGUID: dZ56yFQAQ0yefion3M+LkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108084612"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="108084612"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:25 -0700
X-CSE-ConnectionGUID: pl7ahvhaRJSSrAaJ3Nw81Q==
X-CSE-MsgGUID: jxFjqQLTTCyK4M1b4BLSNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="279489016"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 04:34:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 04:34:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 04:34:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJdN0T1d2ITqtnfh2JUn91YS+u3BzpyjTmmXm7aJQzZkk+sOA8f3BXlagLbFwLCGNihPZFIr8sCU9PtAkeylxT38EGv4UUco2p4Ubtkq+Trllbjp1aIpSQ1WEAVrblXM8w9qWbyI2s8zxKsFO0BkYByNmWwzegWnm2wcSpljb8zXA4024b6++HDeMbqakU33rETHaFFuCSD3u1TNHYIBgSpcq2ipVJuwiFFNbhxDPf/wi6RyGSKWjF/czBUWXFc8zNKqzIkL7FUu88SlA6q3DgHAhV3x2s12tlQLh3+2CP1sbCJaH/mAPGhf3Rx31437BfL6re4BokvI7nPIumeQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwGQxnye2vwJNMN7i0XCFcHqgG27KSaLCW/BAgLNkRw=;
 b=vs3aPs5gUokJZhRULSLaTQ9cCjRhGb2DFlwzn5WrcEOgFiBTGYpDVnaDRrVobkRZr/VVN/19EnFeQeHWkt8LVNjyYnxeYVtQRWFzq+a7a2ZnSWCB67GJeVZ0V060XQipe73LMZN6hXHCxyBFmnsDVjkv9ttpquESyC/eQYs13zrKdBGp49f0aYzIM0g/fWauc+afWGKup7mFBOxClGwMDTP9/tqr+hKAQSHLkE8uG887zq+wDrmWpbRADja3zvvMt2uA6JTwJVa9Hxb7BeoT4CN2f3PvVfu1gPL84fWbAeY8sndt0PJJFMcA08+e6RbhamEc6YJga4k2KQhE2N3Tig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CY8PR11MB6868.namprd11.prod.outlook.com (2603:10b6:930:5c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 2 Oct
 2026 11:34:23 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 11:34:23 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: [PATCH v4 4/4] intel-ci: Block igt@sriov_pci_config.*
Date: Fri, 2 Oct 2026 13:33:56 +0200
Message-ID: <20261002113356.3652805-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
References: <20261002113356.3652805-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CY8PR11MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a1194f-1190-4779-5380-08df20791b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|10067099003|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: oU7qrgA52AF6HyMWZS6t/I6oxfbTZz0TiqfZqh9l8wMhg+UE2qp+04lc8LcVrNQ4FO6ib+Vf1akBNiYPXGgGDdnoVsoLCUI0oQYbGYWNd0cnfbI1p6XjViDY9NzoulWcQsuEAMAjGcFw3Xx4V7acfgBgjXsuGmhL3WRt8wPwORrKG+xYNLbMcZqxoPuTuxSxsDPmPKjdPGLa1ZFoPbK9a4SNR3jLWnElQRSEwMAoDcn69TMluTj8g0Wp1KoZ7udbPA3MzMUowS2DaBOcC5n6x1rxWeBK4H5IxFlO5cB9NZT3jsEWjOihyhcaJuAZzrZShLAv6C5UrcAKbxmECCUUV7WpC155jB/ddoKP2CY6kkNEkZ3v4kB9dQUzIvJ93b6VMLsUzsEBGrEI1EJe8Cy6yHtIwvgU0DMlDo97NIcHbKsaftLjboii2eeFbG9yceziyoip+9BvJSgJztpuisk9KUwoxf1uIh+6XjfjouJaJ33FK5j1Bmtn8G7h5rVkpisKNyJ+2C7GSipxn+b4Vjoi7blL+SSgasPVNfPrBo5aIo7ddEuwwJct3uocxwXl83UU3DnEaW0mb0M4NLWslEx4haIc/P+dTTXuQCvB244JTHQP3FgvLHB9/L5C/bsnxvJGyE2Sh2HZAylVvCy4Xr92fA6J23nlBYFBSm2T4QrMeZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(18002099003)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2pEQmw5czVERUFSdzR5Yk16V2E4TjNNV1FtQTZVeHhnTUN6TjRERWF5ajQ0?=
 =?utf-8?B?c3BzbjZzQXdWbG5rbmlqWTZEdzdZSWthTVhFRlc4aXVnSVlzbWNxTkx1b1pM?=
 =?utf-8?B?OGZ0L2UwWkQ3MlZkdDZJMExPS0VqYmlXRFpkcmRwb2hrZGpDQ2svNHVJS0Ru?=
 =?utf-8?B?aER6ZWQzT0lydU9oYUl2aUJ6RXdSRnFObStLM1AybmZPc09lS2VROW1saHFW?=
 =?utf-8?B?RGgvOHQzYnJHWlhqZjBLSGlWNzdCZkJ0MWJ3UnRZVlBSNkphSTRhRk5GTFJM?=
 =?utf-8?B?OUFlMDZJNzRnZWpyQ2hBcEoxN1pHZEZvVXU3RnBwTGZHVXVlT2NISmlPZ0k3?=
 =?utf-8?B?WS9pLzJRS0xTbkdQdVlaWXZXZ0lYYkdtNWhXZHd0eXJqZmh0NDd0YmJveWpx?=
 =?utf-8?B?TktWZmVFbGxCSGx6RENBT1NvVkQ0c29HeGp3dFIySVAvdi9Ydm5QL1pZQlJ4?=
 =?utf-8?B?MVJKVGViSkV6VHJTcC9CdHNTVU5YVDl0WFJ5ZjJmaTVLVHdEaDBtV2RrdXRn?=
 =?utf-8?B?eFRyN01yRUN0RFNtZ2NUVE92SlZISGhMRTNiYVJLblBPN0NRVUFUQ05vVFZz?=
 =?utf-8?B?L01ITlovb3FQNncxb2x3MjB4d0h6c2FtVTFoNmVOMmJTSjQvSFZ2OU02a2sx?=
 =?utf-8?B?ZlBTeHdoYnJLTFhvcEt0UkFVckpwcThzQVVEOGFGTVpETGFzbytFNFh0WVEy?=
 =?utf-8?B?SUNrNGpNM2Jna1BqTzJWQktGTml4dHVERWJSdS9laFRhL2YwZTgwbVR4VEF4?=
 =?utf-8?B?enFyeHh0dVZIQzRjNlhFeWpyYVhia0NRRjJiZzZqOERQeFIwUmVtaGJRZUZC?=
 =?utf-8?B?bEdham03eENtZmNrSUJDa0tEVWMzZTl1QkQvYVdnYmoveWFrMTlSQVNyWU9Y?=
 =?utf-8?B?enRrQXJXajlnTlV2T0lPd2dGY2U0SW9ZdjRJbys2bWZQZ3h4eDc1WlRxNnd0?=
 =?utf-8?B?TnYvK1MzTFBVZDdYNkNQcUdFdmh5cHhLUGJBcE1aSGsxMTFNeTM0dmkxR1lQ?=
 =?utf-8?B?MnljdWRUSVRvczdZMi80Y3hNZWJXWXNVUXpoSzdSRkw0RS9qT0JsQnA2b3RC?=
 =?utf-8?B?aWVYVUwwOHJNOXQrbDNMaHdvMFRua1ZHb0VxbUVQMzNYdHo0TjBhYkcybHds?=
 =?utf-8?B?RjdmU1JCWGUvQlVZa21SVGE5WG8yMDFLYnFnLzZQYm1obm1jME9ESFA4QnVF?=
 =?utf-8?B?T2JuRFBneW1TN0twaExJOWloN0poWkNhQkU1VXM5TWEyS0FVY3hrVW1EN29C?=
 =?utf-8?B?QlM0aUZhdWppNXUwZ3U5MTdUZVRWcFN1Z2Nnai93aDZSV3VHRVVJMGZTWmcv?=
 =?utf-8?B?WlpKd0ZtRHhGd3EwRDlId29JVENoMzA1Zkdxc2k5NDduTlRtT0FoNThDb3hD?=
 =?utf-8?B?UW56Vjc3V25NU255eDI0RjRqQy9xT0laeHlJWFJEOHhRSm5Rd1VDaEtBVDI0?=
 =?utf-8?B?QWRFM0lQNWw2ODRSZEx4TkxPRnVPbDRKcU9leStlb1pNTGEyRFpQRDdPODN4?=
 =?utf-8?B?WVZ6RktsSWQwdEwzN3QvamRQT1ZXcnpzWFdzYUlKZTh1dGRZYkhOWCtuaVhp?=
 =?utf-8?B?clhFZVNXZU10bldkbGpsZllPNkpDdTBpa04wYzZrelMwTGZERCtHOUtzdkMz?=
 =?utf-8?B?dFBMUkJzazdISjhtOUJUemFtalk0YW50Z1hZLzM2V0g3UmJGaUtQdEZLVHRK?=
 =?utf-8?B?d1dUOXkvR2xNcDNlOFdWeEV5M1Y3cEkyU0RGbHFmSWRwS3FwR05DUlNNYnhE?=
 =?utf-8?B?N29KNUhtVmN0VGY5VEc1OXdhTCtZYzI2YjlBejQ0NTcrdUZwaW1RdnBoMFNU?=
 =?utf-8?B?SXh2djBXVGZ3NXJ0Tkp4Y0N5N2t2cDVySnpxUmRpRjlDbHRyKzVhRnB3ekNI?=
 =?utf-8?B?UmtWQnFEcnhkQnZXRS9Gcm5Ka1VlSlgyTzduMm9ETjlFR2hkU1ZCenYrL1Ji?=
 =?utf-8?B?M0hiRnc4Q3RGYlp6Zy81R0FTblBaMjhTUElWNEUzN2gwT3kwMS80YU1jbE93?=
 =?utf-8?B?UiszMTNmREJZeURDeit1VmIrNWFEVFo1aVlTOWlYdEp0KzFSUHZ5ekRjYysy?=
 =?utf-8?B?Q21keEJobUlLRFRBU0RRQUhUM01tQkUvVUNwWFdVYlppemJXQTdNYUlrNWhU?=
 =?utf-8?B?UCtzZ2w4ZzdLVkw0WGJvK2JHUjdCWmJNeURSNjRZKzRyRHNrS1VNZG9mTytl?=
 =?utf-8?B?V3JlNmtBVnIzWjZEeDEwWmtRSnMwV0pQSEdXK3g5dVdQckRxeHF0M2w2ZWRS?=
 =?utf-8?B?TUJLSHBuY0pVZ09WMXpKWHFFdVplU2NlSUo1U21jQS9YR21JUjFuaDNxeUMv?=
 =?utf-8?B?UXh5N2hOWjlFd04yWkduSlM1aG9TV0wxWnJhOUFYRkZtUE1aeUJudFRRbTVn?=
 =?utf-8?Q?Z7l5F3GnbulRZcSo=3D?=
X-Exchange-RoutingPolicyChecked: OYYKqdEkR+aXyWEtEJeEIOncox7+Tl5m0tPTHR+XZ5/1JlhdsjfNi4LcM+AsvxNIn0ohId69iQzefBuo5rwq/aaKrqGXS6X1EMwWNluRNZJJZZwGXWIFXe6FChr3bo+jIEZPrQtUV3/oJD58DNaQMjdBie2oBpeq5+KrtZWyZ8w9Hpup4WWPq/0USpX8TXKw5ViWhC6TTGSPWnjNFQ4mHaGz8QkeW7xh7aoTFAeptvnR1WBczdnuCpVoodoZWmWxacpcXinmIJA6aRE5QwUk7mLKCVlyYB9uezWvMy4c1v3AEa0w6wOmxlq7PIHqAT67J++W4gBjDTO5bWFHhJXRjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a1194f-1190-4779-5380-08df20791b39
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:34:23.0904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rECTiYh+0eo8EJWwZH7K3n4oUlQwliVe/I8/ODiPofz0TtmvwjpNY7a5A+t4i27c09OJhH5svula5D58a9jmUEYhQ+zbKSXMYh1Oho6wtHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6868
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This test is intended for HW verification and does not need to run in
recurring CI runs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Assisted-by: GitHub Copilot:GPT-5.6 Luna
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d0a2bf87d6..c1dd3c7a83 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -116,6 +116,7 @@ igt@sriov_basic@bind-unbind-vf$
 ##################################################################
 # SR-IOV tests for HW checkout, not suited for recurring CI runs
 ##################################################################
+igt@sriov_pci_config.*
 igt@xe_sriov_ggtt.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
-- 
2.34.1

