Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9DCEBF65
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 06:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33B310EC23;
	Fri, 27 Sep 2024 06:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6jXIarS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAE110EC23
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727419117; x=1758955117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PO57pQXOpUdmii9SiWCaIgKVJ0T+qkNfXtxKPKW30QA=;
 b=A6jXIarSkXIUIJ5rlv4GST+ioY34wQmUp6/GsD0yzrbnEc1f0UC/r7Jp
 kpLqpXSH6AX0WbZXohEsb3rYgy9Or2CpQZLiueYUjxFg9DAjefSFrvuo0
 7BkjPRbNI13yWZJWEmwycIJO0553nn8d70htdvL0eABE22GgEQaKbIsVg
 SaF4XGN67dFPuQMxjBebqfM5uhC05BrT4cEWnpu/echVYRQl+wDdQM4N3
 mNYvyV8AvVZA3zB14myQs5vo0f6EkAXvR0jha6x5rCookTtClPeBFe/KT
 bxQc2ab9fg4z8BkWFbx8pNzE0ioW+VhG58BkvZiWXtSq3gqwfrvBhHyOj g==;
X-CSE-ConnectionGUID: eo2sWmlERja9dB4JCkRvFQ==
X-CSE-MsgGUID: PODTy4WWSjSeYBMIKpVIHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26718626"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="26718626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 23:38:37 -0700
X-CSE-ConnectionGUID: b4IGHmqvTUGjzY5ekWfxmA==
X-CSE-MsgGUID: pox79SD7S1KhS0R67jk6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="77379479"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 23:38:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:38:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 23:38:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 23:38:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 23:38:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0Z+jIfQ3wwUDQTDxRINemhM+L/6KwUr6I4rKRsBhXnYz2ZrYUbf5qAnh+yrYalMknfZBTlaOM6INF2phd1hMkziHoUFHn7FTvEkuVv2gfnXJkNyadkwUZxtnc5LocMZVPVnUmTnTBAfn79FpApmfS5gCtm9NPYW6phvZkwC6GR2uX20ZbCZ0+Q2FnUR/tnG4kFrhTh4Y9rsMr50YfZIuJ310B3NVRCONAsMQkfkP/aAB7YyXX2W7MC5JgJX0SDsqgENwn6mwWNna53SVgF2ctgl5CgWySQNu+lW1KFxp5LDkmSLD+ufJPuIkG/d20TxyRu0JPgEK4rl/gm3z3jykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO57pQXOpUdmii9SiWCaIgKVJ0T+qkNfXtxKPKW30QA=;
 b=yGYYUuJSY6up9Xthl929gQOGr7DqhKy5euiOK6wxVE5mbFbe11NyCe5PbAGBBTPfTDVZ0H8MrI3gHMIYUoveyTn6QFI0JUw4wHEMMztvvuMY7ZIFSZSvp8kPezIjLuwJzttL++LeNd/ZXZvo7zTtHoVZLxHi/QUZYYGpEs/zX7jNsZMRZ3tfK2gwEQW066CFrnueaf9t77cRwJt8yVhCuhApblckIWt8reNZ3v5K/Cn3lIyrz1awXsB4RjzOVqSAE4IGu7XREHxc5iOovuoUSevKoXURG5cDN1haedTD1ZfLTSGfL4lOsM8Wo4A/zv3GTM/FAXuIijV0FEoViTaiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Fri, 27 Sep
 2024 06:38:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 06:38:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Topic: [PATCH i-g-t 1/2] lib/igt_psr: Allow testing without checking
 sink status
Thread-Index: AQHbD+KGGm0viVIFwkeWBNMzlARRBLJrLJ4QgAADKmA=
Date: Fri, 27 Sep 2024 06:38:34 +0000
Message-ID: <DM4PR11MB63120769DD22BB9D340F3B1A906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240926070517.1326936-1-jouni.hogander@intel.com>
 <DM4PR11MB63128EEBE33599AF82EC98B9906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63128EEBE33599AF82EC98B9906B2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA2PR11MB4971:EE_
