Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B478CFA46A
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 02:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9CF10E0D1;
	Fri, 21 Nov 2025 02:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+0d9XGf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2527410E0D1
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 02:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763690696; x=1795226696;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U4xWsiuDUQFrrskwDzEaaugeVnMbJpPMRQJWxdC1ows=;
 b=B+0d9XGfDdASPiDIiPRz9GLCRIUSoFv+KW13Y8Qo6cmCrf2WpVwTXRMh
 HQdU6oyCuRjRb/GFPRJzsyfNr9SLmxwtnU6OzfwZf3RAot6FqpJbg6TKS
 +ci5zuhmFUH5TETo+ZsvSSjEBmkzbEiPLGUIrgSgqolx6EyaqUxVkLgDI
 OtIE5NdwiMaB+0P18AGas/ErCY5jito0FbeDycf83uJcTCxm/QoQ289bT
 /Jo2WbwJVVGMN9UojKCD4L2PGS55bH8wmkb+4r6XNqRxZkMaG/LZh34sp
 gMKYHDy/KDMcChjVUAidi+VlfBxIBRU8LuREoTgRaWdm2oh01et0YOS9I Q==;
X-CSE-ConnectionGUID: ZR/bwjfnS1euf8xnJcVgMA==
X-CSE-MsgGUID: r3mqUaxmRXGPzXvrTg7QwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69393318"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="69393318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:04:55 -0800
X-CSE-ConnectionGUID: Q/sEeWYvRM+W6HrIGEsTHA==
X-CSE-MsgGUID: 6VP74GJKS8CCuKV25sqzmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191791544"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 18:04:55 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:04:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 18:04:54 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 18:04:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz8iIOnxqXb/HLN5Uyvl6x5syCOHN6uKHz7BV8wbJCUV9GIVDoIarJ1vFcVk9E6cCoqIWLe9T4POUmRBQwa4XrUXUEKdzCaKojfXfrYl3eHddhvykNVG1OBf2RTEdTOIBNZ2ynVNX/lj6a2HmKX1JkL+/Q8rZ1qtorrT+YTGiwWcc7zzthxQuYwrbQbtyHTDoi98sHlsqZ64TPCqE4yUhJ+mRR4lvRVEyTUiG8neWxZQ65IgFxvlf5/WQ57paduXM43sPz50mC4AlVwzx2tpF5tYfBEkEdOf4doylzgGyzd3e7QWmW3cgxnz+KCcVQq+pncs4QjtlMwzElPH9lgQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DS+2MjnoN1iCOpMHBvu6xhOdkcGPACBtgC5CdbfJTAA=;
 b=R+477hI1tZIv+Ai9mHuHWnTs+szfjH2zF37TDiLKcBTOH9v+tetSYsnGee9Kv/3qQ9rSe6KoEfYDKERuJsh8Wf7FA9+6T2nkpMw76Vy/pIDD7qu4jlNcEB2T76q2ODsIHR8OXA72eTTHGWQuspqrPEEI9Wj1hdjn4wYCUxbbc9HOqqZEo1YpAU0lKuYd2je/vOBdCVOHAXNjbjSNMYXnsgNaTGOcufozicPt7jBw1onm54axjznrhkCef186Lssi+lHjGguEB847RgoTT2gum9n7jKJiJWM5PovOE8FH4H//wl8u1kG4OxYfwPkvPypos7EBEkt5iEUhERP4GHVBNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM3PPF3E6742BA8.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:04:49 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:04:42 +0000
