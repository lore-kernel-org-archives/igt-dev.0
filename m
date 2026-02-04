Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD3E9D3E4
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE25B10E65C;
	Wed,  4 Feb 2026 14:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGzfYLJf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B1F10E65A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770214592; x=1801750592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EVCvbSeKAnWVrD9cKyE3UiQ/m5pCxbiIBcSMTtzdzBI=;
 b=AGzfYLJfjNQjO1MU/Jkkh4fnvri11Qs9SrT8mnsKrDViwhOwbHWxHP0j
 I6s5XmlnbxCXYDycsK5UGaDqEnWhjK7taUsKEfxup13NQevXhwDdL/jTJ
 TbdMgzysGjw/Ze0jf0nlCk5SFs/vfiuEmzRKKjbgllBkYbPf0u8YHZ4IA
 R9yohmJAHJbRJ+S4aUDpZAJnaejcS0z/M7gh5qGzVPmu4icIAaetHJHam
 vG76zXXJdwr9kSkPHciLTK+knWnCMw2PD9k4a11AIuYhbnUwROsAzpcl+
 TJdxNsfrLEvmbuo7S2WG7r4lETn4VGbkHLdaiIPi7Ki2BAPkP/5nUgHYH Q==;
X-CSE-ConnectionGUID: 97wZRdIDR5uHdsZU3904qw==
X-CSE-MsgGUID: 2Uy6ZJPoQKOkPM+ZpS070g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82835220"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="82835220"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:31 -0800
X-CSE-ConnectionGUID: WgWsDIrJQ3aJuRKcw0Eqag==
X-CSE-MsgGUID: fH1mz0ZuSHi88D8ngIJQgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="214668635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:16:31 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:30 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 06:16:30 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 06:16:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FA+t3ta0l0c0/WD8ZPBtcIUUgsYzHiDaFDcf6Qt7SKu3OlCZjtihKOHLnA1vWESHo3u8gDuZeDISZSe7V/tN0fMGd6uyDDkkMHEowo7pAv4GpQ0k2//2b0iLihx4Ho0MOfASKVAmn8Kq5idNkIjv3uNMBFn4HPFGjp/Z6/FCWDsXpq3z+hewA18GDFDQepceZtbyIyym+Xr5YLcv2bwqYvtoO+sEL/FrHyrLaBxAOMYHy0KZhPPjw6Hz4V69EA29vWBfGvAE5QU38ZY9wwfSiMjGIL5avKSbxE+dbd+abX0kgkMC3qmZ4EjkVa6ArYpeE3O5YoLv4kHRygBdaSXhrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er8Nr6Rb4CSEniOqQ4v5dNVPURZmF5TGLGg0oL3BQwc=;
 b=OC69hd/yAg9Lizy2j7LkwCYYIqR8i15If+mfFD3o0dnHnCtTBjjDpIl+MKJ1ZUUYogVBxxJ0LFlfnS/5SWwdGzigXkW12ZEWRJR8XkOAqX7ZA166cf9n8LE5FZiRZqDTSGCF0uR117JZQA6d9qx7xBzNmMBFrLznO2lHjn1GkrIns7lqID8qP1GMHAYPcp2e+A2KS8PKyt4ysEO4PPZ+zbwYI0clEAT3PE5kEERt8i1W3DPod2DxPAJ8JRCHYDn4T69Oqowo5DlbfFW+9r39Dmu97LfJg4oG0Raco8wzkuC83+U3Q2las5Ye80+0wg7vL88Fvak4zw9KL3yPefY3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:16:27 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%3]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:16:26 +0000
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: [PATCH i-g-t 1/6] tools/meson: make per-tool dependencies instead of
 using global deps