x-ms-office365-filtering-correlation-id: e7b7c19e-debb-4bd4-bdda-08dcdebf0291
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MWU0U09oVlo4ME5TdXFHZjNMZUtidDVqQm9ib0lBZmlKeUVuckJZalZtNTFq?=
 =?utf-8?B?aE1mUkxrbkNiakNyTnN6NWt1R2FOUUJQaVhxQnAzQ2k4MlBpU041V1QxQkRh?=
 =?utf-8?B?VmFvekEzM0ZUenRodnVHblo4SWJNRVN5RlRPVTRBeitPakFDRkRybGl6d3A3?=
 =?utf-8?B?TzB5L0FrZjY4Y0xkNWpQTGhpSUh5Y0IvVkl0dno5aW9BZkY2cmpPYmtGS2JP?=
 =?utf-8?B?aVZVQmZkdE41WFQxZWcrS3UybEttRTVTNDQxTzNmaVFsdmU4ZklpM3ZqMCt6?=
 =?utf-8?B?cDFwYnl3V3JZR3VPTm1WVURqTzR2d29UbmhWY1RFa2l1OXloRmQxdmZ4VjNK?=
 =?utf-8?B?UDhZUEZBVEw1UFExNTJ6OGc4T3I0QTNhcFY4NS9yUlhUemZubXk2SjZycmpP?=
 =?utf-8?B?WmF4L3VCcmt5ZUJhUFU3TnJGaDJQdFh6NkJCOVFTOUo3cHNPVzBEWllWNnV1?=
 =?utf-8?B?V1VpQVpwNTJQMU1BYWswUDJuUDJiSHlwR1hYTUtvRGRpWTBGUjhlTzNXQ0Vm?=
 =?utf-8?B?ckU5dEtxM3JqbGw2ajhJeitoRytTaXdmZk5HVGhOc1BGRmtXWnAyTkFKaHp6?=
 =?utf-8?B?K0E0U1ZFbXNFV3hreVRMZHdxQXNwakJoK0tDMHE1L2k1L0NOSU9XeWJaTDl3?=
 =?utf-8?B?OUhieWh1TnRpUCtsVWtVL1dZVTJISHlVaW1ydkxwVUVLdkt2NXlCUTlPeEpq?=
 =?utf-8?B?dzVHaDZYTjBianMxY0pENkxnSWNRUFdXYTJEZC9icG5jQ1JvT0Y5bFBISllh?=
 =?utf-8?B?NGtMTTRVTml3SUZhK0MrZlM0b3hSbG9jUVBDMVk2bHJoV05NUFpTUlpDbTRp?=
 =?utf-8?B?UkVBWEh0eDJzczdCV2ZOUFB1SENrZG5jbWt5cWIzd1dnUXVsTnVpMEd3REYr?=
 =?utf-8?B?bUkxZmI1SGtnQ3hXYnBDdE40TFptM0x3czEvbEFNc0ZlMXVyNjAvVWxTODdz?=
 =?utf-8?B?WExwK05ZVEJKVCsxTmxSeUNXcGFVMm5ISmp4TTBUTEh6T1Q5WUJ2OGNxc2Yw?=
 =?utf-8?B?aFhGU0JKM1AyRjlOaW5La0ZZWElIakxLeDFrVFNlM0o5VEJNUVROWXJGNmUv?=
 =?utf-8?B?MWplZk1UN0psalRYTzhIOFNtYmt1SjJDeXV4alcraEFPbVZDOC9SUUJ0MjVW?=
 =?utf-8?B?U0FvZWNSam1EVDFHc044aXpuK1lORXdjc1BBSTdnNnJ1ZlFqQTZWRWlsM0FJ?=
 =?utf-8?B?dVk3UW9HeWlNL0FJOFZtdHY3NmdnQTltZXNCWk9rd0lkemVSU2ZXNER0OCtI?=
 =?utf-8?B?SzEzNEs1YllmM0FnOVlkdWIyV0cyVDBCUXN1M210N2NVTnlkbStEbEtGS1lp?=
 =?utf-8?B?eTlHYVBrKzE2NGtRbDhxazBOQ3AzcDlTZnB3UjFlYWRIdzRpS1pRaTdNYmFs?=
 =?utf-8?B?VXBvOGdLWGMvdldtUGQ1YUFRa3FGZURQSkVWSWpUOHhRTm02QVlyT0tmdTFu?=
 =?utf-8?B?L0xaN0hIVmtlMEFGZjdDd1hocTJCZWxMYVF3NWxhc3NiUVNuN0hMakw2a09p?=
 =?utf-8?B?WmtYYjIxVUI2ak9TZmJxNzU4TWVWWEd5RGp2V2JBSTJJcStOdkpiVkpvc1ht?=
 =?utf-8?B?dGMyTU0rMklzMVJTY04vTnpjR0lKSjJrSEF5WTJuOWJ6R3RJQ3dDdXEvOTBE?=
 =?utf-8?B?M0plajN0cVdYZ1hOcVNGQWlkWmgrTHZkY3UweHROVThTWENDbGZxcVVQTllO?=
 =?utf-8?B?Zy9FVkNHUVNySTVPb05JN2N2aWxvWHl2aExrYStSQi9CVU5NUEpNTTZocnRQ?=
 =?utf-8?B?UWhGT2FoK0JrK2JmTDkzVlVHT1FDQ0dOK0dmcTFFUWJhUVQ2N1lIQXlOcTdP?=
 =?utf-8?B?VGg5TEYwbU85MmJTSUVPUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUFNMHRCZlVhWWFzY3AvNUYybGJFOXlwbkpqL2hVVStVWUltb29YQmJwRnlF?=
 =?utf-8?B?KytCbXVRbWo3TWJFaFZ3MFVXZEY3ZmRiZzQxT2JXMUkvSmF0Q2NzeTJmQmFL?=
 =?utf-8?B?ZDhqSHpvTDhHVVNKS1A5OWJOaGJhekRuZ2FwczVjT0hqd2ZxTDV1bG1UbEtx?=
 =?utf-8?B?YUIyYWF3bUhzdEQ3c09yZmhCY21CbFZiMFlldVowTk1kdkh3VVVxZ2pvMk5C?=
 =?utf-8?B?bFVlVjV0b0dzYk1QV0dFYklZQVRnWGsrMDNaOHVlRVl4ZUdCdE9CRWtaQi9w?=
 =?utf-8?B?eDJoRGpZR3FzZVY0QTNPa2c0VXVHdVRUdU5hUHdQU0xzS25tSHUwZEdIMGpU?=
 =?utf-8?B?Wjh3Y3hXdTRVK3N4eVJjQm1vWncvVWtjbUVzd3Exb2VWNzFaMGF0amNlbVhP?=
 =?utf-8?B?RGE0TGRCOVo3b0NoM1EzY1RGbmNWa2hiTS81NWR6NHJabWIrejhiRWxmRTZE?=
 =?utf-8?B?UjRCbXZMR1dGY2xocGJxOWFGY3F6cWd3eU9PTWJ6cnVOSmRTUWRITnlkSlk0?=
 =?utf-8?B?bk1yWkVicVRMN3ZsR2JvY1JLZ2tzQ2llb1dEM1hseldBU0gxcHNZckgxWTND?=
 =?utf-8?B?TDRpZ2U1R3J4aTRWY3hEVit3L21zVjdqWjVDTDk2MlhkRVJIUG1OaUlxenJY?=
 =?utf-8?B?VVplSEx3Sit1Z2xkd1BERUNSWThBQ1dpS0h5M2tSckc1TFNoc1JZcnE2NGpM?=
 =?utf-8?B?NHlxb1NaQ1BUTGNUdEhRZkNZZmFCV1hRNkpEWjVqZXpPTmJ6bEpQK04yMW5N?=
 =?utf-8?B?c2xBQVFvRWNTeGVkZDdpbEJOdDNLZkxyKy9pcmNHd3BaR2NkSUR0TU1HL2pG?=
 =?utf-8?B?NkhGWWVNczAzMDRBa2hVb0VjbUpsdloyRWZKanozZ29WSDNyWUFwZUQ0TGZW?=
 =?utf-8?B?SkF1eUgxd0JZSG1ycFIwMHlSUzhqc3hOcGVRbVZhdWNaL1JLREZOSjFWZkto?=
 =?utf-8?B?VDAwaW5PQ0Q3ZlRqbmVaSlpTbzcyaXJiN0dmUkZzbFl5b2ZNNlpLaTNCYmZi?=
 =?utf-8?B?ekU0QkJyTEQ0cWZOYWFNdEFrMmR6YkRXR1U1anlOWmJtVzdQTDdPenU2cU02?=
 =?utf-8?B?cVVHSXpOWnd2Tm15cndrNjdubkdjTkZGbU5Da3hSamM2N0VSOExvOEg0eGxK?=
 =?utf-8?B?VWNxV2tDalNiUEJ6YjViTjVVaEF1UWpQRU1EZFY5SGZKZ0dDRlVhYm9LeFgy?=
 =?utf-8?B?aHpzbkhmdWZxNWNGUGdzZE5IaGdPSklUbHBRejY4dXI5Q01WSUVMZCtjSzlp?=
 =?utf-8?B?TnlhR2k2MzlHeTVGYU1lckljcjc5dW54VXpkeU1LTWtWcFdkUGkwNnpKdE1F?=
 =?utf-8?B?QWlxc2xJSGdpM1FzREl0OWN2dmJpYmVoMW5DUmt5T29wOVhhV1NYR25EL202?=
 =?utf-8?B?Rmd1SEg5VHlWMXZTNFp2QStuWlNYampUMGlDVlhaZlFiNlJlLzlNbHZlTXJy?=
 =?utf-8?B?YUpvQml5SlU3czkvWTFmMGZHWWlNL0FDQ25XNE4vTVZnRHdKWkVZeFZ0dXJW?=
 =?utf-8?B?Wm9sbnRKTDMwa1NrR0w3K1pyTUN0THVkRFRvb2R0Mmp1RlIxZVVLSm1OQ3VL?=
 =?utf-8?B?VEMzQVYyNmFaakROMHhTZTFKQ2FaK0xIR3JoUGc4NkVQTU55WUdHNnBodUgz?=
 =?utf-8?B?K2hWVFB1aW1PdHA4akhzZmNPVGJ1T0hpRWx3empoK09pN1hRQWVHdy95OUdX?=
 =?utf-8?B?WVRVOTZ6LzVkMW9WR2htKzdhMUNLb0hXMnpPY1hML3lWeWpZVHZ3cjZHNHY4?=
 =?utf-8?B?Z2gzL3pNTU84bGpTTm9nMXFjR3ZjWE9CTlhON2lBSGFCTHp0ZldPbkdPL2Nr?=
 =?utf-8?B?R2JFLysrWDM0VFU2dXdhbUtlYVd2dFIzWnFaU2NWazdodFM4NDdBaHI2UjlF?=
 =?utf-8?B?WHdwSVhiMDRyaHd1RVYwL1ZUZE9FZFlCZ1YvMDVlVHZhTHpKVml3cnhtTDVG?=
 =?utf-8?B?ZndxYzJ1dVh0S0h6VThDaGF0a0JHeWttZmUwRkNzSGdhV3BhR2tKVmowaHJ5?=
 =?utf-8?B?RzdmQk9vdmZDRFo2UDQ4amNtbFRhZlN2K3VGaklLUFlhRTBNOFBGdjM3K0Iz?=
 =?utf-8?B?WnhKL2hsSy91WXFsdTdOeVhkSHdUdTBmUEJaZzVZZDVhcG9MbzV3SFAzaTZp?=
 =?utf-8?Q?M2/k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b7c19e-debb-4bd4-bdda-08dcdebf0291
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 06:38:34.2828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekTdA4Irt2Qyh8LEZjZHIcYbhdqSwn50n/UOi+WOXD3UakJrEb+nl65sTBFVPQbYTrLc9D2+3z799PR/T3QCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCLCBKZWV2YW4NCj4gU2VudDog
RnJpZGF5LCBTZXB0ZW1iZXIgMjcsIDIwMjQgMTE6NTggQU0NCj4gVG86IEpvdW5pIEjDtmdhbmRl
ciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBOYWxhZGFsYSwgUmFtYW5haWR1IDxyYW1hbmFpZHUubmFsYWRhbGFAaW50
ZWwuY29tPjsgSG9nYW5kZXIsIEpvdW5pDQo+IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFJFOiBbUEFUQ0ggaS1nLXQgMS8yXSBsaWIvaWd0X3BzcjogQWxsb3cgdGVzdGlu
ZyB3aXRob3V0IGNoZWNraW5nDQo+IHNpbmsgc3RhdHVzDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4gSm91bmkgSMO2Z2FuZGVyDQo+ID4gU2Vu
dDogVGh1cnNkYXksIFNlcHRlbWJlciAyNiwgMjAyNCAxMjozNSBQTQ0KPiA+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBOYWxhZGFsYSwgUmFtYW5haWR1IDxyYW1h
bmFpZHUubmFsYWRhbGFAaW50ZWwuY29tPjsgSG9nYW5kZXIsDQo+ID4gSm91bmkgPGpvdW5pLmhv
Z2FuZGVyQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgMS8yXSBsaWIvaWd0
X3BzcjogQWxsb3cgdGVzdGluZyB3aXRob3V0IGNoZWNraW5nDQo+ID4gc2luayBzdGF0dXMNCj4g
Pg0KPiA+IFdlIGFyZSBjdXJyZW50bHkgc2VlaW5nIHByb2JsZW1zIHdpdGggRFAyLjEgZGlzcGxh
eSBlbXVsYXRvciBkZXZpY2VzDQo+ID4gYXMgc2luayBQYW5lbCBSZXBsYXkgc3RhdHVzIGlzIG5v
dCB1cGRhdGluZyBhcyBleHBlY3RlZC4gRm9yIHRoaXMNCj4gPiBwdXJwb3NlIHVzZSBlbnZpcm9u
bWVudCB2YXJpYWJsZSAoSUdUX1BTUl9JR05PUkVfU0lOS19TVEFUVVMpIHRvDQo+ID4gZGlzYWJs
ZSBjaGVja2luZyBzaW5rIHN0YXR1cyBjb21wbGV0ZWx5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IA0KPiBTZWVp
bmcgbG90IG9mIHRlc3RzIGZhaWxpbmcgd2hpY2ggd2VyZSBwYXNzaW5nIHByZXZpb3VzbHksIE5v
dCBzdXJlIGl0IGlzDQo+IHJlbGF0ZWQgdG8gdGhpcyBjaGFuZ2UgcGxlYXNlIGNoZWNrLg0KDQpD
b2RlIHdpc2UgTEdUTSwgSXQgc2hvdWxkbid0IGJlIGFmZmVjdGluZyB0aGUgdGVzdC4gTmVlZCB0
byBjaGVjayB3aHkgd2UgYXJlIHNlZWluZyBmYWlsdXJlLiANCj4gPiAtLS0NCj4gPiAgbGliL2ln
dF9wc3IuYyB8IDUgKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfcHNyLmMgYi9saWIv
aWd0X3Bzci5jIGluZGV4IGQxNGE5MzUzNC4uOTYzMzg1OTY3DQo+ID4gMTAwNjQ0DQo+ID4gLS0t
IGEvbGliL2lndF9wc3IuYw0KPiA+ICsrKyBiL2xpYi9pZ3RfcHNyLmMNCj4gPiBAQCAtODUsNiAr
ODUsNyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVt
DQo+ID4gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90ICpvDQo+ID4gIAljaGFyIGJ1ZltQU1Jf
U1RBVFVTX01BWF9MRU5dOw0KPiA+ICAJZHJtTW9kZUNvbm5lY3RvciAqYzsNCj4gPiAgCWNvbnN0
IGNoYXIgKnN0YXRlOw0KPiA+ICsJY29uc3QgY2hhciAqZW52Ow0KPiA+ICAJYm9vbCBhY3RpdmU7
DQo+ID4gIAlpbnQgcmV0Ow0KPiA+DQo+ID4gQEAgLTExNCw3ICsxMTUsOSBAQCBzdGF0aWMgYm9v
bCBwc3JfYWN0aXZlX2NoZWNrKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtDQo+ID4gcHNyX21vZGUgbW9k
ZSwgaWd0X291dHB1dF90ICpvDQo+ID4gIAlpZ3Rfc2tpcF9vbihzdHJzdHIoYnVmLCAiUFNSIHNp
bmsgbm90IHJlbGlhYmxlOiB5ZXMiKSk7DQo+ID4NCj4gPiAgCWFjdGl2ZSA9IHN0cnN0cihidWYs
IHN0YXRlKTsNCj4gPiAtCWlmIChhY3RpdmUgJiYgb3V0cHV0KQ0KPiA+ICsNCj4gPiArCWVudiA9
IGdldGVudigiSUdUX1BBTkVMX1JFUExBWV9JR05PUkVfU0lOS19TVEFUVVMiKTsNCj4gPiArCWlm
IChhY3RpdmUgJiYgb3V0cHV0ICYmICghZW52IHx8ICFhdG9pKGVudikpKQ0KPiA+ICAJCWFjdGl2
ZSA9IHBzcl9hY3RpdmVfc2lua19jaGVjayhkZWJ1Z2ZzX2ZkLCBvdXRwdXQpOw0KPiA+DQo+ID4g
IAlyZXR1cm4gYWN0aXZlOw0KPiA+IC0tDQo+ID4gMi4zNC4xDQoNCg==
