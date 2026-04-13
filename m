Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196A8E9380B
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 02:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6910E2F2;
	Mon, 13 Apr 2026 02:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IcMCy78q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B0510E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 02:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776047653; x=1807583653;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uSZ7Ose61yFkbEB4A8rF1KGEhVWBCu5eBMCgeFmUm38=;
 b=IcMCy78qBcT/EDiAEbrZPyj93VxRYhD2cazyihs7fkUuJGy9oTk1CVEV
 blZxYZ6y5uf7S41aIQIjMAvKqRUhdWFYFJuABibVA4Q2O40OnNDRvvKKE
 K22PJb8qQQpcg41zgtiGthR92x2/LNSbfna3ExUs/6CWx6zdTfmkA/aRL
 DEUuxKuaDqgfJCnE0h/F7wFxVTEkjSzyj8OOSUEVQNUQZtsdC2JbC2CP6
 naVpDsHr1NH2tz71E0wYvhmTmXaSADV1+RVTxhY3KJpgjcv59HTN7N7BD
 BJl1hF41e6FC+ppZufdoipNLgIRE7pscYwvT9p6KUryd/WkDZUj8n1ERs Q==;
X-CSE-ConnectionGUID: 4HE72KiORvOxDH3JJNGK+g==
X-CSE-MsgGUID: AGjgqEBoQlaviICkM4UJ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94551574"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="94551574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:34:12 -0700
X-CSE-ConnectionGUID: w4zMXTHCRYuz4NLAunvi9w==
X-CSE-MsgGUID: hOUzPQyJTKSEmGrQDNG/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="234062663"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 19:34:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:34:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 19:34:11 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 19:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h54XJCjzDJaJ6XK1YrwJbR0lztoFebwaOCOlPPACmmGyfhPQpIgWOrf5BliVTGFbIOCiTyLN5pD1oyDKRhs1tH4mzrfpQDCW/2dRDZa+ttuqYpNud9M8WVV6WDlWg+evtt8agiYNQtg2WkFbhjZ17dSlvPDM97yfD+ToersOXrT74Vz6rmPU9NMNGm8X0qSx+5Skdtrmqj0Rzmcv6ynAs28pzKyORBptNOrgisp0whu536eR8ONY1bygyRVCScvBTPYKjYzTLXyYZRhX/c7YeumoWp1Sa2YNXEfPklkT90Fj6VfMkMFCJXWJ47E9b2a2VElkrOcy67iB15/bH+jdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TMfdt7nspvXASdwaQ90hF1ct0bOx51DQcZDA5yrJAE=;
 b=NNLU0kbttwQUOjBBSaGmRhgZb3I9IwYQ7fGws+LOkOFBuIc8xf2kl38O0kHsol8J9XOehxZMLQ7hc//wYSJAdmF8osjYqxb514jWR4DSVL4kktwtW83s1a9S8lVcAdZGaLPLhElb5wd4ny3X4vdTsL3V87MS+bPKQFDTNavzYqDZCvGTUExE2ol51X5jekVa7Yl2AWFqzhxiPMDrKEY5x6z8WkcdPwRiQkki3Mmltb9nQmPibB1Q/BXu3qcBRNPqs2JnaVslc3mCgAYi3omoBc87xQP+zEARMRn/I2AKSM+15SW2csBPeqrfepGHpmDJ9X1gJVxTbC2ZALQaZ7uAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by PH7PR11MB8597.namprd11.prod.outlook.com (2603:10b6:510:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Mon, 13 Apr
 2026 02:34:05 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 02:34:05 +0000
Date: Sun, 12 Apr 2026 19:34:02 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Apoorva Singh <apoorva.singh@intel.com>, 
 Fei Yang <fei.yang@intel.com>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>, Priyanka Dandamudi
 <priyanka.dandamudi@intel.com>, Daniel Charles <daniel.charles@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_exec_reset: Add multi queue
 subtests
