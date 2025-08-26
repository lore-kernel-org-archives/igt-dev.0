Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D41CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 09:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97B10E61D;
	Tue, 26 Aug 2025 09:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YnLM1sR/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD78110E61D
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756200083; x=1787736083;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=tJghNpurbBM2KahM9zV+6fZmEs/LoSpoKgJbiMbzDCE=;
 b=YnLM1sR/pauhUn19gxakaHFlfQT2XjMPWEHv/vnYTexj2iQ3S3Iqr1sm
 ZyCQRMY4fR6l1S3evp6n3xo/j5UuArSrZupqMna3JQOd9Z5ND/qBNUCYJ
 mBVHFgFSe6w7kfVcVUpqF5j9/MHR7RLLfjj0QA9tyRvyDoSl0bHPZCE3u
 kZxJtYdFaFAUJ7OcjZKi02YMwwCknLvtqICchJhr2/8kM4vFcASLpYhDN
 hfU3VjXAmlQrHJ5gW0Iic8YYmKNJHEdeGWOIZxTb7aZoykpnSVhgZFsvR
 NW5mQI58fFwjotRiOcsWDC7RJR5Us7a7bjWynbAgNwv7yS/5A0ZuhF0ar g==;
X-CSE-ConnectionGUID: w9PSRPolQS655L5rNl7MvQ==
X-CSE-MsgGUID: Rt8mB3d2R36NR9uDRoB5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58484741"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58484741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:21:23 -0700
X-CSE-ConnectionGUID: VPSqHeVHQJCZaKPTsWShBg==
X-CSE-MsgGUID: B/xfECIuS2CFXH5B3R+h0Q==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 02:21:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 02:21:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 02:21:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 02:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NfgUilcixCt2bW1mwKcr18SdDmuuzHs8wNxKvS9zpfIk38xk2MrNG+/MTqG+xVYcMn2455zPEnmqJu3kpoLDRNIDO+rsN20L2r5s/BYVm292E3CV/vmqrnyKoODA7TtjQgPeaTgZP9YR1iVkqFcZDUxkW93Tp+SYfu/N53cW9rCZlSWKWjHF13sxW8uyQV6t84kas0xueBznRnazvE/ZjibGYXP6DgbfnI3M3UkEw943FqPB9oxBxoG80EfhitqOocFgbkOkQw5nWO0zqImIsLWdb3eIINuNdm+95/95azP98WQQah0ux0j7xg0ip6V0x3w9uZ/K0eTXs7f0rM+PVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJghNpurbBM2KahM9zV+6fZmEs/LoSpoKgJbiMbzDCE=;
 b=gW1UsJtrdd88wlk5yFvhyCtzDGjYM0qdcq5ARs1ZdP/H2t7tj5yTMGSYWWED+XCZZJfQ7k/C/RakLP+OBHJiCXWUgKRTRrTqTK35I5ESkgzsB7EO3WfNkOBuOd/upqZUQfl20qerQR0RUwyF69UwJ90h/8teaCiXt34/y8x5vqc87hPi4jL392kIFm+dBZR4n/5mKiYzamPro6Ex8q7zt7KiaJMv/JkmVlJy2kLIyJ8OlbRNyTMhpSnwPxPR+gkoY87sHavfiPYCh9unflNbyIREhT7FJGx1DxE8+hDsmq4ksEnTj7z+aCJRIFkRNkSz4PCs62vDIGyw2NrSW5cDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DM3PPF1FCD3EAF0.namprd11.prod.outlook.com (2603:10b6:f:fc00::f12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 09:21:19 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:21:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Grzelak, 
 Michal" <michal.grzelak@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_psr: Skip the test when PSR is disabled
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Skip the test when PSR is disabled
Thread-Index: AQHb9Xzj7WkJuOj9GESwx+T8w438E7R06pOA
Date: Tue, 26 Aug 2025 09:21:18 +0000
Message-ID: <e73166b7224f538d3773bde6c21f2ddcfd94e17a.camel@intel.com>
References: <20250715113822.831686-1-michal.grzelak@intel.com>
 <20250715113822.831686-2-michal.grzelak@intel.com>
In-Reply-To: <20250715113822.831686-2-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DM3PPF1FCD3EAF0:EE_
x-ms-office365-filtering-correlation-id: 1ae114cc-1220-4554-2092-08dde481ea62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SnplQUtRSlVLendIVDdDZ3NROUlQOWxxckh0TXZSOWdyM3crZTdldjFjbkUw?=
 =?utf-8?B?L0k0cXJncWVjejVKTE5IdEgwcHZGZG1QKzhMUlYzVldJdDBjc0ZuY3V5QU1H?=
 =?utf-8?B?alZ6SExkWGdtUktzOEgwamltUzQ4OXlvRlRLR2JWemtVL1BYR2dkMTI4WFJt?=
 =?utf-8?B?QTJzRWlrcVdBK3cxNWFZcXpWeHdJaklRY3M0a0lFT1pZbDh4OHZiZ04rNHVy?=
 =?utf-8?B?OTQ3UnlDVG9UZEdMUjBjN09LWXl3Z0YrU3lPSG5vclNCQmE5cksrQmc1S0NS?=
 =?utf-8?B?S3FiclcyT3dIUlJmRnNpR24wN3NhUmR1MXp6WHg5YTJMWDhJdTR0bVlMamZ3?=
 =?utf-8?B?WXZEZm9tOC9mRHZyUGRDekxkTlVNNTJlSHljOWw0VzFDcTBTMU5vZ0taRGww?=
 =?utf-8?B?S2h4OHFpTEt0MjVEQU1sNTJ1L2lldHRQc1Z3bFlxRWxCZ3dta1phcVpubzBQ?=
 =?utf-8?B?dWsrUCthUVVPQ2ZPa3lnUVd4Tjh5R21GN2NuaHpmNGljTGJqenF4QWxkcjMr?=
 =?utf-8?B?ZGNRUlRhU01ESHp0Rm90S0tnNlhkOVRyTUFqN3VldUg5VVdNMStmY3I4Z2dJ?=
 =?utf-8?B?akVpK2FFTHQ5ZVZNcWFwcmxzRXBIUUJNT0tUaFFsQlVaNEhxWDltT01ka1Rv?=
 =?utf-8?B?QjRsVTRkTzR4Ykl6VVU4OXZRZFJ2QlVzVzc5b1AwN1dOUUhucnlWRTYwYzNX?=
 =?utf-8?B?QVM4NmtyNkY1akRXR0NIcHVoSHVFSHlyRWp2eUkzYTV6NlBBQzRtWEJDRkdP?=
 =?utf-8?B?cEdMdUJwNHVNT0xNeXlXMGtTbGVqRTA5ZUx2L2xoY0VDcVB6ZFc5M0ozUTJU?=
 =?utf-8?B?S1ptaHp4ZkFwOUJCaWxNMjg0Y0Vxc3UzYUlZYWkzN1RqVVl4UCs3d0dXSkRv?=
 =?utf-8?B?bm0vSGpBVkdlczdkRWZEMENNdXlTdURiRGRiYy9JMTIxMEw2b3lQK0Q0a0xZ?=
 =?utf-8?B?TWFEOXd2cFZHNFI4b09sUGYzY3N6T3liYjhxRXlja1U3emgrWXpaanNiYmVl?=
 =?utf-8?B?VDk1M1VsNmFlTC9YVVdjNWdZQTdYaENoQ2JWSTcxcHhkbzJHalN5UW4xRzF6?=
 =?utf-8?B?SUh2Z0FGODNVM3Qwd090bWVDRFAyRDdQTHlUWlBtajBSMlB3K3M1RitJb0sx?=
 =?utf-8?B?OE4yaWFTQXRBV3BUdkd4NEpJTEljTDVMMG8yTEorckRBT0hQSDUrZ1g3dnVp?=
 =?utf-8?B?RFo5aC93Mnc4YXp4UnlycXBmbU4ybjJrbWtTUytYd3hpVmU5dDQxNkJkeDRU?=
 =?utf-8?B?Ym14ckg3STJOdGhvb0RVU2ZOSmN2b3Yza0VneHQzR1FSdW9xRFBuSlp4UnNq?=
 =?utf-8?B?ckxaRTFiSDI2Lzl4em1zWENhMnI3Ty9TelpobUtzblhVZmllcVdIcERreWIw?=
 =?utf-8?B?L2s2QmgraVU2Z3RzcTdtK1FPczJhM041b0RqcjYzQllRT2x2Rm8xOHQxSkh1?=
 =?utf-8?B?dmlzY2VXV0xGc3czbC9nZjRrd1Jpa0lIaytITkRqYUNXY3pKVW40MTVhVWRV?=
 =?utf-8?B?NzNxRHM2T2kvSVpUcG5wRW1BVGcrbzlWdWxZcy81VkFENmtUc3BoNlpmclJD?=
 =?utf-8?B?SWdLNGVudXYrWkMvODh1S3l1VnhLRnFTUUpYSzEwdDlwYzRRNHBhTW85dVli?=
 =?utf-8?B?T1M0WG9teWVkdHpaMGxNaHJSUHM5YmhzYVZMbEJDWXk1L01KR0Y5cU52Zjlq?=
 =?utf-8?B?TThJM2JFckVuOGphT0g3ZXRWSDZQN0pmcFRiQ0JpL25qckhkM0ZtU1Q0OVcx?=
 =?utf-8?B?eDJkK3l4dmgybitmUkN0WnZzM2oveHhkbnpZdGJ1VWZoMkNSUEZwZVhTOEo4?=
 =?utf-8?B?WTdLbURPQi8yTWt5UGtHb0lOSU54WWh4NXZYNGI3Y3BWZ1NZSWFDVVc3YWJp?=
 =?utf-8?B?cVdaUmZrUWUwUEo1d3UrSDFuOU9vWlM5YzBDWnNsenlodWZTSGZkRUpNVFJJ?=
 =?utf-8?B?bmQ0R05pWC9jb0ZKTzZTb1Z0RERRMjJUcU9TZWJadFJSV2RzKytVMzh5akJZ?=
 =?utf-8?Q?Pszl5MvoQZXJiN62UBBa5MbLKHX/qE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWZINzZ3UmFXaWR5VmUzU3RnRk5lN3M2dXdZalRKSVhPc3hFWXBWeHpNcyty?=
 =?utf-8?B?STM0SVN0akp3dk1ncjk5ZW50Ykw2dmdrUWVwbEJZM1BVcnZERGpBVXhkTTQ3?=
 =?utf-8?B?UlluNjZuT1ZQK0w3SHAxWW9vQ1Zsd0xycWVkVzhjc1FNQ3Bsa2pibTZkOFpN?=
 =?utf-8?B?OGxqUnlId2hNUEY0bnZFd0x5YjAxMnkyZGtPdGducDJDS3VXTzF4aGZlY1BO?=
 =?utf-8?B?Tkd6c3RPd1RzQWM4RHRkSkt6dkpZdy9yUlVYQ3RVang4azdTY2F1SGFZR2pN?=
 =?utf-8?B?MStuYjQxdG80SCtpMll6MWpJYjhLY1loMno4L2NtQk8wTlJ4VXRlbU5PVFF2?=
 =?utf-8?B?cTVybGl3WHJnc0srdkNwTjdsVTMwdWNXNE55dWgzOTIvVmdtRDRXeVIwYnBa?=
 =?utf-8?B?MVkwdzU3MC9TL0Z6YUQ4UnJKUmhOUlF2OWdOOHovcDV2Z1ViUkMyc1djWFdm?=
 =?utf-8?B?cGtsQk9za21wTzlCdTJhRFFwSXBYMWtHMkVSaXlHTVN0SmVhZ01kNXRvcnNV?=
 =?utf-8?B?aitCelZrWUVRRWtyaGxRdkdWaHp4bVAvQ2ZnSVFFeFJVMG5BODRNTit3ZlRL?=
 =?utf-8?B?SE0ybTBFZW9FWEV6NnhCY1Q4RlE5MlBUcGZzUkl6YlNYc2FQSllid0l3akh4?=
 =?utf-8?B?WUd6cmI2dkFEOXVCc3h1d2d6dDM4YWhvRjZvU1kxMkt0aHBrSWxLWUtZa1Mr?=
 =?utf-8?B?Ukt5ZlVMNGpZb1doR1BGNC9XMjRLQjhGalo3S0dEOW9jUUpHZ0FxVTlpZnFG?=
 =?utf-8?B?L0tNZEw1YTM1cHhtNU5UNzlBSStNaTU2MW5XUm4vY0pSU0o3M2kzWjc5Y1Bt?=
 =?utf-8?B?MVFwZG5WQk9KTXB5dU9haFY5VTBGeEdMWmdFdjJzQ2lMVUgrSUJTV2FEQ081?=
 =?utf-8?B?cGxEZ2V2RmRaQ21sWmNPYkp1ZlFlSlQ2eGRDc1UzNVJJRlU1UytYL0s5WktW?=
 =?utf-8?B?NU5VSkFIU3p5Z0VaNkx1UFV6ZVF5OXFDdzEvSCtLejZwelJQS01YWTliSDVo?=
 =?utf-8?B?bXFDc2pFb0FDbFIvcG1lbzZwMVg0OEN3UWZNdjJrKzNsakZWYXJKVi9EZWdO?=
 =?utf-8?B?OFVqQWFCbUdreHhVNml5SnFtWWFtVjhmdFhXeHExVnZDM2FQbVdKNmMrMHN6?=
 =?utf-8?B?RGo0Ym94cTJxY3p0d3MxV3NsSUFzYU1JUmRJMitYVGhRZDVibXZYZzlQMGsv?=
 =?utf-8?B?SzBHbGhmc05zTERsSC9YckREVFN1b2tIZWtmNWl0YUppOWlKZFdYcXRQckUv?=
 =?utf-8?B?Und6MkJFZGdEMlcyUHl0R2wxL3NiNFF6eUxxWFBkdUQyb1VTSmtaaDJ3cEZD?=
 =?utf-8?B?MWt3WFByVk14M1dNN1c0dEZDK2x4ak9mN3RabUo4M0JnYWYvRG1qSHA4NG1y?=
 =?utf-8?B?M0pnWmdzd1VKUDF5eFloQktxTTJVKzMyRWpuKzNNYUd4UExTN1NySWpHVmNE?=
 =?utf-8?B?a2RoUUVNT0VHcnorTzJ5SWRqc2tvaVBsRXNoNyt5bjB3ZWFJa3hPTzFEalpN?=
 =?utf-8?B?ZzVGSEpRamI3QVQvd3ZFOTk4bXFKQjluMTBBc1F1YWFlaUt4NEZIZnkyZy80?=
 =?utf-8?B?dXVkQ0Z0RlZ0VytENStwVGV1KzZ5dmZkT0pSejcwcDRqZ3M5RG11OCt5ZG1l?=
 =?utf-8?B?TzIvSFdXbkRXRE1Sbm40bzF2elQyMWRRV2lNVkh4Q0NYaEdmalFpUjJkc0dE?=
 =?utf-8?B?aGlFNEE0eDdtTjczK2t0TkRrQ0tGR090cXY2eWtPSW1Xa3J4RkFqdHZ2a0Ev?=
 =?utf-8?B?V2t6NGtQWTE0bkdwMHdhRlpCT1Bwa3p2ZUNMY0hBcGFOU1lmamRuZXBuYUJE?=
 =?utf-8?B?ZXdma0xBVGp4TFdlZ21hK3R6NGZwTVFmRFZkTkRGYlpSR2JadVZxUW02M01x?=
 =?utf-8?B?QUd2VW1XNTBCbEc5QUkyOFAzTUhpeTFEQUZGMUM4aXZyMGlhWEwxZXNuNG1l?=
 =?utf-8?B?MkVEVmlqVU9qT1FKL3VKWnJkL2xLUkRRZDB6bko0SlhjRmU0SkpVOFJ6TTN4?=
 =?utf-8?B?ZmdnckNQcG8rYUcwc3cvWFkzQ1BqVjRMUjUyTnlhalJDbU1pZWFzdElwbFZh?=
 =?utf-8?B?Mm54S3VtTTdZMStQSzBmaXJWalIybW16WkJwdzNXeXpqeFNZVXJDK25Bem16?=
 =?utf-8?B?MkljbDlTcjZ1VlZ2YXNkbW5mOUlaY1NEMWFlUTlicDU2SXV5R2gwamxqU2p0?=
 =?utf-8?B?aUhvRG5WaHhMd09uUjdySFdScnVEa3hwdHNwYXdEUHdjT3k4ZlhKaVpmZUk2?=
 =?utf-8?B?VmhXUG9GZGlXVkxEaGx0VkFwWU53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB8B859DDB3ACC418C60FEB800B5F8F9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae114cc-1220-4554-2092-08dde481ea62
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 09:21:19.0271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: devWU2cRATtT1qSQF0DNSSOvgWx6WI1J2iFmeIrQkoy/63quzCb2f4VNJ3u+BAkt7Goi3pbhwLMPVtN4LyRzDt984itKBA16LxqoWWmaDcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1FCD3EAF0
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDEzOjM4ICswMjAwLCBNaWNoYcWCIEdyemVsYWsgd3JvdGU6
DQo+IElmIFBTUiBzZXR1cCB0aW1pbmcgaXMgbm90IG1ldCwgdGhlbiBQU1Igd2lsbCBzdGF5IGRp
c2FibGVkIGFuZCB0ZXN0DQo+IHdpbGwgZmFpbCBhbnl3YXkuIFNraXAgdGhlIHRlc3QgdXBvbiBm
aW5kaW5nIHRoYXQgc2V0dXAgdGltaW5nIHdhcw0KPiBub3QNCj4gbWV0Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWljaGHFgiBHcnplbGFrIDxtaWNoYWwuZ3J6ZWxha0BpbnRlbC5jb20+DQo+IC0t
LQ0KPiDCoGxpYi9pZ3RfcHNyLmMgfCA0ICsrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9wc3Iu
YyBiL2xpYi9pZ3RfcHNyLmMNCj4gaW5kZXggM2Q4ZjE5NDliLi5mMzUwNTFlYmMgMTAwNjQ0DQo+
IC0tLSBhL2xpYi9pZ3RfcHNyLmMNCj4gKysrIGIvbGliL2lndF9wc3IuYw0KPiBAQCAtMzgsNyAr
MzgsNyBAQCBib29sIHBzcl9kaXNhYmxlZF9jaGVjayhpbnQgZGVidWdmc19mZCkNCj4gwqAJaWd0
X2RlYnVnZnNfc2ltcGxlX3JlYWQoZGVidWdmc19mZCwgImk5MTVfZWRwX3Bzcl9zdGF0dXMiLA0K
PiBidWYsDQo+IMKgCQkJCXNpemVvZihidWYpKTsNCj4gwqANCj4gLQlyZXR1cm4gc3Ryc3RyKGJ1
ZiwgIlBTUiBtb2RlOiBkaXNhYmxlZFxuIik7DQo+ICsJcmV0dXJuIHN0cnN0cihidWYsICJQU1Ig
ZGlzYWJsZWQ6Iik7DQoNCkkgdGhpbmsgeW91IHNob3VsZCBub3QgY2hhbmdlIHRoZSBmb3JtYXQg
aW4gdGhpcyBkZWJ1Z2ZzIGluIHlvdXIga2VybmVsDQpwYXRjaCAtPiB5b3UgY291bGQgZHJvcCB0
aGlzIGNoYW5nZSBhcyB3ZWxsLg0KDQo+IMKgfQ0KPiDCoA0KPiDCoGJvb2wgc2VsZWN0aXZlX2Zl
dGNoX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkNCj4gQEAgLTEy
Miw2ICsxMjIsOCBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2Zk
LCBlbnVtDQo+IHBzcl9tb2RlIG1vZGUsIGlndF9vdXRwdXRfdCAqbw0KPiDCoA0KPiDCoAlpZ3Rf
c2tpcF9vbihzdHJzdHIoYnVmLCAiUFNSIHNpbmsgbm90IHJlbGlhYmxlOiB5ZXMiKSk7DQo+IMKg
DQo+ICsJaWd0X3NraXBfb24oc3Ryc3RyKGJ1ZiwgIlBTUiBzZXR1cCB0aW1pbmcgbm90IG1ldCIp
KTsNCj4gKw0KDQpUaGlzIHdvdWxkIHdvcmsgaWYgZGVidWdmcyBvdXRwdXQgaXMgbGlrZSB0aGlz
Og0KDQpQU1IgbW9kZTogZGlzYWJsZWQgKFBTUiBzZXR1cCB0aW1pbmcgbm90IG1ldCkNCg0KQlIs
DQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IMKgCWFjdGl2ZSA9IHN0cnN0cihidWYsIHN0YXRlKSB8
fA0KPiDCoAkJIChjICYmIChjLT5jb25uZWN0b3JfdHlwZSA9PQ0KPiBEUk1fTU9ERV9DT05ORUNU
T1JfRGlzcGxheVBvcnQpICYmDQo+IMKgCQnCoCBzdHJzdHIoYnVmLCAiU1VfU1RBTkRCWSIpKTsN
Cg0K