Date: Thu, 20 Nov 2025 18:04:39 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
Message-ID: <aR_It5izMWjBi6g0@nvishwa1-desk>
References: <20251031183555.1882721-1-niranjana.vishwanathapura@intel.com>
 <20251031183555.1882721-17-niranjana.vishwanathapura@intel.com>
 <BL3PR11MB5747A3026061E15571C4DD66D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <BL3PR11MB5747A3026061E15571C4DD66D0CEA@BL3PR11MB5747.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM3PPF3E6742BA8:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fd5664-25b4-4722-75fa-08de28a255d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JCQvy7O0oZRS9oNn4+gtlzQmlmTAyE7/i1nA1476Mz+Yz0Wdz/jcFO9+6W4D?=
 =?us-ascii?Q?U+7IJnVEDVltU9PpeGOi/LhfIyCYohQ8IByOyDGHqoUS0DI3oG+tf708mytU?=
 =?us-ascii?Q?jH2oCMpXciIAR75THyEvQJuONQDc61t0/6CyzhoxQhwtrDXssUpI1OGdV7xT?=
 =?us-ascii?Q?auGkBDlzkgXSUb/iykQndU2m1CfJqNr17pdXPWFk6TPLYXqJOfafhDIqGc3M?=
 =?us-ascii?Q?3R7BGuFzy7M6Y2Jx9GSNY5P47CfykQvX0QJ0Duw5f7l3CuFa1JdV5fi5126O?=
 =?us-ascii?Q?c8L8XkdacX0gk39OXj41YjwXlWkl4p77X/AyZmVWPBD9rlShKE2i3BZ5Lg4H?=
 =?us-ascii?Q?nqgkutRoRm7Y0C8uEykn3BbAT1lP0aEzw6prVY+VQiN7mK/uIU4QYHXxMJBn?=
 =?us-ascii?Q?kCXc0fc/H2M2L507pNX9zoJQGqhEzid8H+Iz9gf9X1cyY0jM8rmAmE6V3fyQ?=
 =?us-ascii?Q?eAUEt5n1jLQ1lGQe2gyWNGMEegyimCTiaX6ieu94+f+b5NT2OAyqEtKIj5bL?=
 =?us-ascii?Q?vw9AR7OuNYJtsaWI+3Fqh6ybAccNRd9mYO1NNDDwu3QMBy3TEXxqhUCgcnkz?=
 =?us-ascii?Q?TSr3K9F1fRweWcqdhEVSJ+lKwC12sG5HV8NgY0qlD7hTIhKqqe18RZXdTssv?=
 =?us-ascii?Q?sFZUwR7yeN1tAZbgM/Av1GpWE3j/TsbKFOXqtXHa4ZCAaQY9yr1ZwzjGi+9U?=
 =?us-ascii?Q?Q9Iij1fLSPIMNdTbvcvAQeLKrxW2M7k3gkJ09FJI2nVnh4RZaCLA9nPfQLLy?=
 =?us-ascii?Q?f0sq/veW19GSock1YbgJxuxhv+HpNOJkClnE+HyInWz+WzE1CGnc76isHRwe?=
 =?us-ascii?Q?HoL8TXYLAUAvJTyENxLMAQdXDMIGcjymkrn+dcjwq1PQVzEDR/oSWJlEW08J?=
 =?us-ascii?Q?zrJgnlm/gKzihv0T0HCAPhtdDz8GJOvTNWT/cRlW6jf61PZ3DnBUKgpBLEZq?=
 =?us-ascii?Q?5BeezHdOWuG+2SRCPX9FGfXVdYf3LJfPYZwgJ936KDNXOh+BASeDkx7PZRyA?=
 =?us-ascii?Q?CqgDZ2Z/yqxybh7LdJfN/nEkg6C7kOCtAW70dRXIffppsd1PolbE33E4hxN2?=
 =?us-ascii?Q?CLCPTYR7U06wjlM1koTugUmFt621x7tuMu7gMCunr4K2bIhwrWtFn8sHvly+?=
 =?us-ascii?Q?FFe6mDr3PY6gW5cXX6Vby2qZ+3l7EYZeXl6LiZhtER0AYEWGpf7shNikDeW0?=
 =?us-ascii?Q?jjHQqZPpdAkd8+CZfcbj8HqSTpYvR49vKvxO+yTwtSE5SK3AI8qAo2tYs8qj?=
 =?us-ascii?Q?G1yteU0ndZmSKMb/vttX0Ytklz87SkdjJ7KufiE5V4sDi0ui6iY8joDMI9sv?=
 =?us-ascii?Q?63HFXysB5FTwCcCr7BTXwHg+h+qWDSqJ0SpQzkHCfm2ej9E3zqJdcsELcISF?=
 =?us-ascii?Q?Gv3lp64CuhS5MmYwY3q4Bs3juEc66L75B4zokkZCIR0KBiPn3puR5LV73oo5?=
 =?us-ascii?Q?c8Ubjx3t0etKo51T6bhbq2ojKq12/dPn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+kQ9Nz/0/3WkvEp68MZyFoAeStjtxGzhISmNQXzOQVDC/DO/A8Jmez9qVDtM?=
 =?us-ascii?Q?DIn9fhw7kERWkC2nj20nEo0ACy2TLHTd7N1Fa2I6Q5w79PiV+dcOtlkdlNd5?=
 =?us-ascii?Q?rzX8jRk5hpK95o0sDtbuQwx8GmAnilALToEqBcVxHzzDk/J92hUSypxkzrL7?=
 =?us-ascii?Q?UL6wxf9dZtWA/+l/GS91nQR1f7teoyUMtFo2IdqVx54xPLNtOASBwRJ3WRtH?=
 =?us-ascii?Q?4gX3QmQaJrflJKCcJlNSHzhLw2AociB/UsmYo98j9rcoPMu7oxn2GBnZqUY1?=
 =?us-ascii?Q?hoJdP7K3R6KHV09KLnusquWVFgandFCJzBhlYOd2JJyLpLoJbaZPY5WnPdgt?=
 =?us-ascii?Q?Jv0KfnKH8gRYmpX+ewrcLiDklrfc+BlgqLNUDHI0plVjJ+aXcui5hzfS/fjL?=
 =?us-ascii?Q?AXTpz2on3PM5M/Ie/aM51wXkyw+uOnL7w3IoEnKPFA7vrj9rW9q8VmFxsEff?=
 =?us-ascii?Q?Jhq62+wAOOee10pgUv9Wh4bYl/3d0D7SWOfqV14Nsj4tyZnVrG+uUU2CXhKg?=
 =?us-ascii?Q?AbqUTiofpDVQhWIfgEvzz7xfNvRliHoGcB6vcPuMbRfDYuNPpOUWeTsDWOPJ?=
 =?us-ascii?Q?8zujYbxRmZZT9qtjjijMPd+n04cEymfpLAgFXIaJ5aqun6X24uWsnxOHQtu2?=
 =?us-ascii?Q?qs5+9F8DkDamGbiiF7QCQ0h5gwSsyJkaD5CAu48Up8VEu1xkI1aogwfdLhmG?=
 =?us-ascii?Q?Uu8T7FbTbgg1PFnY9y2PmKHx0tDJT7mylcR+aeHKpqOERJOluFRuOorfsj6P?=
 =?us-ascii?Q?wGpR/+syf0r9FsXzckdWOIvWubeWKGRj/Libb2FuWYF0pYMYJ1MurQELl5aA?=
 =?us-ascii?Q?OniJcvKYf+s30kBmxRg8ryUGinSufZhmY8bzcMJVb3AUJdNyG9Wri7WXt8u+?=
 =?us-ascii?Q?2IB3Y1djthBTIuEzqMRwHauL/lHxhlwhhboGZg4Sy8AlQK1uJD/doBuZpC96?=
 =?us-ascii?Q?8Ujl57Ls74sFQTtINPuszkVBKtUQlpRZjDp32P4za91GXKUnshlpjLr3tZfr?=
 =?us-ascii?Q?XTTV74EEJRBUc5fL2ejobPXGtkgydW6eFUYsuxsVbUD7ppCTVIJdDwVhZTeO?=
 =?us-ascii?Q?KITi5ViIQFwWOGw9hqKPGycHkkHMzPHGATE+M14+7PgxjivGKuKdxI1OLBgB?=
 =?us-ascii?Q?C/3a0Bn107gjLvr3Du474FtOyGY2vdhOSyJEU0ENrTgz7bQMajptVjJgkT41?=
 =?us-ascii?Q?L4ka48WRZ0WaNpWNm9Y9XQJupJaGgU0QhBEFM0rgfzVZbE1YV0wBchuADZUD?=
 =?us-ascii?Q?WuUhmvRoS+0dYCjCUeAAyoiT5c5wAbw0OxDTk3ijeo78uMCQxkEBJ9MdVE/Y?=
 =?us-ascii?Q?+P+IAqEjcQXhlzKzvp8n53o/kQsgT+EnNOFfFQw2ZX4CCMUPur+MzDdYJy/M?=
 =?us-ascii?Q?W2TcNGEecyrbtsdqJ0qrvhn7dNhwku//VGmiYRpqT55nvVR3Z/bjWbop4rR1?=
 =?us-ascii?Q?Tv571wuzJ2FamVOpTH0WSS4K/wYKgyfvPnXhw+AT0JAsWTkJngvdOgwagD6c?=
 =?us-ascii?Q?wapvLg7EsYaSmJkYk0U4UO/hP4x55HwBuFVmg82ZjejPbF/RIAgsfDrwQNwZ?=
 =?us-ascii?Q?AyrDwvSO4aQvPfcKszbW19XwXcuDJzCVbQZXaLDfcZG/x4k4LK8TfKkVw4cJ?=
 =?us-ascii?Q?H72d4snXY8aAauo0h/8ONFE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fd5664-25b4-4722-75fa-08de28a255d5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:04:42.4750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0JluCkaptaJwQGJORAkfgVz4iGlFafqHl/tM0hkVSdbOMGKcm3/W2NCgjtIg3GkELzsecC07i2TaJOI5yZkW6xxvQef81/Bb395KJNRwDaXlrdhEa3JYHQmbvbRwcyYD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3E6742BA8
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