Date: Wed, 4 Feb 2026 15:16:03 +0100
Message-ID: <a5e52453497b053767bb001cee20c7ad200a764c.1770212190.git.sebastian.brzezinka@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770212190.git.sebastian.brzezinka@intel.com>
References: <cover.1770212190.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ceb957-a74f-488e-e1c8-08de63f7fb60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTVqcG1TRUUzbHVyaTlwMU5pWmY5b1Y2c3JHOFdOczFnS2xVeDhXSWM4UE9M?=
 =?utf-8?B?MkFWQ2IvalV0dmhkdEMyNFNlcFg5Vi9Ua2ZGWEpRSFRnMjE4WC9VTDg5U2lD?=
 =?utf-8?B?R3JuWnEveFJON1l4UmNUSzNDWm00V2cvZkhJdTdKV3l0ZUtpSm5qUTJWUGVu?=
 =?utf-8?B?ZWNuSkZZZjhKSFhYQkgvNlpwS2RLZW10a1ZRNnJFR1FKTEU2MGtFMlV6Rmds?=
 =?utf-8?B?NWZMaTE1Qy81RlJmVWx6bk5LM0hncWlkSUl1TG9QWG1PaDB6d2xsVzltK3Vl?=
 =?utf-8?B?bExzS3FlT1VHWDdTcGtrdUc2Slo5c2Jqa002YWpSQUhUR1kxeHFJdk5ZSGZN?=
 =?utf-8?B?bVR5R1pVK25zdVhYSXM0cnlYTjVaZVNXdWsvUHVTV2N0L3NEWjlBQXc5cStN?=
 =?utf-8?B?em16cjQyQURQa3Bhd21vWkU3NW9LYVdRRjZrWXZ3ZElSdUVBUkNwa2tScUly?=
 =?utf-8?B?TFYrWW9kdmJwMTg1L3VlYW5qV2RZRjRjRVl6Y1B1OFM1c2d6QkhzRjBQZkU0?=
 =?utf-8?B?TUI4NGk4bVV3VHpUU0JlSDdBZENUSzhJRm5NS0dWNnpydk9kWUR6UHZDTVZO?=
 =?utf-8?B?WHZXdWp5VnFVNnZEMitRalBVVDkreWlWQ0pTZ0VTd1Nmc1NsNXhkSllqQkMr?=
 =?utf-8?B?Z2VwMjdvWnhaVTNKVzRwRjBPSFlkSkFTeVVjTW5BbERwZ2g2cFdCVmJYZkxS?=
 =?utf-8?B?K0I5dWF3L1IwRDRrWWNEdWpjM0cwTWJzWExFaDZocitFNDNQZWloSjVnZ2lt?=
 =?utf-8?B?c2ZQb0ZjWUVCRG51cXAvWDZFYUl3MGxMdnpGaTYrZnVqTThzR1pFWXBDTEhM?=
 =?utf-8?B?bzdaTWtKY0tsdnVZUEFXa08yQWh6Rk1zWmVBSXVTUzZuNDFONW5wa3BYZllZ?=
 =?utf-8?B?dytVK2Q3N29ETDA2bnorZ2VVWnRxVlRLOTZSMjg1eHMwM1JMZ0RxbkE1SHRt?=
 =?utf-8?B?Uk1lbUJRR1FMMTgvU2doNEZMTnFDZHFlUCtlaTlyNXdoalUxN3NRRm1CL1Fx?=
 =?utf-8?B?S0s2RC9QUmtMNXhhK1NPL2IvUGhienVCMk8yQzI4SzhnOHkzclI4QXpzejAv?=
 =?utf-8?B?V3VPaXhxWXFVc0pYUHB4ZTFtS3R4MHEwZnNBcHBpYnBNMkZYT1dHenJCajF6?=
 =?utf-8?B?eVRrQktUKzk2ZHZidWluTDcxNEhXNzJOSVBVWDg5ZXY2VTNIV3g0ZjRWQ0FU?=
 =?utf-8?B?bEM0cDgvSjhkZDh1UC9USDNscFRpM29WNCs1bU92ZmJpMDZDOU1iTlkxTmEy?=
 =?utf-8?B?cWRiWG9FdW83ZENEWUF4UnRKa1ZGcDFKRHFGdmhtRHhqOCtSdFRnL2FIQXlV?=
 =?utf-8?B?dEExdmcyTHAySEtzYkRPL1kyemY0N082Q2I3djY4LzE3K2dYanFvNzRGZWV2?=
 =?utf-8?B?UHlwaS9wdmRwMTBDOGR3djlWcXBsZ1hGRjlEVjlGWlJXR1B2ZjZ3M3hveTBq?=
 =?utf-8?B?THNnYzdpWTUwYm13ZEl1bHRQWUxGd2k5M3BVOCszVWJpRGxneUNNcm1KalRp?=
 =?utf-8?B?c3JrYkZCbEExTmFWRkhwTHBnT1l0WlhWTk9ZSDAwZ2kwbi8zczJvcTlvY1pa?=
 =?utf-8?B?VUx0RndRaXVaLytnTzRQcTBiR2w5M0t5WUJKWG10VnJKZHFVTjZkbVd4WVZL?=
 =?utf-8?B?S2tPZE12K2pBeUJ3NlJzbCt5N1FDdnFkYkdMR1h0TGJKTGlGdlFyNEhvb2xi?=
 =?utf-8?B?NCt6UVFnNXlTTUUzb0Z5VitxNG1LSGtyeU50S3N0c2JEM2VISG1ZQTljTExw?=
 =?utf-8?B?LzIzVU9iY0t3ZEQyWExxYWFXdG9KSjJFSDN2dFNhUlJwemFKYWdiL00rcVJ4?=
 =?utf-8?B?dmFCTmxkUkNZTGhFOUt3QXZJc2FpRGZGYk5UQWJqQlhnK1ZNaDdKZkNvRk5m?=
 =?utf-8?B?NHhUSFJ0a1dTcVliSStGMWFlcGJlM0RPNnpYK0dCUzZidk1nS3h5TjFXTXcz?=
 =?utf-8?B?SDVwZ25LWXlpNGtiaWUrczBROVVKbzZVWWR2bFdGZFhkaWtseTh1RG0rZ1R1?=
 =?utf-8?B?dER3QndQK3hFS1RLSHY1Z3BHSWFPT2dkN3JPZ1o1M0srcGc2d2JLb1RIY21w?=
 =?utf-8?B?NzVRRkt1TnY0RC9ObCsrYTlSV2lDMVM1ZjNnUks0YmEzVHVNbFlldmVQZ25n?=
 =?utf-8?Q?r+TI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2svSlRhUFh5cmhCayt3Y28xRWgrTE5FQkU4MDloUnMzczlqUW4zaFBqbCtN?=
 =?utf-8?B?UGc3R0R1MDUrcGs3QmpBQ2J1M0lDNC9NK2d1TWFrVkg0ay95eVAwQmw1OC9B?=
 =?utf-8?B?bHdJUTQwVklESkhtaFA2Rnp5L1lrbWtEOXdqUEZBYU53TEJ3VlZjN3V4Z3VV?=
 =?utf-8?B?eGg1dGkvdmFrVUZhWXlnSVUwTWFGL1F3dlBsamhnSUdsdTNUdEljWmVTNEVY?=
 =?utf-8?B?YlBCdmk1YTlkVzhwamFXenFKblR0WDNra09obFc1NHlPUW9mUjFIWHNNZVlE?=
 =?utf-8?B?SWdzTnNBMk9KV08yZXVNem8zZ3hFNEJLOFhnRTVSRVdsT0l1ZmRYUlJJMmVu?=
 =?utf-8?B?cEpFYlJUWGF4eEViR3cwS0R6NFZ5Vkw4OENVcUwzS3U5bnpGdW9kaUpPdm0y?=
 =?utf-8?B?a24zdXFRTjZiWTJTNmhmMTlUakh5eDZrNEMzUUpUbVhTOS8wU3VuWS9QeU5H?=
 =?utf-8?B?cUdaWlV1N3lwakZ3N3lla2NUT3NsNDAyci9sY1pUVGh1K2hxbFdXYUhzNEx5?=
 =?utf-8?B?SXdON01ib2Y1bHd2VnVlT2k0d1UvbGcxWlVpbmtWV1lzYlpwZllnaVIyOWdH?=
 =?utf-8?B?TnZwQldpMC9uNm1qYzhHanNEL1JoSGZ4SnpDclErV2dnWkc3TWhhMnduREc2?=
 =?utf-8?B?QWpaelk5dnhFWlFYQ3Ywemc3MlVrNDhrM2RvQ1BOZGtoVUVFbVhQRWFlWml1?=
 =?utf-8?B?MVd6cFFCbGNGOGgzbUM3dklJNmxhNEVMNGdYWlNqN3lBTE9XRnRVREtiMHFI?=
 =?utf-8?B?MkgwUzd2VUNtQ1RjZnBHQWZhWTAvREVzK294QlhSeDlvYWlWZ2szbVAxajJK?=
 =?utf-8?B?ZHVRUGhDVVNVOUNWWFRNNU10NHBVK2ZYUWtURndqamtMUXplZEN5dVRKZDgy?=
 =?utf-8?B?RTJxUWU3djNJVzM1U2FGNHpjbFB6Q2pLclR1azVPcVNiQlZFcncwK2lqMHNz?=
 =?utf-8?B?UlBLcnRVcGJrU3dJdjBqRHZhU2FpMXQ2RnZCRkVJSGQ0UkpTb2V1amhvYjRs?=
 =?utf-8?B?Zkp6TTdXQ0gzcU9LWFBCQSt2OHRhTlk1OU1OSi9lR21tcUFjTGtrVFZ0Vzk4?=
 =?utf-8?B?SHJmK1JXOWJuQSt3cU9ON3lEL2tKZjBvWXI1ZkFYQzQzbm9uNUNHSGtJTURv?=
 =?utf-8?B?VFNROUU3blpOYUpkZmtTTW9iWlZWd1FmMWVrSWR4ZThqN2V0dUlIMFI3S2FK?=
 =?utf-8?B?RlJWU2dXOWhXS3VGQ3R2cVJ2eVRLRjl5UzhQT2lFTXRhU1pSNkZEc1IxMVYz?=
 =?utf-8?B?Q1NtT2tQanl1MjhFd0dsSjB3dnZwbFpyUlNRM2loYnFhelBvR29sWWZlY3Ez?=
 =?utf-8?B?MWg1bERkT1lBcHBIRjNvaVZDcUcwV3YwS2N5cGhhLzBqZVVxV3ZUNDdIUmVP?=
 =?utf-8?B?M29XNkh1bTNiZ3F3Wm93SHZDa2hRSVNIRGxOc0txSEtEaEJXTG53VnExaGVm?=
 =?utf-8?B?ckVUbVl5NXpYZXhjUFdUbG5jRXhzaEYrUmN6QmZ3SnV2ZlNzem0veWQ0Y3Q5?=
 =?utf-8?B?VlNXZk5QNlpLNDdSc2xpVFNmYUE0bFFESWwrWUpJVkk1MEVQcW5yeGJ2YXho?=
 =?utf-8?B?V0hibEhwc25jVjRWbG1aWmlkczJhU0s5WjlFZ2t0cEQ4Z3BKaHJCUmFCUitD?=
 =?utf-8?B?Y00ybWFod0lEZVZ0NzZkRHZIK2hIUGFyUjJIWEJTWEo0dnRFV0g4Snd5cHBM?=
 =?utf-8?B?Zmh2Q21ublM3VWtQM2RvdzY3SUtXeFlINlJIckp3ektueUZCTTZEdWVFR2M0?=
 =?utf-8?B?d0ZXVTFoS0NrZTM0K0VVL0NGblVkczVBTnVqcVp2ZVdFOVQvTjBZclpLVjNq?=
 =?utf-8?B?MWhSYytkMnc0WkdxcE9JbTg3SFdqazdxdHBPODVKTlhPTVR4Q3ZnVWtibE43?=
 =?utf-8?B?RU1IQjE3ck1oNThKV1pDRndFOTloTG5rVnFqOGM4LzRSeVlqNzBwaDJLUjNp?=
 =?utf-8?B?OWhvMHpoRU1qWVF3N3N5aXd3VXl4Ri83WDA1bmNHVkVaU3NwYllWb2FrdlJO?=
 =?utf-8?B?YzluRGZJRDQvR2w4T1U2QWFCQ2cvb1lkeXFrL0xvS0xZcnpSanZDUTVxaVU3?=
 =?utf-8?B?amVUeDFFdmdSbnV3cms4eE1VU05xWmRVSnhuZDZ4YmZ6QnQ4c1dENGxNeTNh?=
 =?utf-8?B?RTRzZGVaKzlBbE5JeFJMUmtLVkhHbXVnMFduNjVWcW03SWVnYWZKdkF0c2Jw?=
 =?utf-8?B?RGlxOTFqOGxRZTNXVmcvQXVXUzRTMnlaR2lTZEJHYUhJd2J1R3I1cmlEajVK?=
 =?utf-8?B?bkdrd0lETGJ6OW9OaVRnKzZ6amtHWGhjYnZUOWIwLzNqOGdNaE53UHQ1VzNV?=
 =?utf-8?B?M3R6Qlo3L0loTlpSMUQyYUlSSGl3NitmYmZ6WDdxd3F5VDRYL3Fsb2RodEQr?=
 =?utf-8?Q?7VnLKSY2oL6off4Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ceb957-a74f-488e-e1c8-08de63f7fb60
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 14:16:26.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlr3HPxlrk2vAVZ//gu4OkA8oINmh73gIhHWMxFg0VkgookJB0hGsco1FSoA3vdB7hX4fUtQ6Hkz66Jd+n8DnM7h5LWrXvrsGO1TF/Me78I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

