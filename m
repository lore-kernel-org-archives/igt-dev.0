Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AD1CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 06:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8EA10E0B5;
	Mon, 29 Sep 2025 06:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XyLg4r6S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3857110E0B5
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 06:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759125773; x=1790661773;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T98DtxNsxzLnuwxWFIxeppvw33J4GUTVARHg44LT73g=;
 b=XyLg4r6SCXnKPOITWEsTcMZoB38EP6ukmqC+Dap6HhEIZ56p4dB8QIli
 ozZ/z434jn659UHhpe7ZdNWFotPVVneSBdupFm42JlA3Z6aFMVzuPXg+y
 0GILfJKsBJvtrmNKHAYDfB3BNPR43OgwROBhEe9Yh58P0XoGM22kZExjC
 th6+twwgjK9fy8CAHuZ8kO7imPE+G8jWc0FkiF0sUQpd7cLQCwy3/LrJM
 d2lwY7FJMy7Bz3JzXzO0F84h1Bkpk4BzWsGFJjVI+mf+aSrBtqUSag7aW
 B/reks/mQkG2z8473UO2PZ0c7LUlVC5/JO+BKG9i3F/hjhnOc+9Ot3jkL g==;
X-CSE-ConnectionGUID: 6PspHre9TNe16ZQ2Em2s+A==
X-CSE-MsgGUID: J8r5q/NMR/S86X6b7Gri1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61272201"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61272201"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 23:02:52 -0700
X-CSE-ConnectionGUID: oePdjfViRtuJxOgg10/toA==
X-CSE-MsgGUID: k6Dfp6RDQ4q2M7C1D7lo+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="177403393"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2025 23:02:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 23:02:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 28 Sep 2025 23:02:50 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 28 Sep 2025 23:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0cqTa1tUygmg5iqGeebIqvaehfWrC1QbSJJtgcfd0dR0tgv3uEU+Az4KtTxpMLFfquT4/9f0VJcWUDYFhsfe0YARwZQlVFgaLCz71yqDviolAntTyKXtOaybokZpLRK7b4pPnScDmdwykkuqykSyg2e5XzBGM1gPX+DgMEgMdXA0pHemQDR2HR2TRgebAcbD6LOryKohP9rqr4AXDMe9Z21kn5Krc+LAsJ/Hb1jqOBMvKWYbqZWIBuy3wJIg3PAwTm77qyMI6+s6215k732anXMpdhNKh/P9U4oHPBpg2d0czxVYCCfH773Ox+eHWlBKhF0wPA08JKkCVR+A5JIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hljbUwOwEirgwCTaNWBZ9cHuEoykhCjRJc7nCIvv7zI=;
 b=AC8hzWQhccGl2Vyeq8Y5pNYhcQTINJqN9htBB/wxyl1O465y50LQ5bo0qyEH1kgETbFcAVhnUKdXMMpsWq7pfIU+481UeTi0lM0q+Ycs2fZOrEp9sM4hHf+Hi4NnFMLT9iX6m7UPr9k9gXI8y1grZJjYADAhwwB8bYepWQ5pZydK70zdugXkhlWry5TzcYJpITs6f+CebuGmEyBeEaAQ7ZM2CKHDOA/cMXRurhlPjovRK8VwwfOkH9clcU9JRjCucNGZBWeC8sBcqPh7abSGfxeWUzrJe8bykWFUbxJj1vc4cOq83QQ/9P7AOaWydihPi+I2O26YlvHC8sWGcvV7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB8249.namprd11.prod.outlook.com (2603:10b6:510:1a7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 06:02:48 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:02:48 +0000
Date: Mon, 29 Sep 2025 06:02:38 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
Message-ID: <u2nn4b6gan75s6d2uz4g6eofo5ds7ii63kgb5imyisnpnzjavy@axrzrv7elxwi>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA0P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::28) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 186889b7-d41f-47d4-47c8-08ddff1dd0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2NvUHhPYUJ6cmY4bjdVYjdjdkV1OFpIM0xrMSs5bTNSQnY3TSt4eFZQWEFU?=
 =?utf-8?B?NWxqUUpnK2VaOEx4SFlXWHMrNHg1QmpabEw1YnZVdFpPNDlrSWRHT1BVelNs?=
 =?utf-8?B?MGR3OXUvalorZERFZkZweEh1UXk5NGJNeUVpRGZMUlNFM2tGYmxOSzZQVTRa?=
 =?utf-8?B?VGdoR0s3blJVUjIzbUJJUDZoTTBPSjNwYVFKa3k1aEVMdnhDaDd1QmlBYS9q?=
 =?utf-8?B?ZXFQcm5Qa0ZRaFRMUDhGZEVGdVYzTjl1VzdscVZva3dwQkJIU29HTDB1cW9n?=
 =?utf-8?B?WWhFRDJLcytqcXZXMXJjL2NudGNBbVhCYWhQbXg1eElXVUlLNkhCK3I4YzVL?=
 =?utf-8?B?UXMyZEE0VC83RkVjZzdCeGpVMFBvUGQ0S1pyaDVGUlFXd09NZzRzMlFIWnla?=
 =?utf-8?B?SzlNTkNFb3N1Ry9iL2FVNXdrR0EwNEVQaUdKb3hFUDFtSURlWjZOdUZCeGxQ?=
 =?utf-8?B?WjIvc1pSL3RkZ3FGM085RFZaTGVsWm8vNUprMjlpd1oxc2c2WklkZEhMazUw?=
 =?utf-8?B?c1NlOFl6R0toNDNTWmVETi8vSUhiYTVDbitjVGV1YnR4bHNhYkFiL28rb3hj?=
 =?utf-8?B?R0xBRndiOGlzZmhSMTl2ckhkcnlLQWpHdmJkNEY5NkxpRFhvcEhiTytTU1Q0?=
 =?utf-8?B?ZnZJWVFLYWdpZUpIaGhZRjBXL0k3MUpwWFJUOE1GUmM0cGNXTFhqQm51cUNS?=
 =?utf-8?B?ZlkydXZJMGRQMDdlSCtLSVpjdm1SQ0xFclN4V0cveCtabDFSbkZsb1Nta2lV?=
 =?utf-8?B?alJQUnJkTGFiNnBUNmZDYjlDVkRpMEJKNjdmcXB5K2wxMjBIUzRYS3NwbnU3?=
 =?utf-8?B?K2VwN1lsdGpqMC91eDJqSXdhNEZRUnIwWHJxQmt2ZHVZemFZQlFKU2E3UkNZ?=
 =?utf-8?B?RDFrY1hUMEpiR09lRkQvWnFYNUFJWHhhK2FRR2xOLzNlTmQwMjRjcGFCeG1j?=
 =?utf-8?B?QlRmcVZqRWU5ek5uMjQ5SWVwRzY3d0pvTlBOVFRBaGhlUEg1a3JVcnZwTHdw?=
 =?utf-8?B?RjIxNGkxTUhqWldVTCtsUTI4NlpwTGlJYndKSVhiNXpZaEEwTURqaHRDQnhL?=
 =?utf-8?B?dEFLblZSSlJjVi94dGc5elhlOXZ6WVJGbHlFQWRNakpHZXk2eXNITUVsbGJD?=
 =?utf-8?B?RXIrQUpBNzJpMjVwQytaVkh1SUFjZjY2N2R1blJPTXNUMWsxOWVubVFqdy9j?=
 =?utf-8?B?dDdyQ2l0L3U1bEtXekd2RStMSzEzcldYUWh6SHhrK1A3VWdGTkkweVprNmRF?=
 =?utf-8?B?SmR3YllDa2FBMGphSHZqZGNpRkQvOVhGTzZIOThBZTdFZW4rWHNxelUxN1FV?=
 =?utf-8?B?bHlmWEFvUmFkNk40WWN5K3YxMnZ6T09wS05SdmdDejhqTHRVR1NGcWcyWG44?=
 =?utf-8?B?TmdLT2h4SmJzTTJCUnpoMUJGTVZndDNmNGNUa21UWEFQZmJmQndZV2FXVytr?=
 =?utf-8?B?TzNlaEhmRVZBMWJ0TkJpZFR4WW8xYnEyL2orOVZycW9XMDA5ZC9YK2NmTkFW?=
 =?utf-8?B?aWVNbmVRbXlHOTEzbG9FRDROaVFHZ2JUdWZ0NU5ZS0Q3VnI1MlJGbEpYL2ph?=
 =?utf-8?B?NzM1MFVPM2psL1RWZTlJSTlTN1IybFhhVHF2QWtSbVViRjQ4NytZSmxEeWVE?=
 =?utf-8?B?Tmh0eUVHQ2Z4MUN3cGFDcWNnYVhIckVZWmcvalNtNHFNdDNDM1pBRjg2eWs4?=
 =?utf-8?B?azZ1OGxXNnFoV3V3VzVSbEU0dWhORzg0NU41MStSaGo1SGVWVHFmSmZhays2?=
 =?utf-8?B?eXZlWGRPWGttR2JCUlBJb2crNVlaSWlaR1ZGdVAwdXhRYkJXR1JWS1hBZ2dU?=
 =?utf-8?B?Q1BKUS9OcEJjd0RBalhlRmtsODd0ZFpaSjVNajcwY1RxY204T0w1dE5HMUph?=
 =?utf-8?B?dEJDbERzcXJJWnRSMzFON1E2d1RnYS9PcVFIckluek1pRWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUlhQTZibkdvUTduZUxIT3NzUUJ5UXMybWp2dG1pVCtKanZzOWFyM3B3M3Rx?=
 =?utf-8?B?VWFCSUdKZWJVanpjWUl6dGZsdG1QdGZVNVJIUlM0dFRZNmpMb1lGZTFUcGZC?=
 =?utf-8?B?NWFiYVF2UCtwYXlTN2U0S0pCaDAxNHpINkRISHFLSlBHeXE2TXd4dnFTS0dT?=
 =?utf-8?B?ODkvUGlJR1NMYjhFOUg2MWlVMGRxb1ZuTlRlaUF5SmdSN0FidjM3QVNIbmhN?=
 =?utf-8?B?VDJTenNRMWgvK05aNHNsY0VjQ29NUGVDVUpmYXIyT3FSU2tHLzcrZ2EydWRO?=
 =?utf-8?B?YWc3eXV0YXE5Z0l4UXl0L2FNZTlvbk0zRStpd0tKck5laklEcmROMkpWSEZG?=
 =?utf-8?B?MHpoTEVkWkZHUExTRU1sd2JLZ3pZcGdUNHZvQXFtSlQ3Y2Ruc0hndy80SHk3?=
 =?utf-8?B?bWFrc3dIQSt4UHZKYldaYkZ4NE1hdFpCa0NwdzNkaS9Za09lL0dyTG1vaXVz?=
 =?utf-8?B?NnorS0VvVDVHS1owc2krbnViSm1CSDVQMjdxMTNra0J0eTN2Z1YrT2EzT1h1?=
 =?utf-8?B?Mk4rZDg4NjZzdlBnT2U3TmhtT051R3dyTnc2NTMxS08xZU1COXk5SW90R3NL?=
 =?utf-8?B?d3AwMXdHd0lsWWdzbG1NckJINjR0N0tmeDhKaUNMbDcyR2JkWjh4dXNWKzNF?=
 =?utf-8?B?NGFkK0h4WWVsUUVGZmsxc0Jhd3pVQysvZWNTVHRmczV0SGljOHFjUlNMMTFq?=
 =?utf-8?B?U21KNjZLQktXWXUyL09ZbTRMY2VKS3FWd3FyVTlWQU95dGowSFVuS2JvMjNl?=
 =?utf-8?B?MjM3QmZ5djlIa3cxVjN0UDdSTCtxMkVxM2RQUm9uOStQeDVuaGRYYTZVMWx3?=
 =?utf-8?B?THRFTW8wNmJhSmE1QXFrUEh4cFk3UGR3UHZDeEtoYUdJOXRLdWlqNlY1dXlT?=
 =?utf-8?B?OGlDWnlTVG50OHhSZG9xdlYxejY1ZDYvSjI0RjBMNXp3QjB3WHMzTFNzcFNV?=
 =?utf-8?B?NnFXNzBtKzBiTXpsVjZKd0dlb0ZxZTE3RHZPSmI1MjVhM0hBYnZNbmh6eWdy?=
 =?utf-8?B?SGJ1VkN5dCtJUGRBUmV1NlMwU3cxVlpsUmM4Mm85NjJ5eUJsUjVZdmt5VmU4?=
 =?utf-8?B?dzR0MUtVNFY3eGgwQzYxY1ZQRXJMVjlwbmdGMWR3VDVreGZoWkpSUnVxUE41?=
 =?utf-8?B?ZlZUQW1LSlZqdytia2k5dmRmRTd1Q0pQeGtpSC9TeXJHSTZrME1WcjN1OStX?=
 =?utf-8?B?U2Z4WUdqOVoxc3k5RFZLK3lXbEVEbEhpMXBxdEVma0wzZEs1WjFrY1NvUzNK?=
 =?utf-8?B?TjNyeE1meVZRa2VUNUFZMDF3Z2pkNDNGZUJZandGMmw1dW1YdXhPL0ZUL0Nm?=
 =?utf-8?B?STFCRk9wYVIvY0V6emN1TzdHTmdLT1ljTkxIcEc1TkdqRUR1enFSUW9ocWl5?=
 =?utf-8?B?Q0RQTU5pN3o4OWVqZGd6SUFSaEJxVk1odDNYWEllSTdHOUgyYitZeWhDeXls?=
 =?utf-8?B?K3owYmVKSTJZZ21lWWJYS21CWkRyL3pCeno5UWlHaGxPb0RCOTY2a2l2dGRO?=
 =?utf-8?B?VS84Mzgvdmc2NWNrMWNXbUYydStLbHROdnF5a2ZYRTYwTzVxZk03Q01YM21p?=
 =?utf-8?B?bGh6L3lxTFcxdGp2c0h0OFZSTTNzYzZjeFhmMncxQUVCakg5UTg4aFVOK1hL?=
 =?utf-8?B?MGRiQjMwVDhSeUwzcXBhdzhDakZTeW1YTkwvS0pwU3dmRWRQZDBMRy9FZnU4?=
 =?utf-8?B?VFVxamtwc3hWQVVwNVVneDdCOUNCQmpxN3JIWmF4VWozSHJOQ0ZSaGNqV0NL?=
 =?utf-8?B?UnlYNjR0dVVyVW1Bbm1HWEpsU1MraWRFRERGOEdJTDM2UktSS29UeFJLNitu?=
 =?utf-8?B?U2hVN01QQVhsdzR0V2NlSk03TVRzd3pEaGsyZm5HUkRiS0pOL0czRUJyVU9m?=
 =?utf-8?B?TWE1ZnNmTzBaU1RlczV4czNrTi8zZmJ1UVZzVHdocUMwQzFIZFQyVGhjVXFD?=
 =?utf-8?B?N2tPNlFFTXRMMTVvZWNaSXorS2ltdkJoY05xVDZ1ZTFZVjlDbjZWdk12dEp6?=
 =?utf-8?B?YUdPOGZYdngyb2tqdlo2aHl2Sk9KT1dqMmdlRy8xMWc3ajZXemc5OU96QlJ0?=
 =?utf-8?B?bUNvbjBhTW14UHlWRkZoMWdLcWVGSGlrSThaUVdkK3p0OExMMEtETHJmUXUv?=
 =?utf-8?B?QzJrNWVlcGxaZS9VWWhxSTh1ZCtPN3BoaGR1clcxdHFPOGt4WFRHUEw3eGlQ?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 186889b7-d41f-47d4-47c8-08ddff1dd0d5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 06:02:48.0534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8CzX4pX7hLUDGS0f246cTGWE1f2eI1hX+mmtllp6Pp+3JqBb23IEfMISSRQXsLohl3wxQY3pFuau8gI08/dQuqViXME7VY2IR8l5toMfac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8249
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

Hi Krzysztof,

> Move the interrupt timer from the parent thread to the child thread as
> an explicit signal raise, and make sure the order of execution between
> them is always the same. This reduces nondeterminism in the test, fixing
> bugs like [1], where the child is starved out of CPU time up until the
> parent gets signalled and monopolizes the CPU before the child could
> submit its own execbuf, failing the test.
> 
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
> 
> v2: make the sync variable actually work (Zbigniew)
> 
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

I like how you dealt with timing issues using an explicit flag
- it is more readable in my opinion.

-- 
Best Regards,
Krzysztof
