Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CB7CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 07:46:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C1010E72C;
	Wed, 29 Oct 2025 07:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKt/q5by";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051DD10E724
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 07:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761723997; x=1793259997;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eOY8N1ozhzbtGMdKu1iBas5Ma028IYL3BtOXxJ0L0iA=;
 b=PKt/q5byciGanBvPCWlly6UiTtVBQmieoSarmXTx5dG6Gg99muDdCH/9
 KwDv1Ykjg+c4rPKVo5NyjEpJdPDWOfYExna8SGuUNjdkv4CfVCHMxmaic
 KrTrUO4M4iCQy6jIf9DsjK+th5oD+MFdqB9NM2RkWI/IzJ8XrBlQIZDPu
 eNQPPErqTsHzVRS9QRrsC/wavbaW/Gpx382dPHCork7a9Mh4Vz/59JEZX
 0kb3SbZAk/2GkbGU/3tGrbPkk6RgSgY8Sl2xJ18mbTdUHuh0ZpNlYOHJ+
 i81jaihpU312Oe/pURq3xiged76phbw62ssAv01XBTSZSkGZ0h6Ua4me+ w==;
X-CSE-ConnectionGUID: vrHRicWbTEqHaw/UGCrnWg==
X-CSE-MsgGUID: 8hQnx1mHSPC3oqOGH3vo0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75181037"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="75181037"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:46:37 -0700
X-CSE-ConnectionGUID: MkF7JDDuRrunHENtBdyMaw==
X-CSE-MsgGUID: BaMbdmpERDOwL4B6HULtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="190764759"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:46:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:46:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 00:46:37 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:46:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFIRGq434iqPh0re0r5UiGFUKPkSHwUKu6CjZehcuR0RlD8F5t9+0qLq1V3WoEIvMWFWTbe3S2x0k2AxOKq/FriMbxzWYWM459eiBzoHPPeGIQOwojwzKw2lmLJc7yks83JrGqhWeA3BGzw/vcCh6xbOKTmN+wsVPnI/q3Sr062SVfORiUL1xhRd1IFoj2ZVtYpSxBJ9yeDh7gVs1up/S5sHiu4p8HHpvwayi1rbHv2XctdhWt3KHeqhBwUNbCOuDOKxsm8nYmQHvGH6tPvQkGtnAW20K/F0uDxQCZA9fEUF8xx6xWAuHpRpeXDcUe6zDPTJ9KWkqcaaRn3hUS/vNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/juVLWtTWbcDIIJLo1tZtJhIs5n2/V34USTwdu205Y=;
 b=KVBGy4kessE0wkTevrVsotbHGxex+b53bV4w4HbZlu2ooHEGQUo2yA8Vy3hwpHQy04IAYyERF1aWiMila98rPu5xXx2abNAr6u9njpPbVDalKuSakb6KKh8P3VTGXssPMRuN1ZJ/hAHWZZvUGDUBtgqMHuL6nbR3AyCsRFhgJ1s7LAQxjbhImbbMxhaLmgPHo1rUvMQ6+UNQGkJt6cKJoOiLf1YJC9uNwqEKJtfxuZHCmBAnonxr/NAyyyl1CFTnRFV1Qb+9oq80mTJoA1l7Lh4kH2Jly5Jm4NVDsV1RjVyfASzhkK4HuVPNxV7SAjqKleCulnVqnK2Dl6UxO5wR4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL3PR11MB6340.namprd11.prod.outlook.com (2603:10b6:208:3b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 07:46:35 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 07:46:34 +0000
Date: Wed, 29 Oct 2025 07:46:24 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>,
 <zbigniew.kempczynski@intel.com>, <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Message-ID: <gkajd5vcaterajo4c56nszm2qgf74rwkv2ukarzgexytwxzvhk@i4ja3ydlwxil>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251029053141.3619261-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029053141.3619261-1-s.sebinraj@intel.com>
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL3PR11MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: a77e9a53-9a6f-440a-7040-08de16bf4897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGlOVytjdXYvUjdGcHoraHNveDgvRDUwRVNZaU90YStJKzFWMXdTVk5IeHpr?=
 =?utf-8?B?WkZiYktEcllHdnRpYURlV0R5SHduUy85YTlSSm5RMllZamhtbmhuYlBEWk9K?=
 =?utf-8?B?cFB2Z3g2bDlhdnNPSnN3V3FlckYxdUIvR0p6djVEVXRadStWOVNycGlzRlkw?=
 =?utf-8?B?SkJFWnUrK1Q3aDdxS0RKc3BsYUhVMDNKTUdKVzc3QlcxZGpvRFJSdTZLRURZ?=
 =?utf-8?B?TExRWGVTbkdHNFV2T1BXOFVGdy9uTC94blFRVUlTbVRkaytsZ1lGd0RtMXRy?=
 =?utf-8?B?MDVGRUUrZmNlaHljSnBjZnh1NFZnVkxRWXZhZWRvdGpEOW9DTWNpcDZic2p2?=
 =?utf-8?B?Vm94MzU1ZXB6cjRCY3dLZ0JUUzUwYVNNWW9XbUZnb2UwUldIV1h1RmszNGwz?=
 =?utf-8?B?blU0RVBWRW5jZU1pZmoweHVxemdBRStVRkJEL0M5RnlZeG8yQkM5SUNQR1Ir?=
 =?utf-8?B?MldWbG9sNkJ5a0hSZVNKdXYwUCtPUjB4QWt0S0VYNzFCaFRTcEJBU1hYSVBl?=
 =?utf-8?B?ZDdQN2xCSDJ2ODlvOEl1L3ZDWUV6V0I5TUE4RTlqSUxxMnFEcjd5TC9aUlRW?=
 =?utf-8?B?MEd0MlZuMlpMZ3I5OTBrcGRBSzYxUEFrVFN0aW5EcWFnemFhL3h4YkdqNkdN?=
 =?utf-8?B?WE5xYlJuek5TOVNCUDU5OG1aR2xEeWpkd0R3ZmQ1bXRYZm90RXRtUUJFaHhi?=
 =?utf-8?B?SFNrekNhVkVqYnJWUlVEcVJMUForZU5PNkF3TktPWnNpR1hybit4czNLaVhs?=
 =?utf-8?B?RndCTzg3TFowRzlEcUlkM3B4c1BnOXhXYVVuRXE1NGlrQjVEUlNPZHdUY3FI?=
 =?utf-8?B?Tll1ZVdqTEduNXIrTnRCTCtySjdKR01RcXFVQ1ZvQXFNMTQrdE5CWTlJZ2tz?=
 =?utf-8?B?cjI4YmdtaXpUT3NKdlVPY3RGbmxUSkU4RWg2eGFXdkVLKzQzdmVSQkp2UE14?=
 =?utf-8?B?STdCWlhUa0xNbUJnWmRkVmJtNlA4SFBVSGd1WDVKMjFTWWQ1NGxhdkljSll3?=
 =?utf-8?B?aU1pNHU0R0Q4WlhtM3hpSEIxSzlMTlMwaEY1L0Jhem0xUU5UUzlZM0xnWmtu?=
 =?utf-8?B?dW5HaHhrZnNOdDNLNjFUbzcvb0ZpZjV2d3drUkJOc2ZvVGJybkVtd0pNNkFx?=
 =?utf-8?B?dERBcWU5d3NkNHhWRkxYUjg4dFJNVU9MVFhsVGwzNE44ZnplSWZNVWFXV09K?=
 =?utf-8?B?YjNDc0tKdEc2NXgxV0wvNk56Wksrem11cG1jUEdIOGpwLzVLTm5YMnY0R2VG?=
 =?utf-8?B?U0VZaUhxWFFKdmt5bldBK2xiWTlMOEpTK0NPaTNYeTF3VmcwQ25jV1hKSnNh?=
 =?utf-8?B?T0I4NjhURmFYYlRTUHRXOW1KeHIveUwvTnNFZ05XS3czbGlzb3l3UjNTMUNo?=
 =?utf-8?B?RW9LNXhIVjVxQVo4NitmTHVXSk9vbW9KdUVYUXJDYTB0a3RvbTdsdGZzU0Zp?=
 =?utf-8?B?cWJRTVQrVXREcklLTUI0ZHp0TmVDMkVpajZCYTFDMnlkTWNnSXg0eFM0VXM2?=
 =?utf-8?B?dTlhWmJDYUUxWGJ6OFhDWDdqdndZWStyRVhzdFBHNlZlOVpWYkxRTjdBN3Rp?=
 =?utf-8?B?eXRGMlkxR2hwTGRuQ3dXaCtrS29La2w2ZDhwQjBkYXpxZnJ5ZVIwZG9VZER6?=
 =?utf-8?B?M3UzYkIzZURTUFVNbU9nM3RRSEVhUURwTEtIaTYvVGxPcGd6M21aL1YwUDRU?=
 =?utf-8?B?UU1vQVNKM1Z6RHhvemgwWGx0Nm1ISjJHYjJRaGdiZjdZQlFKWGxwczB5TmJk?=
 =?utf-8?B?MmwyMDVCR0tSMmc3VjFFVW4vVVlzLzcwNW1pUCtFY2s2Y3VJZ1VaRjdmbUFv?=
 =?utf-8?B?WGtNZWZrU1JUeFRYcHNCd1oyYlRrdzBzWmdLTHJmVE8xbVkvMGQwK053NW5n?=
 =?utf-8?B?U1FKcmtIbDhDekdpVnRoNUp0V2MrbE8vR1pPODZYL2Y0TG0xaDFwTk53Qmsz?=
 =?utf-8?Q?f/7nt8VJq/Y+Q0I6v8ZEHoo5+Rqs4XgI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFVrcmo5TVNZdy9QaW8xZjNhcHRUNklRWXF4RmdEcU1KZ1RaVHB3MGJaN25N?=
 =?utf-8?B?eDV6UFB5YnQxb21ZdFBpTGdEaTN4NXlVMDF4eitFZ1FpaUZvRGpQcUtsVSs4?=
 =?utf-8?B?OU1SaHcyVHgzcmtxUHI0KzBRTjFIcVZvcGxxSDRBOCtZSGdEQTh3NmtDdml6?=
 =?utf-8?B?aGFRdU01RUdYTXV6SlhRS0d5T1c2UXArM0lGY1JBS1hQZzlLRVdRSzlSV0lR?=
 =?utf-8?B?Mk5NTFlRTmJSTzNqeGgzMWxEbWdGcGlNbjU4WDNETDc0MkFsQ25kbElMRXh0?=
 =?utf-8?B?cHkxemtNcng2ZXlKZ1Y2OENhK2RyMzFWNHVYaE02OHBNMXBaVzV6QXZyT1NU?=
 =?utf-8?B?L0wxYmEvUlBGZGJGUmFzTTNoVS8wZ3A0Z2dJVXM1b3R1bVk2dlJmQW9VTjB0?=
 =?utf-8?B?Q1Z4VGhZd29xVVhKekxVUDNXckE0anJUaHFhNVZvYjBoY01wSzl4WHhrcEox?=
 =?utf-8?B?aHdveTQ2VUEvNVlmZ1EyNURRcytUQ1k5dEg1OFZmdE94M0lWUXE5UWovd2s1?=
 =?utf-8?B?cU5ZS2l1S3hDRXFXZ2pBL2I2OHlBQm1xcW1KaWFML3U4RW1KL1M4TTJGZVNw?=
 =?utf-8?B?T0haK09OdlBFVFF0TkhvajJBOXppUlZHSUxkR292SUlVaUtxMVVaVEFzZkJS?=
 =?utf-8?B?TEJLMTVpRUFNZXZiMjZNeXh6MFNZdmh4NlJGSnpGN3VpbTlTMEZwSmFlVUNQ?=
 =?utf-8?B?cEtIbDBaUnRoeVljVWZhdHExSGdMeWxGekdxT3FsM25QMXVMaUowQzJ6VUNP?=
 =?utf-8?B?eFBXVE9QQTBiNStoMmtNczIyOG51Q2VnNktTOWhLZ3owNmxLaURYSW1JSEh1?=
 =?utf-8?B?VDQyV3hzQWQvU3JGb0N5UW91WDV0bng3cUZCdEJ6Nk04cTUwbVJUNDkwMU15?=
 =?utf-8?B?MzlzaGtCQ0RqZ0RyOTZudWZtTzUyMjl1NXROZkdzTTk5eWV3S1FWdmNCTnVB?=
 =?utf-8?B?eHFCanVhOGhzTWNqWTlKZi9jMWU5K25WbFI4ckcyaHRTN1FTaXZBSVNQUHEx?=
 =?utf-8?B?MDdReHhwcmFkcjNBcVZYSWNXbHRwZnkzaGl1cGdwSGlIMGpnUmEzTytKaUVh?=
 =?utf-8?B?RTJILzBLVG9ZWHlCYTNtcWJTQUZheWVJck5GN1FEUE1SMnRNczhZQ1UyVjN5?=
 =?utf-8?B?M1RQb25uZHVWMkdORHRvc0cvc3hqbHFsTWZQcnFhVGlTTUJaUy9wbHFVT2hi?=
 =?utf-8?B?alZWZnFkdjcwZ1NiMTBxUGpkbE96NVNqTklLV1p0aEZ0THZDT0x2M2w1cHJs?=
 =?utf-8?B?eFRRd3pKN2RsSXRQR3lIYWN2SjRJYjlWZFFnRXNMOWc0VGZuaDJ2TkxTNXU5?=
 =?utf-8?B?ZUlZQjB6R2NPcHEvb0piUHhuNzI4K20wRzVVZ1ZPWTcyMTRXQlc0VU5MZnhp?=
 =?utf-8?B?dUdsQThaa0tqMVY3Y2h5R2hjQldBSUFlTVdlU0Y3TUFwektPMTZTUzViQXI5?=
 =?utf-8?B?Tk5FTTQreVhpMDdQU0FZQnZxK2NveUFVNzM5NDBUQWFwWjNtYndDZnFqVXZI?=
 =?utf-8?B?eDdTbi9wZEJDVTh5SHdNdmk2TEthakRTamdIODVNRW9rY1N5cnJoQTNpQU0w?=
 =?utf-8?B?T28vSkJWNVFHS3FySmpkeHZIb0ZCU3hjRVV2VmJtbXFvdUJRbDZOd2d0aURz?=
 =?utf-8?B?cTQ4MDM4clNveCtkUlpDcytsbEVPa0J2OHU0bnRyczRLcTZXeEpaK05wVEdI?=
 =?utf-8?B?VklFMGtXT3RqRTQvQ2oraEp2cUVFZm5BQVpKZU1Cek9mL3JIWHFFRC8wYjFR?=
 =?utf-8?B?YW1zZFNEMkZtbFFXV2xHdHFNaUdHTkxaai9mR3ltcHU5WnZQNDliWkxaUFFX?=
 =?utf-8?B?MUFWL2lRb1YvbXF6bHBqU1lOZVRCN2dlV3ZLVkRlQXN2SFpDdEtkeTJQUVZl?=
 =?utf-8?B?MXgrZnpEUmdBbzd4ZXNIUGxPb0IvOWxOU3g0aHVIVFpEazJEd1FHSTNiQWVy?=
 =?utf-8?B?Wi9LRkNnYVl6c3FJejNTenh0VTNVL1pOZmFQNTFjbCtiVUU5b01MT043RVpD?=
 =?utf-8?B?Q3NGMDQ4OWVTZjNRQ0h2K2QvbmpHclJEa3dWMFpnNHlzUnM0bktmcW81SE1j?=
 =?utf-8?B?Z093NFJVYmwrRUVDd1I2Zmdzclg5N0FSQTZxcWFOWVRqaVlWVTB3TFR2czZ3?=
 =?utf-8?B?RldVMU02bHEzcU1BVG82ekZRT2YwRzV1OS9FVlRrOTBGU2Eyb0EyUTZ6ZFZO?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a77e9a53-9a6f-440a-7040-08de16bf4897
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 07:46:34.7678 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfhmqN5r7NobHfV8eleRR0Z9ftK6vaPvHtJSWT/XHfPPehSCThmDlIrDZy+UhuTxHIBdVfbdnyWreGRmSYC0bM7xxVICCKbb9VFqGqH7gPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6340
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

Hi S Sebinraj,
It is usually good to wait a bit after getting review comments,
so people may discuss or respond to how you interpret their
suggestions. Since you sent v2 already, I'll continue here,
because I feel like some clarification is needed to my comments
to v1:

│> +             fp = fopen(freq_path, "r");
│> +             if (fp) {
│> +                     if (fgets(freq_buf, sizeof(freq_buf), fp))
│> +                             cur_freq = atoi(freq_buf);
│> +                     fclose(fp);
│> +             } else {
│> +                     fprintf(stderr, "Failed to open %s\n", freq_path);
│> I think failures could skip this iteration of the loop,
   unless you are adamant on writing empty strings.
│> You could also write ERR or N/A to the cur_freq/act_freq as
   direct notification to the user that something went wrong.

I wanted to convey that these "else" blocks are an error path,
which, if ever executed, would mean we'd be printing incomplete
information about frequency. I thought that instead of doing
that we could wait for another call to the function reading the
data from opened files, so that we leave the most recent (albeit
outdated by one cycle) frequency printed on screen (with your
change the fields for which fopen() failed would be emptied).

I believe the error prints were useful and should have stayed.

> Enhance gputop to display GPU frequency information (current/actual)
> for each GT in the client header line alongside the DRM minor number.
> 
> Key changes:
> - Add get_gt_frequencies() function to read GT frequency values
> - Support both i915 and Xe drivers using appropriate sysfs paths
> - Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq"
> - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for
>   driver-agnostic sysfs access
> 
> The frequency information helps users monitor GPU performance states
> in real-time while observing client workload utilization.
> 
> Example output:
>   DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
>   DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

[...]

> +
> +		fp = fopen(freq_path, "r");
> +		if (fp) {
> +			if (fgets(freq_buf, sizeof(freq_buf), fp))
> +				cur_freq = atoi(freq_buf);
> +			fclose(fp);
> +		}
As I mentioned above, these error paths were useful in letting
users know that something went wrong.

[...]

-- 
Best Regards,
Krzysztof