On Mon, Nov 10, 2025 at 09:55:17AM -0800, Ch, Sai Gowtham wrote:
>Hi Niranjana,
>
>Please find my comments below,
>
>>-----Original Message-----
>>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Niranjana
>>Vishwanathapura
>>Sent: Saturday, November 1, 2025 12:06 AM
>>To: igt-dev@lists.freedesktop.org
>>Subject: [PATCH 16/18] tests/xe_exec_multiq: Add submission sanity test
>>
>>Add sanity test involving exec submissions in multi queue group.
>>
>>Signed-off-by: Niranjana Vishwanathapura
>><niranjana.vishwanathapura@intel.com>
>>---
>> tests/intel/xe_exec_multi_queue.c | 138
>>++++++++++++++++++++++++++++++
>> 1 file changed, 138 insertions(+)
>>
>>diff --git a/tests/intel/xe_exec_multi_queue.c
>>b/tests/intel/xe_exec_multi_queue.c
>>index 9cd4a7a16..10b89692f 100644
>>--- a/tests/intel/xe_exec_multi_queue.c
>>+++ b/tests/intel/xe_exec_multi_queue.c
>>@@ -44,6 +44,9 @@
>>
>> #define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>>
>>+/* Number of queues in exec sanity tests */
>>+#define NUM_QUEUES		2
>>+
>> static void
>> __test_sanity(int fd, int gt, int class, bool preempt_mode)  { @@ -216,6
>>+219,137 @@ test_sanity(int fd, int gt, int class)
>> 	__test_sanity(fd, gt, class, true);
>> }
>>
>>+static void
>>+__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci,
>>+unsigned int flags) {
>>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>>+	struct drm_xe_sync sync = { };
>>+	struct drm_xe_exec exec = {
>>+		.num_batch_buffer = 1,
>>+		.num_syncs = 1,
>>+		.syncs = to_user_pointer(&sync),
>>+	};
>>+	uint64_t vm_sync = 0, addr[NUM_QUEUES] = { 0x1a00000,
>>0x1c00000 };
>Imo, constant can be defined instead of hardcode values for base addr/offset.

Ok, will define macro.

>
>>+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
>>+	struct xe_spin *spin[NUM_QUEUES];
>>+	int64_t fence_timeout;
>>+	size_t bo_size;
>>+	struct drm_xe_ext_set_property multi_queue = {
>>+		.base.name =
>>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>>+		.property =
>>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>>+		.value = DRM_XE_MULTI_GROUP_CREATE,
>>+	};
>>+	uint64_t ext = to_user_pointer(&multi_queue);
>>+	bool preempt_mode = flags & PREEMPT_MODE;
>>+	int i;
>>+
>>+	sync.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>>+	if (preempt_mode) {
>>+		sync.type = DRM_XE_SYNC_TYPE_USER_FENCE;
>>+		sync.timeline_value = USER_FENCE_VALUE;
>>+	} else {
>>+		sync.type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>>+		sync.handle = syncobj_create(fd, 0);
>>+	}
>>+
>>+	vm = xe_vm_create(fd, preempt_mode ?
>>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>>+	bo_size = xe_bb_size(fd, sizeof(struct xe_spin));
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		bo[i] = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>>eci[0].gt_id),
>>+
>>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>+		spin[i] = xe_bo_map(fd, bo[i], bo_size);
>>+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>>+		if (i == 0)
>>+			multi_queue.value = exec_queues[i];
>>+	}
>>+
>>+	fence_timeout = NSEC_PER_SEC * (igt_run_in_simulation() ?
>>SIM_MULTIPLIER : 1);
>>+	if (preempt_mode)
>>+		sync.addr = to_user_pointer(&vm_sync);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i], bo_size, &sync,
>>1);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>>fence_timeout);
>>+			vm_sync = 0;
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>>+
>>+	/* Validate job submission on secondary queue before primary queue
>>*/
>>+	for (i = 1; i >= 0; i--) {
>>+		xe_spin_init_opts(spin[i], .addr = addr[i]);
>>+		if (preempt_mode)
>>+			sync.addr = addr[i] + (char *)&spin[i]->exec_sync -
>>(char *)spin[i];
>>+
>>+		exec.exec_queue_id = exec_queues[i];
>>+		exec.address = addr[i];
>>+		xe_exec(fd, &exec);
>>+		xe_spin_wait_started(spin[i]);
>>+		xe_spin_end(spin[i]);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &spin[i]->exec_sync,
>>USER_FENCE_VALUE, exec_queues[i], fence_timeout);
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>>+
>>+	/* Destroy primary queue */
>>+	xe_exec_queue_destroy(fd, exec_queues[0]);
>>+
>>+	/* Validate submission on secondary queues fail after destroying the
>>primary */
>>+	xe_spin_init_opts(spin[1], .addr = addr[1]);
>>+	if (preempt_mode)
>>+		sync.addr = addr[1] + (char *)&spin[1]->exec_sync - (char
>>*)spin[1];
>>+
>>+	exec.exec_queue_id = exec_queues[1];
>>+	exec.address = addr[1];
>>+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>>+
>>+	if (preempt_mode)
>>+		sync.addr = to_user_pointer(&vm_sync);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size, &sync, 1);
>>+		if (preempt_mode) {
>>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>>fence_timeout);
>>+			vm_sync = 0;
>>+		} else {
>>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>>INT64_MAX, 0, NULL));
>>+			syncobj_reset(fd, &sync.handle, 1);
>>+		}
>>+	}
>My suggestion would be to add a helper function for sync something like
>wait_for_sync_completion() which handles synchronizations in both modes basic and preempt-mode.
>>+
>>+	/* Destroy secondary queue */
>>+	xe_exec_queue_destroy(fd, exec_queues[1]);
>>+
>>+	for (i = 0; i < NUM_QUEUES; i++) {
>>+		munmap(spin[i], bo_size);
>>+		gem_close(fd, bo[i]);
>>+	}
>>+
>>+	if (!preempt_mode)
>>+		syncobj_destroy(fd, sync.handle);
>>+
>>+	xe_vm_destroy(fd, vm);
>>+}
>>+
>>+/**
>>+ * SUBTEST: exec-sanity
>>+ * Description: Run exec submission sanity tests
>>+ * Test category: functionality test
>>+ */
>>+static void
>>+test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci) {
>>+	__test_exec_sanity(fd, eci, 0);
>>+	__test_exec_sanity(fd, eci, PREEMPT_MODE); }
>Why not add two subtest for exec-sanity and exec-sanity-preempt ?
>

Not required. Sanity test/s do complete quickly. So, better to have
one/two sanity tests. Here the sanity test validates the multi-queue
uapi and the exec-sanity test validates the multi-queue submission.

Niranjana

>--
>Sai Gowtham Ch
>>+
>> static void
>> __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
>> 		unsigned int flags)
>>@@ -911,6 +1045,10 @@ igt_main
>> 			xe_for_each_multi_queue_engine_class(class)
>> 				test_sanity(fd, gt, class);
>>
>>+	igt_subtest_f("exec-sanity")
>>+		xe_for_each_multi_queue_engine(fd, hwe)
>>+			test_exec_sanity(fd, hwe);
>>+
>> 	igt_subtest_f("virtual")
>> 		xe_for_each_gt(fd, gt)
>> 			xe_for_each_multi_queue_engine_class(class)
>>--
>>2.43.0
>