This patch updates tools/meson.build to stop linking all tools against the full igt_deps
set plus zlib. Most tools don’t actually need cairo, glib, udev, pciaccess, or
zlib, so the blanket dependency list pulls in far more libraries than necessary.

The patch replaces the flat tool list with a dictionary that assigns only the
required extra dependencies to each tool. A small common base (lib_igt, libdrm)
remains shared. Everything else is added per‑tool.

Tools that depended on global deps implicitly now declare their actual
requirements (intel_dp_compliance, msm_dp_compliance, intel_l3_parity, intel_reg,
amd_hdmi_compliance).

Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
---
 tools/meson.build | 100 +++++++++++++++++++++++-----------------------
 1 file changed, 51 insertions(+), 49 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..acd394e23 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -11,51 +11,53 @@ foreach prog : tools_progs_noisnt
 			install : false)
 endforeach
 
-tools_progs = [
-	'igt_facts',
-	'igt_power',
-	'igt_stats',
-	'intel_audio_dump',
-	'intel_backlight',
-	'intel_bios_dumper',
-	'intel_display_bandwidth',
-	'intel_display_crc',
-	'intel_display_poller',
-	'intel_dump_decode',
-	'intel_error_decode',
-	'intel_forcewaked',
-	'intel_gpu_frequency',
-	'intel_firmware_decode',
-	'intel_framebuffer_dump',
-	'intel_gpu_time',
-	'intel_gtt',
-	'intel_guc_logger',
-	'intel_hdcp',
-	'intel_infoframes',
-	'intel_lid',
-	'intel_opregion_decode',
-	'intel_panel_fitter',
-	'intel_perf_counters',
-	'intel_pm_rpm',
-	'intel_reg_checker',
-	'intel_residency',
-	'intel_stepping',
-	'intel_tiling_detect',
-	'intel_vbt_decode',
-	'intel_watermark',
-	'intel_gem_info',
-	'intel_gvtg_test',
-	'dpcd_reg',
-	'lsgpu',
-]
-tool_deps = igt_deps
-tool_deps += zlib
+tools_progs = {
+	'igt_facts': [cairo],
+	'igt_power': [],
+	'igt_stats': [],
+	'intel_audio_dump': [],
+	'intel_backlight': [],
+	'intel_bios_dumper': [pciaccess],
+	'intel_display_bandwidth': [],
+	'intel_display_crc': [cairo],
+	'intel_display_poller': [],
+	'intel_dump_decode': [],
+	'intel_error_decode': [zlib],
+	'intel_forcewaked': [],
+	'intel_gpu_frequency': [],
+	'intel_firmware_decode': [],
+	'intel_framebuffer_dump': [cairo],
+	'intel_gpu_time': [],
+	'intel_gtt': [pciaccess],
+	'intel_guc_logger': [cairo],
+	'intel_hdcp': [cairo],
+	'intel_infoframes': [],
+	'intel_lid': [],
+	'intel_opregion_decode': [],
+	'intel_panel_fitter': [],
+	'intel_perf_counters': [],
+	'intel_pm_rpm': [glib, cairo],
+	'intel_reg_checker': [],
+	'intel_residency': [cairo],
+	'intel_stepping': [pciaccess],
+	'intel_tiling_detect': [cairo],
+	'intel_vbt_decode': [],
+	'intel_watermark': [],
+	'intel_gem_info': [cairo],
+	'intel_gvtg_test': [cairo],
+	'dpcd_reg': [],
+	'lsgpu': [libudev, glib, cairo],
+}
 
