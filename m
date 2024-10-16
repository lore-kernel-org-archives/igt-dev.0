Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C390AD2A523
	for <igt-dev@archiver.kernel.org>; Wed, 16 Oct 2024 14:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E3710E043;
	Wed, 16 Oct 2024 14:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AlOnrkLQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DAAB10E043
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2024 14:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729089914; x=1760625914;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=WD11BnP3AzG+CqIOwmz/jERr5p0oUEYYTyLAs/kXj94=;
 b=AlOnrkLQjdjlSiCV0lBQr37M4RQ7BkS9GrQpjRcFhPtLxLLKK3yl9Cbi
 5QsTMrzdsIJZoRxz2Ih3nRV9CTj/z9hc6wZLGk4c1wMJRurpRDxtp8Xjo
 9D6eSpVnnbSWHq0u3PzcjDkOsiBmxmZUuwKHGe6Bpo8ZkeluiEIbA4E/G
 s0ZvqhvghbIa19xIe6OW7gIotZm6PXI8UFd/HcRJtTGaUfmFTOVHL1Cox
 f3mkTrSaJJkTqATxxrlOO245+sk4WdAHuDOpJWxpTBgkryANMpg0r4hXq
 vIbYZzTJfRlLYe3aSuaTdN4ibIYdFOnyTOjEIM7vIKcVS0LDbR5y8zXjf w==;
X-CSE-ConnectionGUID: w6NfvYaITDqCONqOHMMOrQ==
X-CSE-MsgGUID: GP6TDtBcRKm3wZe2F17HRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51081260"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51081260"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 07:45:14 -0700
X-CSE-ConnectionGUID: 4QPurpEeS5+/TVu2WYrmzQ==
X-CSE-MsgGUID: qGTJbNJzTna8H9yqHX349w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="79077301"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 07:45:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 07:45:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 07:45:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 07:45:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 07:45:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 07:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUcU/2jqJDvxnzgyKF1IoGYMjOqQq0RtwuyAHbOrw4CwvIjpsMIxXCHmOESuXtJQe/0gjVqqL635L5Osye5cRSOOmQLSua/yGktY6CrDgVIOuP0NEoeVl/El2+uYhXhjMgFPytXsBPVvZTMScrDsSXUCOS5yS9ZG7he5MUbUSeb2W4lXuRgGZJaDJ9ST1Ttcfg3apBPQ/EMNwi86IrquizYu8pdmZkVx9aLKuf2xAHSpwsvBipu61H5ozdKQWIj4nVasJvuZ/D/zcSTthtwhbk2Gb4yWYSWdLch7eV6AnNCvk+T777e8iiNNN9OMiB4vHwABD1A7gnxi66ioq6qoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD11BnP3AzG+CqIOwmz/jERr5p0oUEYYTyLAs/kXj94=;
 b=Dr1/BCOSs/SrBz8UVpBrwFJDgMT7OQGkKI97DNVJyl7k4oyWiN0KEdIaQT4gzGSnqzOad9yFpgmVXIFV9NHxas40gZ9ZxQACAR5utcpRB4X6+h0GW6ESPw0XrsYWR1cGnh+Xi+hyINRzCPTJWiPmLVlQhbCWVbD/di5Xk8XVjIGCQ6fFvZa7OJ63K+dsx1MobLlmEs0LrreedireDa0Yay0A2tYRa5sPL8xEmSmeozpEs5rIquMgVr6vVX9lWCockLxtUR5DEUTKM9VipuH6YX1o7kkXM4p+owWGnSSusPlmkGrWbOXrCXg58Ahpi0TAN3233HRz4IXRVIgviPFiPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SA1PR11MB6918.namprd11.prod.outlook.com (2603:10b6:806:2bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 14:45:10 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 14:45:10 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] oa/i915: Add ARL standlone oa files
Thread-Topic: [PATCH i-g-t] oa/i915: Add ARL standlone oa files
Thread-Index: AQHbHy6xXbxl/bZEIUyjci2DVhZbvbKJZ1YAgAAOSIA=
Date: Wed, 16 Oct 2024 14:45:10 +0000
Message-ID: <914faa66c85c9cdff0cf40ec6303762f0bbae1e9.camel@intel.com>
References: <20241015181721.52086-1-jose.souza@intel.com>
 <85ed4g2lxj.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85ed4g2lxj.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|SA1PR11MB6918:EE_
