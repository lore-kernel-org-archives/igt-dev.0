Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA2BC5474A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 06:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 729B510E4AD;
	Wed, 28 Aug 2024 06:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS3UvAgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404A610E4AD
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 06:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724826763; x=1756362763;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qoNj8hRkuqMVGo37H46JRDxF6dZ3s+NNvyl+F6eet+g=;
 b=SS3UvAgK3bYMhvEoL/JkvRq+ezbJtngYkmkOpuXkf2cwLZ+E7ER+kj8r
 YP8nkJi4VdeDLHiX0SxDJJrYeZwSrtu+OLEyKHMsDcH/+NPRg4DznUsca
 U+ei0w1f+44tA5C1T4vHVpvTGaPXsUQCFK41ghDoS3MPoF1zfGQqO2MsJ
 a933AjJbD1yzGEF2FAIXQSsWHlikmMcrj6oeODgJFBfIWoQwD43PL9uvL
 s27YsgTxOIgvMoMwakCfHoTsvT+IcxBSTxmT8tBNCsILy+r2DWyfhHNaT
 QVcn+9KPV0pjjhzSo3pUyo3S/47L1shACbglPOpekPh4Oh9kvOLj4kcLx A==;
X-CSE-ConnectionGUID: dJMZQYqUT3OYfEBq/o9WqA==
X-CSE-MsgGUID: rHqoWIhfSqGy/9cUUmyHBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23143972"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="23143972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 23:32:43 -0700
X-CSE-ConnectionGUID: /9tNxmrkSl2SfQtqzlm0jg==
X-CSE-MsgGUID: xe/Su0soQX6oVJRNdXjo2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="68005540"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 23:32:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 23:32:42 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 23:32:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 23:32:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 23:32:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVzw20cdqdnS/rhejgJVYcBDC+PEY33hcTJgpq6VuV8ieBuWi/p70aeL5K0BGAi8TqnY7RKNKljnuceFpX+ZeewgJQ3l+sNaU10Jcc3l/ol0yOr2HsPfoDWKB4xfeSG/GCodFpYeFk/W88SgWK9xUB9j6dhLJrYqgeI7weZZvK2RBdzSUeFoSBk2v6kyckM6XpPjqM8l3zrdM+UxEz2c7seIMYjpXFGUwFhb3GpvDUW5Ia2FmBP770lXo5c5/h0VYots6CJyVYGtJ9sTN9WBdqi4IA9sjHzIL8ebgu1CqkFG6mas6Y7X9edIUpvQwwPbq9NmmHh+mTA7a+UAlJ9X4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqnePJBLeLwSGVwskl9baM5yj3TAj2zOhsXQQCJrYbQ=;
 b=B8yinlvgpnR6wOQ3BTsQ6iPcdtOXuVFa5fwVZIqcjDrjyceAAe7dEjpBsReRMghiyXJSS6LHFon80YWBTf4peS8nBWrznqdFLULptEW10vSodsc0La8tr6/aMCJ4Jmv5WER69v0r5VEkU9ItUSSCQFoaApG0Nu5hpwVkVPEKSFtSDGSdJcxM2N4x90SVc6+J9KvjUwTI/wr2MxwvPFV+GolqaNBz2FAPr2onTVIgzyCWw6OPbrfDwSyWlUZ2SQys5X2k4I42Bsi02wfJ0M2gO8qREGN04uJPfqqgYsSuayp4xCeb53voyLnAmiOqPiADiQaHj2s5kwShSbS97Ewy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 28 Aug
 2024 06:32:39 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 06:32:39 +0000