-foreach prog : tools_progs
-	executable(prog, prog + '.c',
-		   dependencies : tool_deps,
-		   install_rpath : bindir_rpathdir,
-		   install : true)
+tool_deps = [lib_igt, libdrm]
+
+foreach prog, deps : tools_progs
+	exe_deps = tool_deps + deps
+	executable( prog, prog + '.c',
+		    dependencies: exe_deps,
+		    install_rpath: bindir_rpathdir,
+		    install: true
+	)
 endforeach
 
 if libudev.found()
@@ -65,7 +67,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('intel_dp_compliance', sources : intel_dp_compliance_src,
-		   dependencies : [tool_deps, libudev],
+		   dependencies : [tool_deps, libudev, glib, cairo],
 		   install_rpath : bindir_rpathdir,
 		   install : true)
 endif
@@ -77,13 +79,13 @@ executable('gputop', 'gputop.c',
 
 intel_l3_parity_src = [ 'intel_l3_parity.c', 'intel_l3_udev_listener.c' ]
 executable('intel_l3_parity', sources : intel_l3_parity_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, libudev],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
 intel_reg_src = [ 'intel_reg.c', 'intel_reg_decode.c', 'intel_reg_spec.c' ]
 executable('intel_reg', sources : intel_reg_src,
-	   dependencies : tool_deps,
+	   dependencies : [tool_deps, pciaccess, cairo],
 	   install : true,
 	   install_rpath : bindir_rpathdir,
 	   c_args : [
@@ -100,7 +102,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
 	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,math])
 
 executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
-	   dependencies : [tool_deps],
+	   dependencies : [tool_deps, cairo],
 	   install_rpath : bindir_rpathdir,
 	   install : true)
 
@@ -111,7 +113,7 @@ if libudev.found()
 		'igt_compliance_utils.c'
 	]
 	executable('msm_dp_compliance', sources : msm_dp_compliance_src,
-			dependencies : [tool_deps, libudev],
+			dependencies : [tool_deps, libudev, glib, cairo],
 			install_rpath : bindir_rpathdir,
 			install : true)
 endif
-- 
2.52.0