x-ms-office365-filtering-correlation-id: 268fdb33-63ad-475d-666c-08dcedf122ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dURnMWR5ZG5vTXAzWVFmL09TTVhydHp1dUNzRWRkVWJNTDZHaFVhUjY3Zmhr?=
 =?utf-8?B?U3FKWWtYbnFabkZPM1hBdTJxMkpvLythbGRBaHdGb3gyTU5GelRLYit4ZUdH?=
 =?utf-8?B?cHJVVnlLUFpKN2NHdnh6Y1EyTEVSS09QV0ZOcEJKTWcxNkZnVXl3VXhRUFl0?=
 =?utf-8?B?Snl1Mm5Qc1FkdFZpVER3VERwL1VWdlpRSzVDSnZGSVZtWGMwWTNJTlE3Ulg3?=
 =?utf-8?B?RzVsSUlXWSt2U2M3QUhpMU1zbFdxVVBQYk5zdmdsc2I5Y3hZRTBsT2JvNGZy?=
 =?utf-8?B?d1B6YWdzYVVtK2dpT0paTVFJYUw1L0x6alk2RHZFNzl6MkYwdnJiTmVWeXVK?=
 =?utf-8?B?ZGhSTzIxdjhQeDBNNSt5amV2VkxTdlNXTEZTR1MxZjRPdmtPVWYrMEUzRHQ5?=
 =?utf-8?B?OGRNbVprOFFVNm9uMi81eTlDU2huNDBjTnhmcmVkY2o4U3czREtOQmtkNTFl?=
 =?utf-8?B?T3hBcWRmMnppK2tib2I1Q3Via1RWbUx1eEtDTXdBbjZBU3NJQjJKd1dTS0hE?=
 =?utf-8?B?bWVGOWpZMmJJNU9QbmxSclcrNDRHWnByS1dmK2taWWxkOVp6SXhGNzBZOUp3?=
 =?utf-8?B?Zi9zNGMzUnM4Rkxqdk1USE5YMHo5NWI3bHpZY293MU9VMDgwVlJ5RFZDWkF1?=
 =?utf-8?B?YkE5eHQreGhrTHYxTDAwQzAwL2psNUplNmx4WXlxcjFzc1F3ckdwdTIreFR0?=
 =?utf-8?B?OXp6N1gzK0NlR0U0RXY5bTcxclg5dVNpMkpBYmV4LzVIZWJlbFVra2d1L1ds?=
 =?utf-8?B?TS9rME96ZzZ0VWI3amU4MExGUHgzVVJLaytUTVVaRXFZOURTdWQveVlOZkRM?=
 =?utf-8?B?aEYydS93SzVnQWN0bStOMjdwdzZQMUZ6cFBCYVE0WmhaNVdSSTFGSkF3NWMz?=
 =?utf-8?B?NklYVWZjSHZuNURvUnVFaDhUdmkrNUY5NURuSEtjTWJNc0l2eW9IRGpVVzE4?=
 =?utf-8?B?dm1pNVkrQlVrSjRuMHQybzFiaFlRZjRxTWRGU1JGRC9SN0k3aUg2LzhhN3ZW?=
 =?utf-8?B?c0NMREJjdEplRzhKaWhHR3dLYXY5VnRON3RLZElTZnhaRlNOdUFjQUtyQ3dH?=
 =?utf-8?B?dEtQQXU2M3FmNEtOUmdFbVdpMVZJT0FYaDdCNEFwakcrWStmQWY2eWFQUVdR?=
 =?utf-8?B?NTlNT2E3dTFEaXpKd2p0Slc2S0h6Mis2RGM3NENlaFMyU2JWVk85d2pYQ3Ba?=
 =?utf-8?B?VFZ3ZGFmSE5iWm1saGJoaUVUTWl5cVltNXAyWElSRW1ZR3NkNFNNelN4ZlpB?=
 =?utf-8?B?QkNMa2g4RDRqL1pxaUpTWm45aWkzZnQ1RlF4a1EzU1o5TnZHOEJPQ1FGSnVW?=
 =?utf-8?B?WjFSelMzM0RhQnF6L1BZK1cwZUJ1ZVpSeWI3NE8wcnptdUxpWWJqVXg2dWJD?=
 =?utf-8?B?OC80V2JxTEpSMmlQSVRzTm1WeGFUOEVZUUZkSnRWYi9MR3NYZ0FNQklDT2dI?=
 =?utf-8?B?REZKaXpyTVF0Y0ZjZVJERUpXbnhOTzhvcDU2Nk16UzRSbExNWGhwQ3ZUZWow?=
 =?utf-8?B?VExBcXdXaFh4TEtXcURZcTJZTEROM0hReEM4UmhxcU14K1ExOHhvQlJtVVZB?=
 =?utf-8?B?TlFlMGRlNDFpdWhvZjJycXpnL2JsYnA2ck9KOTQxaTEzNzh0ck1tdXMyQTVa?=
 =?utf-8?B?ZnBTNnJsakp5eFdmSDNyOTVLNUcrdHVUQWFYSmQwRjNyVWFKRlJ2NDBLdUZR?=
 =?utf-8?B?VmprWDRDbE1mZkxMdmJzdGZsY2g4TTNTTm9jamg2V0ZEVThVeVhvZ0t3cVQ3?=
 =?utf-8?Q?UhXBOjb1xuPwjsaPGu8qFuMxSn1Sbpx34VhNZmB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGRDVjhhN2JRMm5mLzhybU1KN1NmTnhtemZFVVhsL3Fkb0I1bGw2U1ZRMWcx?=
 =?utf-8?B?WlpPdWRJMFh6WDNhSHE5ajY1S0xCem5kZWJ6NWRQbWVPUjBkeDFCMGZ3Z28y?=
 =?utf-8?B?TFlxN1lVVXpCSVFGeGc4SzBNMFUxK2txelVRZWNRK3hVc1FaSVFTdWxjNDZC?=
 =?utf-8?B?V1NMUmVqblNPRlYzNk1IZW1uMDgzaStlOHk0MzJkby9LR1FkcnBScVlsNldw?=
 =?utf-8?B?NjdEOHVTbERhK1dMZXgwckpZQUFpbzlzUUIwdjZVeXpkNWFSVkcweXUzSFlm?=
 =?utf-8?B?MDZrUE9rR0tvT2NCOTFVTFJCa3FtQnNCa3BPSVpINzJFS1l5NC9XeXQ2WTJU?=
 =?utf-8?B?dDNUSnIxUmNGaTU3ZUpVZmlqNWZENFZnOHJ1S0Vsayt4Y0l6NWx0QUZHTWhG?=
 =?utf-8?B?UkZVeGR6Wjl0NUZjVnlZRitzZkhmSHlsd1ZhbzRNTWU3Y1JvMXBlOEl2Y2Ev?=
 =?utf-8?B?dzl3WHNNK3B3TzNESXh5cEU3YWxqa2NWMS9HQzFkV1dhMEp3eEdoR3RDTVVY?=
 =?utf-8?B?ZHBHQ2JReHlUY3pDYzhtNzEzMzlldHBWU2ZxOHdra3FUdzNpTlVicGpEcDE2?=
 =?utf-8?B?RlM2TVlmKzFiVUpaVGZxVHMyajN1OStWWXdCaEZyNUpBT0JPQmJNVnV3bzha?=
 =?utf-8?B?QmtjNTE0WmEram9FSkxaUStMQXlsa2c5Q21qUnBWYW95TjZwZWd6YnE0TGVk?=
 =?utf-8?B?T29jUmVuaTB5TXhCZmpRb1EzMDRUeWpnVjYvSWhKWnhNc3dSNU1XdVNyQWxh?=
 =?utf-8?B?eEpYUlc5YVZBeTY5eXAxRFc3YVE5bHEwWEhvQ1RQZzBHaXJNR2s2V2hhbFBB?=
 =?utf-8?B?VTNDSjlMZ2xGbHY1NmpQYXFNOTBpZ2I0M2RiUG9FRjNyRlUwWGg4RUVnRVRO?=
 =?utf-8?B?ZTFxYXZiR1doRXlMczUzdWVZMk50dlFHUURoOFJBbXkwOHFqTUNseVZaRmVz?=
 =?utf-8?B?eVhDZVVsSTlCUENXd1g3cGU2TGJqeEtWNTg0RkRMUlZ4bFFoMzRXemFJUmgw?=
 =?utf-8?B?eWxyZmV1NmJmYjFQL0pENEtJU1pZNlNmZ0RXK3doTit4dENIMS9RSzlEMGV5?=
 =?utf-8?B?MU9nYnFkR0w4SHZuNC9ueFhsOTRMVVo5eERkVWhKY2dCYnQyaGZTVlYzTXJh?=
 =?utf-8?B?cEJHZWdlUndHeC9ZZEdsQ2FGZFpFelZJRUZXSmlyejE0NlkzL0VPNVQvZzla?=
 =?utf-8?B?UW14R1JIbm9FbW1uRFkzNHBMeDNoTk1LQ1pOcGUyQk5CWjFzd3MxWnlUQUpB?=
 =?utf-8?B?bllKZ0tsRXE2bzFhcVk5RnNLdXhoeXZHSFc2QWJtY0RDSEZleDkrTFVrRGlS?=
 =?utf-8?B?NWE4djdHeU5Pc0QyS05CR2RvbTgvN3RSMnYvdTJHUUYwcnhnUnQrSktjeDJy?=
 =?utf-8?B?OFdRKzdCNGt1b2I1TzIwekFSR2hNclBKRUhtdU5Mcks0azhkWkptRlpwdjJh?=
 =?utf-8?B?VFY4bFArdS9NOUIzc1huRGU2OWt0WWJDVk9QYlFiR21FSnRNNmdUaERuTGtN?=
 =?utf-8?B?QS9NcUR2QlNIekREMVNzb0Z4U1dPUDJzcFdHZnJLMENnSUplWU9aSFdhK3V5?=
 =?utf-8?B?Uzk4NVdBUzRzU0hKZEx3OE8ralhvK0FyV2JRTDNmTU1QZFNuUkZsajNKZjds?=
 =?utf-8?B?UGJpMGlCNnkyZ0Q3V2wvMzdUcytTM0hkTHFmazFocFp6VVA1RDlsZFFZY0tw?=
 =?utf-8?B?QStDRnM5MFpTMi81WVVCeDk4UC9rL0EybjBYbm93ZXhlNUVyQjAxdXFjYlZP?=
 =?utf-8?B?V3Zoc3M5MWdmVmx2Mi9vbG9Ra1BqZVVDRSswRXlXOG1uMWVTSXhpRWpwMmxY?=
 =?utf-8?B?VklhOTBxUFZjR0tTVUNXOCtwTjdtQnN6dERIYzlFMjRJTG9sQVBSa1p4VXlZ?=
 =?utf-8?B?Z0pCTXhOQlBicTA4b3ltR3hQaHB0c3VDLzhlQ1VCUWsvc3ZUeEZydGxRVW9S?=
 =?utf-8?B?NFY2TXVkenJwdzQxb3I4cEl6MC9RSjc2am1FN3ozRTRxcFVSZHhuSFdYYis4?=
 =?utf-8?B?bDJPaVBKb0R0QkxPNFVlZXNldGROSzJnOGZhdk56Um9ZWndlNmNPVHlzOWQ5?=
 =?utf-8?B?V0hmUjU4UDF0KzFVSHdTdnlsR1dQc1VRZTBaVTlxQXgrQlR0bkYyUlZoaFFq?=
 =?utf-8?Q?0CtIWkQClEG0GPQw5BAjQpoMV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F48FC332D9101942A148AEB21F4AFC15@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268fdb33-63ad-475d-666c-08dcedf122ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2024 14:45:10.5207 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wbnZnnhOgRWyXtGgbKRetS99D+HjTatigYtR2EJfUCiFtP2Ai9HlYq7wSl4FzjzOcYpfP1WioTabzLytbgHDvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6918
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

