Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E7BC8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 08:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAAD10E9CD;
	Fri, 11 Jul 2025 08:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ed+Ogump";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5132310E9CD
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752221435; x=1783757435;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pp3calQkFrt73o5Jvbh7Hs7fMyiMqVVcAlkUQNZizfw=;
 b=ed+OgumpHesm/sfgwvPvTy5lBvFcpAj9/tzD+xaB+RyT0YW+MdJjydP4
 l7LG9x8vFqdlWdUx4ylu3ROfpmpQB8urOAXsgRbtEsKkTMt7dNww60UhC
 2BnCpYUMiNULx6pcMuW+GB35Zx/tpsfBtK/kb7/lpJh0phhcdRzK0Ai+M
 feJb9lapMV3Jg1qNktFLHiW8vQT9i2TciUKxHgXQB113PsZFKr7OdW/QL
 knYLJh8l7Q/gIa93a8xyHFtfVzTTtHRV50uMmCQSVTC8SjtXLk0LlEynC
 GvCWR/cR8pDmV/U+itjsz/W9SqyvaRTYf8+cOx/g8jSJ5psUzshPG0ySb Q==;
X-CSE-ConnectionGUID: bL1S/b4eQ6Cx3kO5kfidrw==
X-CSE-MsgGUID: J0FtBcdTR4uV1t2evYpDEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54642902"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="54642902"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:10:35 -0700
X-CSE-ConnectionGUID: njX9B5CJSguOXniCbc3rww==
X-CSE-MsgGUID: 5bmz9hQbQM+5yXjZSxwd7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="193514420"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 01:10:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:10:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 01:10:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 01:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOzqqnSluS+9Zv1lI98zrnHA34QZGpHrjyUxALzIkI51HRmUCJiX/PkPkPLzSmQQi7MtkEhr0j7LYgmWLs51PamglNivB4HGqcnQqhlT3rJjuCzDetWba6wtI1KH1yv5OGe3ZrCcO1DdCVZhPwOQcPZoz5FwuL+kjUV3xJmGmoyd9/m1R/OjkQbAPEKpPneuhJoR9USfwELW3UNSeQ6Iji5paGzb/2hO2gqGiqth8dlHdb1ygBGtuzKguNRwcPdoNqoHEhmPQrjVm3DE13t27/YfrHPhPWZtqrz2gODm7zcHxarCSvtsL5FWc0fxald+kEH0e5swzg+pSp7oswuHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/XAwBoyGss1XmyEsKvL+ncm4DIyHyaEJwnS/FQGBLk=;
 b=YhfQbdIGEcJkYKJ4MSyXtW0SybIQBMRG8/8qMuLxJQ870sq+z1Y7+thCHF46EX/4Y3AWgKpUOeTgIEkBogQybfyp6AOLqqLQgkwuibfGbiOETWZVAlfzVYlvlIWxaKnnuKIg6qQIvatBshpYjA+qA4h+4+bhLM0+J+qSH8Wj2QorE30nk4b85BY7V7x4wpTV4cyS0HLCM/sveqOAo/tosXwV+NuHPWGEBZ4J8zQYnxlw4aexWPwWfxv210T22o9wOLhSQGzupjGhXWK+9prapM/7tJZXe8It7EAiOBrzlSnHl10MygEZn9hXsjck02Vu4uYQIfiGUgddNbGKlQeZ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CY5PR11MB6486.namprd11.prod.outlook.com
 (2603:10b6:930:32::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Fri, 11 Jul
 2025 08:09:46 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 08:09:46 +0000
Message-ID: <234d7bed-0b12-4a4e-80f7-089128997e9c@intel.com>
Date: Fri, 11 Jul 2025 10:09:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_sriov_debugfs: fix musl libs
 compilation
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <zlice555@gmail.com>
References: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
 <20250710190017.167735-2-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250710190017.167735-2-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0115.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::44) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CY5PR11MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: ab365448-0713-4871-970c-08ddc0524cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3JpUUZ2Z3ZXSndEM0lSZmJnWTVmOGpPRWlGeXFPNVI5dTNNMjVscCtxN1c3?=
 =?utf-8?B?cUVwN3AxaTVDUlJuaElEdWJKWU1Fc3NyMmdPU1cxdU5LYnVFNWtJZGtuRTlp?=
 =?utf-8?B?aTBmdnFNdXhwOG0vUVk0TTZ5VnE0LzkyTndSSEhhTFlVcmtpbWxFTjZabHAz?=
 =?utf-8?B?N2pZZkRkSUlaam5yYXRpSXljUXZrTE90UVY3SkpsUHc1QXRCSHY2UGVaek9T?=
 =?utf-8?B?YllnaGtvMXZ4cXFWU1lIclA1RkY0ZWI0ZGF2REk2Sm5rVUF1L1NxNlNRN0R4?=
 =?utf-8?B?TWVJYjBJV2dycHEvRFhEcGIrcmFrenhGREI2WkZNMVZPbkdKaEpIbXNvaGU1?=
 =?utf-8?B?WFovQ1Q1Qms4ZWpGTHlLbUx1bnk3TlY1czlwNDdhVmUyUFJjaDcrVnVRdXl5?=
 =?utf-8?B?c2lzOGUwZFIrbVBxVWtzSDM4QTAxeGs0Vm1ncno4OXE4K3A0UFRIblFpbEpY?=
 =?utf-8?B?N2twNnRQQytiQkxjSDdvZHo2N1Z1ODRUMVMwZWErc1FBbTVodW9SV3l2MUVZ?=
 =?utf-8?B?ejd1NWNFQ293dGlqd0E3Wlo5b3BzUUViZ3l3TEdRSERmeThZVlI0WFRIQjVZ?=
 =?utf-8?B?YTRlalR3cnFMZ3lDS2tHWkZBVlZqdm9HZXEwenkrdXVYb2lKTzZBZU1zY3N5?=
 =?utf-8?B?a1ZTQ1Y1SVZ4WXo3cFY5Z2xMb3lTRC9xTGx0QUtuZGhrOFV6U09STklhQzFa?=
 =?utf-8?B?ZUNWMy84eTI5ZWZtWjNGbXJrQzhlMnQ2SDNuaEdWM3BScitSYzJTYU9HbDRq?=
 =?utf-8?B?TU5MNHgyUVU3UWhKMzVaWG9SR0tkYmFxcGw4OHNsZGcza1RCYTBIK2FSUTFE?=
 =?utf-8?B?YU9TZEI3b2IvcjhzNVV6UW96d2FhczRjRHMxOTB1UmpRekl4Tjdsdldqendr?=
 =?utf-8?B?Qml2elQra1VYN0xWMWxhTHBOVEZPSjhSNFgrbk5TdFQzMXMyMytJN3ZlR2lw?=
 =?utf-8?B?OWpHNDNveGFYZGh3R0g3a3JPWU40Z0xteFdHR29naC9OUU5ndTQ1WnQ1WmN4?=
 =?utf-8?B?OC96ZzhKL05vOVQ2YWUwS2hRVkpnaFA2VXhKeG5GbUJiMFBVMnJleCtwdUlk?=
 =?utf-8?B?cnhFb1VJTFhhMlhSYm9JSlppWkZ5Ynh6ak9vYlE3OEZhWFhPc29xWk9JSGZZ?=
 =?utf-8?B?QkdWSXVuT3ZhaW5xR1hNb2dmT3FEcVZiUTUxYnQ5alhwZ0hBTTNBMnhodFgy?=
 =?utf-8?B?RFB5MFFzN0dxbW1DamRaNlIxUkQ2d1NZZFo0Mk1mZ0F2WGJUZzAyV0FoelFD?=
 =?utf-8?B?K3RlaEJYUzVnUituRHZ3UW1QaWtOWVZMRExlbzVLQUgxR0dnUWJtdVFQYjNI?=
 =?utf-8?B?a2tzcFVmMC94MnlIeUYvaXJ4WU9pOFE4bTIwaTBHMHlNNjc1WnlDbXVlakhm?=
 =?utf-8?B?eWZFZjZLZGdhQlBQdVpJcGEvL2FuZUVseEdBUloyYnlLckY3ZkgydDRhd1I2?=
 =?utf-8?B?dGZEVnpKR2JhSFFFd1NkZi9VNjdEZ3RXbFJCeVR2RmxXNTR6V1hzaVFhYW1I?=
 =?utf-8?B?NHZ2dTNpOWR5TEJqVnhsU1M1V0xTTFNnVVNkQ281bSs1dG4wd0gwYTJNeXJt?=
 =?utf-8?B?UVJ5QS9yYWtSTVRQVEcrV20vODRpWnQ4NkZaUWVxbWVjM2tDN0RBSVpiU3l4?=
 =?utf-8?B?cldqaHZnb3BIMEhoVExFMERpRm92UmxHaHhDYjhqdm4yNXVmVCtxcHM4L2xz?=
 =?utf-8?B?ZnA0dmd4bjFpRHUxVnVMeUU2T3BEVkNKa2FTL3JzZERLQW1ocm5CS3FVN0hF?=
 =?utf-8?B?cGNtT0tsOE5rSjJ5V1hNODdEZnJ0QVE1Z0g3R0Z4cExEclpSczZmRW9Bcm4v?=
 =?utf-8?B?cHRPalE2UjE0TjIvQzdFMUtDL1kyc2d6VXYyeFZxSGhOU2JTa25CQ0UvQUlj?=
 =?utf-8?B?S0FhZkpxUGNLcDF1bjJqQmRyN1pwZnhpRW9oeGRqSy8zazFDY04yWkE5NXdn?=
 =?utf-8?Q?YV+BHYvFqUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmlrTVNkdkhrOVdzTS9mYWhTRkJsS0RFaUREVVVPRW84djg1WUtTT1hURmVL?=
 =?utf-8?B?cVI2Z0pBcUF6NzgyTzNRNkUzbEdkeVhmSUJtaEVpZ2xqNFhoWkx1OE11YTFx?=
 =?utf-8?B?YURRWlV5aUNzMC9aUWkycER2VisyUUlxbDJGQnh6eFlyVFE1WG5aY1NnakI0?=
 =?utf-8?B?WmhkcnFpK2RZZWkxc3ViclVmeEhYakxhVS9MSE1nYzJybFJsOXZSdGRwVVRF?=
 =?utf-8?B?Rk1ienpUWnl6dzIyS2ZhNlZDVjVCdWR6ZGxsaWl3Sm1TRExiVVFYKzhTSVBM?=
 =?utf-8?B?Rk9SbHp5TnVMNm5teU1NQUwxWXpkMXFjWXBPc3UvbnNwNGc3OTF6K21rNFls?=
 =?utf-8?B?NHcrZGFnVnpQN0dYaXNUWERoQWZkMzk4bTRhdnQ5bGRiZTRDQ1EwY1dMUlZF?=
 =?utf-8?B?NzF6ejFQVU1heTMrOUtCdjRxNlFhNTNONDdLSXByOFMwcWxJVW1xTGE4NUpV?=
 =?utf-8?B?Tm9xTnRNZktrckE4TjdJTkJKdXRLK0xHeXN2eG80V1JLN1grNVhZZksyWVl1?=
 =?utf-8?B?NzdrNXpnVjVZSmtkdDFaaklFNXhNNWl5cHRwOC9hWDlSbzNYWi9GRDNqN242?=
 =?utf-8?B?M2VjbDB3SGQ3SGZvbEl2TUw5YnBQMnlQWERwbWFZYmtENDZqcS9uM3ZBN0kz?=
 =?utf-8?B?TVZvTXhOWnRZRlF3VElrRE9paEZSN3ZHaHhZRXZaY1Y2T1RtVDBEVm0ySkJL?=
 =?utf-8?B?ZjRRNGRnQlVIM2VRK0xHc25VVGJMVDZjeDB5WjhzTFc1SDltUDdQMHpkZm1H?=
 =?utf-8?B?T2VJa0F6emtlNzVBQjY0Z1JhR3NQNFAyMTlTemFQdkQ4amkyeGdaZUlrbEgr?=
 =?utf-8?B?ZDBzOTNiSFRyOU5YVmxQRjREbG1YT0ROdmlyS1hpTFRjOE0vVE1CVHBFUjlE?=
 =?utf-8?B?VE1BQUxabDZaV2IyNTZLcDhmRzFyN3hiSU1iL2NCd0VOeG5iajNzcmYvT1Bu?=
 =?utf-8?B?S2Q1OXBRd0RxcysvN0VlT0NDNGkvd3pnMWMyT0Z3T3FPdFZ1RkxubUpBemdy?=
 =?utf-8?B?bHlFUmRvYTVUdHhmcGdxVDNqR3NVQkJ6K053NU00Rk1PYms0b3R3UFNqR3dp?=
 =?utf-8?B?ZWVzNFh4OEJGYjd5L0RmcTNTZVFWZllKMldCdm9sY0llQThKeDZXaVREd3Fv?=
 =?utf-8?B?MVI4SnpqK1h0OXBacTNxMXlMMVBlbTBUNzBwMGhYdjFwQTZsblJYS3JMZGJk?=
 =?utf-8?B?RXM1Qk9pUERyb3pCWUtUNVc0L0VESnF0bTJJcXIvc29FR3NVVjYzQ0F1WWs3?=
 =?utf-8?B?dnRERTk1d25FQldUUS9qU0ZUdDA0TXFSVkREQmR4Vk9jVitQczcyRVluaGxh?=
 =?utf-8?B?YXVsdDhsVmJwbWZ5b0txYmdPdlViemxtSXkxNHVSMWluci8xYjQ0THA3bVkr?=
 =?utf-8?B?bkFVcjhLYkpoMGZ0cEtDQ3dBVTVTRHhUb3crYUVla1ZIeDRqaEpWWjBEdXcy?=
 =?utf-8?B?eFlUVGhIOU5JRjJKUElEL3ovMnRNc2xKZ0JKSm5iUExuU2lxZXA2SWtSUzRT?=
 =?utf-8?B?aUlpdlp3ejJqTjRDNTIxbTBYZU05dUN5MFBycjBlaG9pT21Wc0thOXRWUXZs?=
 =?utf-8?B?TmNXRlZyTjFNcG9PcGY1dzF1V3N4YXh6RzdIRTl2ZDdIVmZRM1ZJUDdUNG1R?=
 =?utf-8?B?UytlU09GcDBRNkwwL3h1aXRyS2Y0Zjh3Vlk0UWdRM3VKeUJTbFRDbUtLbEZ4?=
 =?utf-8?B?cHZvWXJwQ3lNbzRrdU84UTgzMkpObHUrVFJMKzFkZmtjdjNFNnZUMHlWUisw?=
 =?utf-8?B?bFRqc2J5ZU9vNVRsREdiREFRQ0h4ZjMrdHAwRjZUb2t2UEFOYnVuK0pRRjhI?=
 =?utf-8?B?UDF4SDFzaGtWUmxOSEI3aGE0YVpFdmU2K3JSdFhEN1d3YVJmZkNqMDIzY1JZ?=
 =?utf-8?B?T0pKaVlDTk5JaFRNeFpuczdiWGZwTFcwU1hCNDloNmtXbTNocWcwU3JYUFU4?=
 =?utf-8?B?ZkJWbStkZVJ3UVMwZFFSQ0R2N0o5cVlLRmVCSDQ0STdoQkdRUlFoT2I5WGVi?=
 =?utf-8?B?c0RtWG1WbkttdXc4eUtEVVFXMi9Cc0tDR1BnR3NJa3pnL2FZUGhJTno4NjdN?=
 =?utf-8?B?a08wRlgzNlp3eE9qcGk1Y3dQN05jdUMzVzZKNWEzeW1rMUJnUEdLYmFYZW00?=
 =?utf-8?Q?hmP+jA9e5d30BabAj3KH/89we?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab365448-0713-4871-970c-08ddc0524cc9
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 08:09:46.7608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmXPRe3uv2zO6YzznHkAfIe7ZFfHddEU1vbngKXDuaA6jiG0UAVc6SWleQbmNQvCkTI3oZVl20Elm9G2XWk/RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6486
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


W dniu 10.07.2025 o 21:00, Kamil Konieczny pisze:
> Fix gcc compilation on Void Linux with musl C libs, where
> igt header misses limits.h
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/xe/xe_sriov_debugfs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index 9b743f657..e12e12c8c 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -5,6 +5,7 @@
>   
>   #include <dirent.h>
>   #include <fcntl.h>
> +#include <limits.h>
>   
>   #include "drmtest.h"
>   #include "igt_debugfs.h"