Message-ID: <0fa19592-b24b-4249-b165-d31aa9aaf233@intel.com>
Date: Wed, 28 Aug 2024 12:02:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
 <SN7PR11MB67503425F71BB85B71A9C562E3952@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <SN7PR11MB67503425F71BB85B71A9C562E3952@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::7) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b9b626-b47b-4fb2-14ca-08dcc72b367e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnlCM00rd2FscTAyUDVrOUk3NzF5WGxBRkFPd2VWeFVRaXJnQlJ5a0xNYUI4?=
 =?utf-8?B?V2hKeFpCUjJrY0lIVzZmdmZlZEl4cHlWaTFlWldnMmV2MHNPcFVIYWVDMWti?=
 =?utf-8?B?eVNnZTB6TzZ6UUhNT3hNMjlMZ0hlQzZNeFM5OHNYbXhmRnZNNHVVYUtteXJS?=
 =?utf-8?B?MDJmY3RwUyszSFhIeUNobGJ1eUROYnZlbVlhaW1CRmR1c1dvRGgvVndQWnhw?=
 =?utf-8?B?OHEvaWcxVjMwSWRjdU9seXBDeDUwNFZ5elJwWnJZeTRSbXRYczZORGtOR3pi?=
 =?utf-8?B?NlBkOXYwcGtlWWFBWUtIRkNiTUp0QTY3c3UwYzh4TVE5QSsrMGlFUWtPZTRU?=
 =?utf-8?B?VkQwajEyb2dCbHR3QjFjeUpoeHNCc3lkV1M5QVVZTkJWZEQ0MXZpWmxjcHVk?=
 =?utf-8?B?SFVsWEs3RlExYSttS1AvekJIQjNQekFodlNJREs0aFpNbFVDU1RUYWdkVkpC?=
 =?utf-8?B?ZDhXTkJpNkxUdVRZL2xpVmVtUUUyTnZVVnVzSEt0WGdHQXlJbTEvVWltMUIx?=
 =?utf-8?B?YmFjV2NCclg2VFhWeWxnVU55QTA1c0oxRzVKbUVXcjJNelptMGoyK09HT0RJ?=
 =?utf-8?B?TmNFblZ2RVhBMlFnY0FRM2VYUncvNWJtbk5kRzZNckE1MEhkaVE4OWp2UmNI?=
 =?utf-8?B?czRmUk12bDVEbnozWXVLL1RFZW9BUXBGazN4a0lWS1dPVUNvY1NCTFFlYkM3?=
 =?utf-8?B?bUpZTXNYSU9ubnAvaDdxOHcwOTl5MC82RFlZcWZXbVdlY0Y5bkw1QXVpaG0v?=
 =?utf-8?B?TXJaU1FjVnBtK3dyTWNBMUJvbmIzQmxRVFVVT2VVOUJYMXYzZDBWMTVoTGtF?=
 =?utf-8?B?c3pVd1Q2dUNMdlptVlo5QkxGR0tBL25mU1VOckNrbjVVVmF5aEduTHlPWUhX?=
 =?utf-8?B?bVZYa0JTdzBaK1l2cHlYTW9kTnBzRjBiblBGRFQ0VmJDaHpvMElQV3RRL2FH?=
 =?utf-8?B?bHV5ODhiblU5Vmh1UjlIQmg3U0F0MnZwM0sxMTFKQUtmUG4xODUybmVOUUsv?=
 =?utf-8?B?VGh5Tnhob3U3K2RmckZ2U2x6NmRibzQrbDJaNHc4dXpnakZIQkZZanhiZ1ls?=
 =?utf-8?B?R3E2bG1pK240Vjh3L1ZvbkNkNlI5bkdmN1ZnUHBPR1ZSRTdpQU5mUnZ5a3lS?=
 =?utf-8?B?QUt1Wm5FclErRDcyV3lmT3NkUGxtZGJId3p0YXNndEtSOUZPNjM1cStRNmta?=
 =?utf-8?B?WmpwM3IwV3hWSVlseVppNGpwY2N1My9tc3lDcGQ0a2FRK043NWovYlB4Mzhv?=
 =?utf-8?B?aHl0QzdvMDQ2WGRPOVMydmgwUWpmblM0Zm1MSVZtYnVLZnU3MFVXTXRocE5W?=
 =?utf-8?B?OEEwTUovLzZ0eTEvWUsyamJpdnZydGwyWS9JclJMbFRTN1h6dVAvU3c1N1hi?=
 =?utf-8?B?VmRQVlJHQ1RDOU1pTW56VDNwUlZ0T3RIbE9xUmhiR3JvTFVNTm5KSlhNc0lx?=
 =?utf-8?B?cXEwZFE1OFBhczRqaTl0NUVCZ2R2YS9lUTlibmk5QkNQZ3V2RGRBaGRnZk0r?=
 =?utf-8?B?cmRrQitsK3JYVnZHSjdiYVVXWms0RXM3NlB1UjlsMndabkRFUC9UZFc1M2Yw?=
 =?utf-8?B?RCtoR0RjS0NEMmxYcjFwMi96U09iZVUxODZVSm9lYkdlQzliajNtUVE1Yzds?=
 =?utf-8?B?Y3dLQ3dCQXdaeld3WTdkU2ZZeWhZUUxNT21ZOG1FeVdMeWhYTzBVV2puclpG?=
 =?utf-8?B?ekpJV0Y2ZWdtQ2Y5RXc2OEI1dVZOQ05YUXVqUHlYRzRuV1BEUS9MWjE5Yk9v?=
 =?utf-8?B?Ujl5cFE5S0ZIOGo3K3RyTXJBbFdmQ0NzN1pmbHp3MUtjRlJ2UmVjSlV2bjJV?=
 =?utf-8?B?c2Q2UUdrU00yc2d0S2VUQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWwxWi84QmNHMkZ2YzkwMzF2TncrZlhJN0MwcG5qWWNHZi9GTmtkREJXWndS?=
 =?utf-8?B?blVQUnlVb3NJZzBJWFVMZW5uNHdMQTJQb1IxaE9Pa0ZCcC9TSzE1WmRwNlJK?=
 =?utf-8?B?RWNwd0krZDUralZPdFQwMzF1QmlpT08rdXBIcWNNQjZjbFFkL2wzcmhiQ2or?=
 =?utf-8?B?Mm10Y3Y2R09VSEpLQ2JNRFdraThQWGZXZW4xMkJkR2JMYkZSWDNjZ3VGVUxN?=
 =?utf-8?B?eWpiRmszOUtlOHJ5TGQvTFFsV2ovcVE5ZlplU2cyamxkUmVmZm14OU9aUnpn?=
 =?utf-8?B?aGJRYkNnMktDWmZ2dlhyakd6WDlaMGdoL0RITXdtZko2M2dUWDNFZDdjdThj?=
 =?utf-8?B?R2tOTmtSOFlOd3RIbXlpTEgraVJtUm8vdGRHbWlhQjFIVTJiUDdtdHhzdExr?=
 =?utf-8?B?QzdVSnBiRnpvZk1zZFBLYU11R21Pa1JDdmFxOTVOSTZtVUVRRy9SdnRBY1Ex?=
 =?utf-8?B?Y3VoaS9zb2NmWDJoUDUxSXlZZWhYY0x5a3MvM0s3Q1BNT0htOWRHcGhjM3o5?=
 =?utf-8?B?UGZSaHdlZUR3bVBLaFhRYk8xZ0hZNjVFRUtuTTlQRHBNRnhhS3N0UE42WnJJ?=
 =?utf-8?B?VkwyR1gvR1QwN0IzS0dSTmhyZUVUbG55RDJBcTFFMzg1UE5hSnNrOWE1akN6?=
 =?utf-8?B?U24xTWdxVCtLbldUd1FFUjRqR25MSjJ1aThkejZIYXBTZVZDNS94dEZGRTVi?=
 =?utf-8?B?bFI2dEdQRVpTY1N4Z1hvUmQ2NXFZUkwvWXdHYjY0UXpzdkNTZ2tGRHdpam5U?=
 =?utf-8?B?RVJwQ2NxMTZPZ0tKL1RXd2hwK1ZvTHJzcDB0UFNYLzJVVGV3cTV1VDk4WXY4?=
 =?utf-8?B?bmFKNUJlRUpMVEhzTy91K3UzUjZYZlFPc3ZVVXU3QU5ZdlQwd0dTblhlUkls?=
 =?utf-8?B?Wjd0YS9TTjIxeWVuVWtxRGp6dVNsYkh3NjVqNmVPdTB0WWh4Q1hVUTdlb29t?=
 =?utf-8?B?MUtiOVhkSWJtZ24vYmxjRUlKdWlzVlpEcDNlMzljTzYxR2hvVDNyZUZXSUNW?=
 =?utf-8?B?dkREWlNtbGFtUXNRbXhWbHp1Ui9jc2gxV3JINHhCNUM0ckpnMmFFR052amZq?=
 =?utf-8?B?NnhpdExlSDQ3aHlKckVBdFBPdzNwM0p6aWk4N2xTVHRaMzljYmNOVk9QL21n?=
 =?utf-8?B?dG4wbUhIeENMWHJSampvdmpTb3ZsQTlqcllXVGFXWmo0UFZUZWJpYkZqSTJT?=
 =?utf-8?B?RzRMb1ZJcEd4Uk05Und4K3ExQnlIV0lBb1FYNUZkVXFtRUJVcUFyMW9obHM2?=
 =?utf-8?B?Z1RCdVpNSnhmNDR4TzVsWnRoazBPN0VVSEYrZzVJclkrWUpyMys1VWJXMGlO?=
 =?utf-8?B?TmUwMTI0NlBGVUtFU1IxNzRhUWJidkdRU0c4SzFQZVZNZWY3N1ZoZnVEYzZM?=
 =?utf-8?B?aDF6MnpnVmFaWndnNDBnNGNCV1RFK016SitFcmlHTnRiU09XajFUcEEybm9s?=
 =?utf-8?B?OTBxMjNEQVorc2p5cUxyOEdsdG42c1RTTVlQZ3UyMlQ2Wjlrb00xK1ZJRG5C?=
 =?utf-8?B?WHNGRUNjbWx4eVNtSTlsTTdnazBGb09pT1dySzFDOGhNUy96Sk45S05tVGpu?=
 =?utf-8?B?eVNRRks5eEVQWGhFbkdOcjY1UmRraVhML0RsVXpCbGlRZy9qbzZNL2hQSE5V?=
 =?utf-8?B?eDB2Um9RYThMdjYzcnhFK2FYYkIxTVlYc2lUQkFhcHlWR0dobXdQOThGNG9q?=
 =?utf-8?B?YkZWUUUwK2xtcTA5YTlwa3NDSVA2b3Jkc29XSU1ZSkUrbDc2WThXK1MrbktY?=
 =?utf-8?B?REE4NFNpWVFwZHpMRjF1Nnl1Kzg3M0ROcVNKdzNpdFdIa1JZeTJzZUtDSWlG?=
 =?utf-8?B?R3RIOGNXRTY1MjcvNXpEdTFZczdxK2VhQXpjTmtWU0lUME8vLzN4d3prT3Bh?=
 =?utf-8?B?V1RUSSt4TUVyRDVPLzVJeDhTckU3eTJKaW9HaGFlNjlOKytrdEtHRjV0Q2pv?=
 =?utf-8?B?cyttRnQwcTVzQzRrTmxYVSs4ZmsyVFh4eDN5Ly8vbTQvYUs1Y1kxZHdrUzk3?=
 =?utf-8?B?U2xIMTF3aEkwUjBVRCtsTTVwRkF2MnJDY043ZlArVGFoeEZUalVkS3FjdlQ1?=
 =?utf-8?B?TFkya09nRTRGS2IyRGFjU1dPSVNRaktjQXZBOG5uakVHYmY4bGNXTjhZMVdD?=
 =?utf-8?B?enFNRWc2QTVFbExWOHlEc2pOSHVzSjFaNkxjR2FRbnhobFplOURacWhDYWZv?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b9b626-b47b-4fb2-14ca-08dcc72b367e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 06:32:39.4917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU17VrZ+KMvk/Ya2otfWqWZQZXFF8J1hyfYziVdj7V43nZuHTF1SxvYnfoRQXQA39gy7gwerdFPHKP0MNdfyvgV3g465ZXaw2Rf2k+BTrxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
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