Message-ID: <adxWGpCKGR9OxxR7@nvishwa1-desk>
References: <20260409203702.4350-1-stuart.summers@intel.com>
 <20260409203702.4350-4-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203702.4350-4-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|PH7PR11MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: a32fba0b-87ec-4a3f-99b0-08de990521d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: pAY/VUK5g23J+G9CKDt00eNI3o4hDOcYw7NcFAkDZRj07Q+yoH5u35zk4v6ddlSQbu1elx6bN7jbt6x9bqC0qr1co70JORgfWjmMmQIW8tpCQ7g0cbkGJxHE8wazYC4XXJQgO6E1vhgmWaEt7DovCgHCZkCT+0ghrByJY8MSwdbrFvmiGOXefyfGRJ8d0DL6G0d/etke3iN5LtOaOckt0XRx+EIOed+1KtNOvkoycPL/uh/fT+5Bc2rleV32lFSkemImbB3LbRHrWiqUiMazVOuNS5nJeBj3Ek5pu8g4bteWKiYOEREHMGsAZ+hteyxiTkWRF+ticCmlX6avrhhrYrm32OaXy2W1nR6BG7Jeuyd2nskFUzWHpYN22WgMJmeBuyGDD/LM9nSw4gFz8F15heWDYkyOF59/96PS+M9nlQgY1wEERna0vQfqiPtl2Cu1ORpXpJ3b8+lDe3uFlRV1JAYcDhwLG2kLCPzh0kTD7wWwywKs8eO38+lLunkxc42rQv142THD3c5LyKD4EZ0X/QwHU2sElbXpv67AkWMjBsahVh6bHDI+ZvJcFdpYus9537M/HL2IKkNffzO7B/4Ezy4DE6sVWh7dPHE3QAufn5vlmzJFbeztOqcXaz2SUvO2Xbx0OIs/gMHkaP64sSggPm7CuntzT7Dla8UwWnrQ7sa6KMkT+LBWVn16gqst0uPDxz2atYSpONC25Mmu79EpMwngMa7H+EHQlNwK7wfn9M8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t9a4FwV/15hQFlesQA0bs67hYSd+ohFYdQYf0cJynInYdscXYs76k1awCn60?=
 =?us-ascii?Q?JriXItDBXXPHPr7hFl65OxEv27V9qQDJ67EJx7DkyAKj16aKM9O8lyylhf8j?=
 =?us-ascii?Q?jKfP8zAbM9e9Gr8O9JGbCbNZZyYitIxlpuVNe7+mfJqdkBSL0koyxBDNNg7H?=
 =?us-ascii?Q?HuGpz9bVNRf8gD+xk7PJSbzcvFYkJgsaIxIE8myOhidveC4dgkbkOo9MSEfn?=
 =?us-ascii?Q?+x3vMzQ/c7TdHls0jm+ivqUFCDwSjIsx81HgAIXSDnz7LtwAVuj/HRuPucrL?=
 =?us-ascii?Q?kqWP+YC9JcX2n0YT3dty/6/71U1pN3tdXerd4JvIcTybevFYCP7O3hu3uBRX?=
 =?us-ascii?Q?1qKw5jzL3JErTNk2Kl2WzUSjxjkUzgnTQrFOzIN0jglJf2L78X1Trod4c+uI?=
 =?us-ascii?Q?3hBbiRFQzoNv71UigzNt1NNTFxVU+sLAepidUzAdKK57CVEobjuDSiIJ7oNc?=
 =?us-ascii?Q?aNrg1+LYHiMAA0rtVbhkl2u2DChhSxcyTEhnXjTFiJhz+/fh9MHtynMA1fM6?=
 =?us-ascii?Q?SrXXIdMqyFLNlEimOh4DQpClD6ClQTx0r5UNqxTrwUFh67DFHj5x3ZS/zfiz?=
 =?us-ascii?Q?4cPkDjhP4I67siAZhyeFS3MFxRpsg/rgLbuh012jP7augHrsF129kpIRfd6O?=
 =?us-ascii?Q?NJRNbrFRviuZlOVH1YVaipVKwxrD+1BABVHgJ2zmF61mMVpgE6bR/C/uIDSW?=
 =?us-ascii?Q?ei9n/0HjhntoBztCDiXsYJecytxsCmaRRKWDdDkeZPHQGDzJc2pR6JnafROg?=
 =?us-ascii?Q?JXMFFbqdUbdlsnqDd3iGgloKRwK0u6wIzf4tHRcT6mkwtEilF6dN4ATTnBIF?=
 =?us-ascii?Q?KHJkCjgrlnkvnnTsOUJFP/x6/WFhqYSUlp/kG6/38Lks29AkHbL7RNlFdc1t?=
 =?us-ascii?Q?GHhhiDcU1eAdNomtvx3DnSC1jV5lM/5cM5poZI2hPhNMSQyOgCtWgdQd8gYw?=
 =?us-ascii?Q?xhSrnPKGpS8lre3foqztWPD7/QcKPtQ4DKyyjYaVrcw1p7RLYsf3E7aMsLMo?=
 =?us-ascii?Q?LyvQQn7+kG7nlbsnr3J9Ew1bvMY1t7NfwJMvCW4wnlr2s960lRDXYybYhdtE?=
 =?us-ascii?Q?YyoM3LgXfs+CQ09JADkayGNiAbN6JLy78NaQuZltgLW/O1weGAdrKaPtN7wG?=
 =?us-ascii?Q?aRg1cxO8HfcHguOVVENTHVVQfQ1YoEijZKJnj3PWYtBAK4Y4wBobD8/iorIl?=
 =?us-ascii?Q?x7PGQALwrWsy8KvN7+T2ZWSZeoqIY2ZaQI4+PEU733KTINO+t1TnO9/XS++e?=
 =?us-ascii?Q?sawI9odYXEE/I0JDrTvsdylmM114VMr5ZMB4IIuD0VtL8krtCvOfqhsqqUIM?=
 =?us-ascii?Q?sWsNgvbI8yyA0x6OVRlnkEROYa0T5t/95c5mvst7+aPVTtHze3SOuAQAGQb5?=
 =?us-ascii?Q?r2k0aAW/n1Ux9dVYFzq47yua5mhwVUks+KrAXEp1N6wnHZrPqCS3owI/CSXQ?=
 =?us-ascii?Q?ofd7Wk3QnwnKWBG2P9kX1hXTbIPZaNFSv8UpOKcy8AT4+J81ephIyncOKkKB?=
 =?us-ascii?Q?2QeUFJKgclbPk03dWxKfOm3P/DdQLzmW4lJMpJGzUN874n+K5mXgvi5J2DbB?=
 =?us-ascii?Q?7rLttyncl6wSWHiQP+Fdqrxmkl9GHWT66g6F0lTlcX89i44t6nIxQsg0CzVw?=
 =?us-ascii?Q?/kISP4zQilD2Lhqus52xq9WOddJmAQtwv6eZXz0NXsSheESl4yDUthQGJDpn?=
 =?us-ascii?Q?JjwEj90bvIeew5BAUg8wE6GJqpe+aQo15m8Eun/Uh6VXQC16mhvtQj5bhI7g?=
 =?us-ascii?Q?0238hVqpNjcQCenQofwveNXbiKU5Z1D45k1f213/q5e3yM/b60hS?=