T24gV2VkLCAyMDI0LTEwLTE2IGF0IDA2OjU0IC0wNzAwLCBEaXhpdCwgQXNodXRvc2ggd3JvdGU6
DQo+IE9uIFR1ZSwgMTUgT2N0IDIwMjQgMTE6MTc6MjEgLTA3MDAsIEpvc8OpIFJvYmVydG8gZGUg
U291emEgd3JvdGU6DQo+ID4gDQo+ID4gDQo+IA0KPiBUaGUgcGF0Y2ggaXMgbGFyZ2Ugc28gc2Vl
bXMgSSBjYW4gb25seSBzZWUgaXQgaW4gT3V0bG9vayBvciBkb3dubG9hZCBpdCwNCj4gYnV0IG90
aGVyd2lzZSBMR1RNOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFzaHV0b3NoIERpeGl0IDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+DQo+IA0KPiBBbHNvIENjJ2luZyBVbWVzaC4NCg0KR290IGEgQVJM
IHRvZGF5IGFuZCB0aGlzIG5ldyBmaWxlcyBkb24ndCB3b3JrLCBLTUQgZ2l2ZXMgc29tZSBlcnJv
cnMgYWJvdXQgZm9ybWF0cyBub3Qgc3VwcG9ydGVkLi4uDQpNZXNhIHdvcmtlZCBmaW5lIHdpdGgg
TVRMIG9uZXMsIHNvIGxldHMga2VlcCBNVEwgb25lcyB1bnRpbCByZWFsbHkgbmVlZGVkIHRvIHN3
aXRjaCB0byBBUkwgb25lcy4NCg==