On 8/28/2024 11:18 AM, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
>> Sent: Tuesday, August 27, 2024 6:10 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; B, Jeevan
>> <jeevan.b@intel.com>; Naladala, Ramanaidu
>> <ramanaidu.naladala@intel.com>
>> Subject: [PATCH i-g-t v5 0/4] Improvise-the-deep-pkgc
> 
> Should be improve deep pkgc I had already commented on this

I think no need to change the cover letter title. It won't be merge into 
git. The Name change will create a new series so we loose previous rev 
history.
>   
> Regards,
> Suraj Kandpal
> 
>>
>> This update improve deep pkgc. Add a check for the eDP connector to ensure
>> proper connector handling. Increase the test duration to 4 seconds. Modify
>> the loop to use igt_wait for better handling of the package C-state counter
>> read.
>>
>> Naladala Ramanaidu (4):
>>    tests/intel/kms_pm_dc: Add time unit macros and update delay
>>      calculation
>>    tests/intel/kms_pm_dc: Update VRR handling and eDP output check
>>    tests/intel/kms_pm_dc: Update test duration to 4 seconds
>>    tests/intel/kms_pm_dc: Add polling for deep-pkgc
>>
>>   tests/intel/kms_pm_dc.c | 51 +++++++++++++++++++++++++++++------------
>>   1 file changed, 36 insertions(+), 15 deletions(-)
>>
>> --
>> 2.43.0
> 