X-Exchange-RoutingPolicyChecked: iIx9i426WDlO0YdoD/XG8QjjY2HUShvJY/8toXsPJveTQ+ph0QgPjOrberIXaSMKG7LHpP9+l/sW+fDTI4UwvwjFVTfDT/U5REzcu/LbUU2pxs6stou/yMjWYew0IMeNToPc4oRMcrIVaenavClFoJHLJ08EowHJ9GzVLxHLXSqcewP6nyeeMLloV45LScglXGH6SNYxwevTojG20xIiR/p90QHVvejpQ08OqFtxPOYmof5rLBK9k8EE4cONi74PjoYveacz3i0TH6scQ8lTywixCvI07PGlIEIhubZCHFRA/4VPkfeeCVI3MYPn1klJPmk9EpmMc5LGcs2Ka8W44w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a32fba0b-87ec-4a3f-99b0-08de990521d8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 02:34:05.6554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSPIOeSVSDegEztrmi3uI4Q8xKb5ejkJxweDzaDLNrzpo9bQvxeAJ9LDJ7ryQY75U8kv0V5q45jfDrqrxHmB8suTPjc8YVzuRsPHxQ9E9/mBfSkixZ8Iqv8oyK4xemZo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8597
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

On Thu, Apr 09, 2026 at 08:37:01PM +0000, Stuart Summers wrote:
>From: Apoorva Singh <apoorva.singh@intel.com>
>
>Extend the existing test cases in tests/intel/xe_exec_reset.c
>to include testing of reset flows for both primary queue
>and secondary queues.
>
>Engine resets without CAT faults are triggered via the *-cancel
>cases. These don't include the CANCEL flag as this causes a spinner
>on each queue which isn't adding any extra coverage for multi queue
>over non multi queue.
>
>Since the *-cancel cases are currently implemented only for the
>legacy cases, do the same for multi queue.
>
>New MULTI_QUEUE and SECONDARY_QUEUE flags are added to cover
>the general multi queue cases and the cases where we are triggering
>engine resets and/or cat faults on secondary queues specifically.
>
>Note for multi queue it is interesting to test these secondary
>queue reset scenarios since these are communicated to the driver
>from GuC via the primary queue and after this, the entire queue
>group is torn down. The test cases here are to ensure nothing
>breaks when we hit a scenario like this.
>
>Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>Signed-off-by: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>Signed-off-by: Daniel Charles <daniel.charles@intel.com>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>

Also ensure to include only valid email ids here for s-o-b.

Niranjana

>---
> lib/xe/xe_legacy.c          |  71 ++++++++++--
> tests/intel/xe_exec_reset.c | 222 ++++++++++++++++++++++++++++++++++--
> 2 files changed, 274 insertions(+), 19 deletions(-)
>
>diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>index 3371a91ac..f9bd5bcb6 100644
>--- a/lib/xe/xe_legacy.c
>+++ b/lib/xe/xe_legacy.c
>@@ -13,6 +13,8 @@
>
> /* Batch buffer element count, in number of dwords(u32) */
> #define BATCH_DW_COUNT			16
>+#define SECONDARY_QUEUE			(0x1 << 15)
>+#define MULTI_QUEUE			(0x1 << 14)
> #define COMPRESSION			(0x1 << 13)
> #define SYSTEM				(0x1 << 12)
> #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>@@ -70,10 +72,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
> 	};
> 	int i, b;
>+	int hang_position = flags & SECONDARY_QUEUE ? 1 : 0;
> 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>
>+	igt_assert_f(!(flags & SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
>+		     "SECONDARY_QUEUE requires MULTI_QUEUE to be set");
>+
> 	if (flags & COMPRESSION)
> 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>
>@@ -101,7 +107,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	data = xe_bo_map(fd, bo, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
> 		syncobjs[i] = syncobj_create(fd, 0);
> 	}
>
>@@ -123,17 +142,22 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	}
>
> 	for (i = 0; i < n_execs; i++) {
>-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
>-			? (addr + bo_size * 128) : addr;
>+		u64 base_addr = (!use_capture_mode && flags & CAT_ERROR &&
>+				 i == hang_position) ?
>+				(addr + bo_size * 128) : addr;
> 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
> 		u64 batch_addr = base_addr + batch_offset;
> 		u64 spin_offset = (char *)&data[i].spin - (char *)data;
> 		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> 		u64 sdi_addr = base_addr + sdi_offset;
> 		u64 exec_addr;
>-		int e = i % n_exec_queues;
>+		int err, e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL ||
>+		/*
>+		 * For cat fault on a secondary queue the fault will
>+		 * be on the spinner.
>+		 */
>+		if (i == hang_position || flags & CANCEL ||
> 		    (flags & LONG_SPIN && i < n_exec_queues)) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
>@@ -160,10 +184,17 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (e != i)
> 			syncobj_reset(fd, &syncobjs[e], 1);
>
>-		xe_exec(fd, &exec);
>+		/*
>+		 * Secondary queues are reset when the primary queue
>+		 * is reset. The submission can race here and it is
>+		 * expected for those to fail submission if the primary
>+		 * reset has already happened.
>+		 */
>+		err = __xe_exec(fd, &exec);
>+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -ECANCELED));
>
>-		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
>-		    !(flags & COMPRESSION))
>+		if (i == hang_position && !(flags & CAT_ERROR) &&
>+		    !use_capture_mode && !(flags & COMPRESSION))
> 			xe_spin_wait_started(&data[i].spin);
> 	}
>
>@@ -186,7 +217,21 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		 * Expectation here is that on reset, submissions will
> 		 * still satisfy the syncobj_wait.
> 		 */
>-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
>+		int err = syncobj_wait_err(fd, &syncobjs[i], 1, INT64_MAX, 0);
>+
>+		/*
>+		 * Currently any time GuC resets a queue which is part of a
>+		 * multi queue queue group submitted by the KMD, the KMD
>+		 * will tear down the entire group. This means we don't know
>+		 * whether a particular queue submitted prior to the hanging
>+		 * queue will complete or not. So we have to check all possible
>+		 * return values here.
>+		 *
>+		 * In the event we get an -ECANCELED at the exec above and the
>+		 * syncobj was not installed, we expect this to return -EINVAL
>+		 * here instead.
>+		 */
>+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -EINVAL));
> 	}
>
> 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>@@ -232,7 +277,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
> 		for (i = flags & LONG_SPIN ? n_exec_queues : 0;
> 		     i < n_execs + extra_execs; i++) {
>-			if (!i)
>+			/*
>+			 * For multi-queue there is no guarantee which
>+			 * queue will be scheduled first as they are all
>+			 * submitted at the same priority in this test.
>+			 * So we can't guarantee any data integrity here.
>+			 */
>+			if (i == hang_position || flags & MULTI_QUEUE)
> 				continue;
>
> 			igt_assert_eq(data[i].data, 0xc0ffee);
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 6b71d9144..ea50567c0 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -112,7 +112,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> #define MAX_N_EXECQUEUES	16
> #define GT_RESET			(0x1 << 0)
> #define CLOSE_FD			(0x1 << 1)
>-#define CLOSE_EXEC_QUEUES	(0x1 << 2)
>+#define CLOSE_EXEC_QUEUES		(0x1 << 2)
> #define VIRTUAL				(0x1 << 3)
> #define PARALLEL			(0x1 << 4)
> #define CAT_ERROR			(0x1 << 5)
>@@ -124,6 +124,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
> #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
> #define SYSTEM				(0x1 << 12)
> #define COMPRESSION			(0x1 << 13)
>+#define MULTI_QUEUE			(0x1 << 14)
>+#define SECONDARY_QUEUE			(0x1 << 15)
>
> /**
>  * SUBTEST: %s-cat-error
>@@ -353,6 +355,57 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>  *
>  * SUBTEST: cm-close-execqueues-close-fd
>  * Description: Test compute mode close exec_queues close fd
>+ *
>+ * SUBTEST: multi-queue-cat-error
>+ * Sub-category: MultiQ tests
>+ * Description: Test cat error with multi_queue
>+ *
>+ * SUBTEST: multi-queue-cat-error-on-secondary
>+ * Sub-category: MultiQ tests
>+ * Description: Test cat error with multi_queue
>+ *              on a secondary queue
>+ *
>+ * SUBTEST: multi-queue-gt-reset
>+ * Sub-category: MultiQ tests
>+ * Description: Test GT reset with multi_queue
>+ *
>+ * SUBTEST: multi-queue-cancel
>+ * Sub-category: MultiQ tests
>+ * Description: Test engine reset with multi_queue
>+ *
>+ * SUBTEST: multi-queue-cancel-on-secondary
>+ * Sub-category: MultiQ tests
>+ * Description: Test engine reset with multi_queue
>+ *              on a secondary queue
>+ *
>+ * SUBTEST: multi-queue-close-fd
>+ * Sub-category: MultiQ tests
>+ * Description: Test close fd with multi_queue
>+ *
>+ * SUBTEST: multi-queue-close-execqueues
>+ * Sub-category: MultiQ tests
>+ * Description: Test close execqueues with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-cat-error
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode cat error with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode cat error with multi_queue
>+ *              on a secondary queue
>+ *
>+ * SUBTEST: cm-multi-queue-gt-reset
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode GT reset with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-close-fd
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode close fd with multi_queue
>+ *
>+ * SUBTEST: cm-multi-queue-close-execqueues
>+ * Sub-category: MultiQ tests
>+ * Description: Test compute mode close execqueues with multi_queue
>  */
>
> static void
>@@ -384,9 +437,14 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	} *data;
> 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
> 	int i, b;
>+	int hang_position = flags & SECONDARY_QUEUE ? 1 : 0;
>
> 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>
>+	igt_assert_f(!(flags & SECONDARY_QUEUE) ||
>+		     ((flags & MULTI_QUEUE) && (flags & CAT_ERROR)),
>+		     "SECONDARY_QUEUE requires MULTI_QUEUE and CAT_ERROR to be set");
>+
> 	if (flags & CLOSE_FD)
> 		fd = drm_open_driver(DRIVER_XE);
>
>@@ -401,7 +459,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(data, 0, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		if (flags & MULTI_QUEUE) {
>+			struct drm_xe_ext_set_property multi_queue = {
>+				.base.next_extension = 0,
>+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+			};
>+
>+			uint64_t ext = to_user_pointer(&multi_queue);
>+
>+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
>+		} else {
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>+		}
> 	};
>
> 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>@@ -411,17 +482,21 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	data[0].vm_sync = 0;
>
> 	for (i = 0; i < n_execs; i++) {
>-		uint64_t base_addr = flags & CAT_ERROR && !i ?
>-			addr + bo_size * 128 : addr;
>+		uint64_t base_addr = (flags & CAT_ERROR && i == hang_position) ?
>+				     (addr + bo_size * 128) : addr;
> 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
> 		uint64_t batch_addr = base_addr + batch_offset;
> 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
> 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
> 		uint64_t sdi_addr = base_addr + sdi_offset;
> 		uint64_t exec_addr;
>-		int e = i % n_exec_queues;
>+		int err, e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL) {
>+		/*
>+		 * For cat fault on a secondary queue the fault will
>+		 * be on the spinner.
>+		 */
>+		if (i == hang_position || flags & CANCEL) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
> 			exec_addr = spin_opts.addr;
>@@ -442,7 +517,18 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>
> 		exec.exec_queue_id = exec_queues[e];
> 		exec.address = exec_addr;
>-		xe_exec(fd, &exec);
>+
>+		/*
>+		 * Secondary queues are reset when the primary queue
>+		 * is reset. The submission can race here and it is
>+		 * expected for those to fail submission if the primary
>+		 * reset has already happened.
>+		 */
>+		err = __xe_exec(fd, &exec);
>+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -ECANCELED));
>+
>+		if (i == hang_position && !(flags & CAT_ERROR))
>+			xe_spin_wait_started(&data[i].spin);
> 	}
>
> 	if (flags & GT_RESET) {
>@@ -467,8 +553,18 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>
> 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> 				       exec_queues[i % n_exec_queues], &timeout);
>-		if (!i) {
>+		if (i == hang_position) {
> 			igt_assert(err == -ETIME || err == -EIO);
>+		} else if (flags & MULTI_QUEUE) {
>+			/*
>+			 * Currently any time GuC resets a queue submitted
>+			 * by the KMD, the KMD will tear down the entire
>+			 * queue group. This means we don't know whether
>+			 * a particular queue submitted prior to the hanging
>+			 * queue will complete or not. So we have to check
>+			 * all possible return values here.
>+			 */
>+			igt_assert(err == -ETIME || err == -EIO || !err);
> 		} else if (flags & GT_RESET || flags & CAT_ERROR) {
> 			/* exec races with reset: may return -EIO or complete */
> 			igt_assert(err == -EIO || !err);
>@@ -483,7 +579,13 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>
> 	if (!(flags & (GT_RESET | CANCEL))) {
> 		for (i = 0; i < n_execs; i++) {
>-			if (!i)
>+			/*
>+			 * For multi-queue there is no guarantee which
>+			 * queue will be scheduled first as they are all
>+			 * submitted at the same priority in this test.
>+			 * So we can't guarantee any data integrity here.
>+			 */
>+			if (i == hang_position || flags & MULTI_QUEUE)
> 				continue;
>
> 			igt_assert_eq(data[i].data, 0xc0ffee);
>@@ -986,6 +1088,108 @@ int igt_main()
> 		xe_for_each_gt(fd, gt)
> 			gt_mocs_reset(fd, gt);
>
>+	igt_subtest("multi-queue-cat-error") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 16,
>+					    CAT_ERROR | MULTI_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-cat-error-on-secondary") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 16,
>+					    CAT_ERROR | MULTI_QUEUE |
>+					    SECONDARY_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-gt-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 16,
>+					    GT_RESET | MULTI_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-cancel") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 16,
>+					    MULTI_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-cancel-on-secondary") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(fd, hwe, 16, 16,
>+					    MULTI_QUEUE | SECONDARY_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-close-fd") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(-1, hwe, 16, 256,
>+					    CLOSE_FD | MULTI_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("multi-queue-close-execqueues") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			xe_legacy_test_mode(-1, hwe, 16, 256,
>+					    CLOSE_EXEC_QUEUES | CLOSE_FD |
>+					    MULTI_QUEUE,
>+					    LEGACY_MODE_ADDR,
>+					    false);
>+	}
>+
>+	igt_subtest("cm-multi-queue-cat-error") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 16,
>+					  CAT_ERROR | MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 16,
>+					  CAT_ERROR | MULTI_QUEUE |
>+					  SECONDARY_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-gt-reset") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(fd, hwe, 16, 16,
>+					  GT_RESET | MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-close-fd") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(-1, hwe, 16, 256,
>+					  CLOSE_FD | MULTI_QUEUE);
>+	}
>+
>+	igt_subtest("cm-multi-queue-close-execqueues") {
>+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_compute_mode(-1, hwe, 16, 256,
>+					  CLOSE_EXEC_QUEUES | CLOSE_FD |
>+					  MULTI_QUEUE);
>+	}
>+
> 	igt_fixture()
> 		drm_close_driver(fd);
> }
>-- 
>2.43.0
>
