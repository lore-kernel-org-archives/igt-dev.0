Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1C4CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 18:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE9110E0EE;
	Mon, 17 Nov 2025 18:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIanYnQW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF26E10E0EE
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 18:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763403526; x=1794939526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8bigK7eiO8uI7GFgD16FH4Q8tsWunXusuT2wqFTfStA=;
 b=TIanYnQWr0x432dKowAvlzaCJQgn9SwmIDJqrD9CHOu4TZrz6Vta4tgL
 b96p9NmGl9SKkx/HIgD8e858UHq6AurmJUYGu3SX7dqrWM3b2p4WOluRQ
 aTrmgxeEWn+BXxVcfgE3rWBdIxZslLUNRsXELhS6yctesj4oqsfM/ALR9
 UAqZqkTleEEUTNg4HUy57UrOqjygs+VPhTd4sxXsTFk+r+joizziE/0KQ
 xIVv02ctPKFtQBKygTYjfav6UELwkwZ8sqfkiEqLHti/C255+beCmzgIO
 chv/afPOwOR/rq9GvSX/k7+qSrwfdVKsrPKwy4F/+PG5e25YR38DSX5Gm A==;
X-CSE-ConnectionGUID: YhhF9jMZS+S4tIOYGDvUdg==
X-CSE-MsgGUID: HRP92faCRref1V5dMWKRBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64614336"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="64614336"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:18:45 -0800
X-CSE-ConnectionGUID: GqArVwwPSKmCoMS8BdszBQ==
X-CSE-MsgGUID: 9MRViLZMSeaxo+3VOlPDeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="213913753"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 10:18:45 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:18:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 10:18:45 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 10:18:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjiCH8z+J4DYihlpWxT6AUp1voDqIsNKhsuH05xLH6qN+vJfGifIKpon/Ovvl+ASCd6XWi7PkuWJeBbCK1j93IQzAM+hha9vAKehxV+d5/RiLMhxwRHsSvBkEwcP5slffmvcq8iz3G8N+uQMDnhf6uuoCfFuL+TFlXqeoS5rY46XcBs4JRQyfc7KsxV9IC7f45PzNIACB1+XCXH6+fmLQA1tofIOKhEZgia5+NV1130Y8La1r8XiuLK8FAwenrqbf+dinS3h4fxlY49M9wj+MCl/YWBf5N33ftMOzTVy3G6kFVbYO8fp3Ow890F2BHzlMZGOcgnRbEtH00qM8y3CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bigK7eiO8uI7GFgD16FH4Q8tsWunXusuT2wqFTfStA=;
 b=gQEI+R1+KU9vNVp3WP+Tl5SEiAfPSCBVm69JQAX4fc/xDySYA2jBWDKfQUwvm3cXAe6TQAGISsKt9xLM22U0HIneF4QQUBOfzxj/bXQ9eOC69dWLTOJH28E74VQaBDFzgUducZVF1vR2R9RnAWSuUkT8iKSIvEBNPi+Zfl6ecDXkidaAXm3FZKaltCltApVoaVoy3H3PENIJIQbfQXOwwFg+8h4ruZk2tGZoCoy1IW7oJDIv9ed5i/b8hJgD2GoJFhZ7OJa6l9ErIwzgG+HZVJB7d+h3ffRwcfZXIP11kOb6NrSCeE1a7dg+tfQ3n9Wb5YCHZERCgpkQPCH7DuE7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6683.namprd11.prod.outlook.com (2603:10b6:510:1c6::9)
 by SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 18:18:40 +0000
Received: from PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::48cf:d45c:13a5:7c53]) by PH8PR11MB6683.namprd11.prod.outlook.com
 ([fe80::48cf:d45c:13a5:7c53%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 18:18:39 +0000
From: "Bai, Zongyao" <zongyao.bai@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Thread-Topic: [PATCH 1/2] tests/intel/xe_pat: switch PAT tests to igt_srandom()
Thread-Index: AQHcVc2rFvVZmQtu/0mocKnQx58xcbT3H+UAgAAPNgA=
Date: Mon, 17 Nov 2025 18:18:39 +0000
Message-ID: <PH8PR11MB66833AD03FE2DDD7CA25E5D3E0C9A@PH8PR11MB6683.namprd11.prod.outlook.com>
References: <20251115011730.3700391-1-zongyao.bai@intel.com>
 <20251115011730.3700391-2-zongyao.bai@intel.com>
 <20251117171520.mbh7upuhlud4eqd4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251117171520.mbh7upuhlud4eqd4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6683:EE_|SJ0PR11MB4783:EE_
x-ms-office365-filtering-correlation-id: 79ab323b-dfd3-422e-718c-08de2605bb47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?THFydmJlL2dCSlFPa1h0TE9PdDFtV283a1kxNWJVRy9URWFCNkN4RmlBR3M5?=
 =?utf-8?B?ZlRNMjlxcTIyRTJGdGk2a3ptOG1mRXFqaUdGeVJ3eDdMZGRWTjc1ZndNSmhz?=
 =?utf-8?B?NW1pSWMxbWVlR2w4SGZKclZqbmZEUURyOHIvUnp1OTRFL2ZPSy9XUE9kSmE5?=
 =?utf-8?B?KytjY3lkUzZHZXJoa2RNL1IrZmJkdXZWVitMeEZjTFZZdWdMcnYra2dwZktk?=
 =?utf-8?B?YVd3QlJsWDlsZTJNbTVxbHRKMHI2anR2cWYrc05vcnNBU1RFL0N4TTVYdis5?=
 =?utf-8?B?OTdtREVpMlZWcnZBUHdySWo3ZGZ5Mk85ZE1LeHVlcm9IQWpyNEFCMERtYXFj?=
 =?utf-8?B?OEovWjAyVkozZU5zYXpHNmdTUUVSRjdBdVVvdkJuN2FNd1J1M09LdjduemxW?=
 =?utf-8?B?T0ViUTRreTdRMjlYUUxuSWpVQzhFU1dRdURLSkc3V1ZKY1g0UWUxeHJhOE9G?=
 =?utf-8?B?SU1BSHl4OHVsaXV0Tjh5MnF4WVAzaDVDRGlFSXJCQWFXb2Q2V1dhMlRDVHBY?=
 =?utf-8?B?WHZPbWdXM1FCYzg3c3JscGJaZzhxNVhXaCt4bVhSek5DVHUwdFIxT1ZJRFhE?=
 =?utf-8?B?TEljV1JTYXI0QVJUT2N2NjFMa1E0cStwNzZzQ21Jd3BwdDgvLzRWTmxEUjZW?=
 =?utf-8?B?ZDExa0xrN2JaZ0VHdVkzQXdBL21Gck1GclBlajNCb0ZZcWQwYTVCa2d4Q21I?=
 =?utf-8?B?R1JkUVhtaXhtV01MUVJyV21DMXdlL1h1SFZQK01OVEtLbHZ5Y0ZBQjJaS3Nl?=
 =?utf-8?B?VnpTcFVQeFZLb0RURFRYNHUwYjRHUzE0YnkwRCs3cmRoVnhyOWsvZ0NZS2x6?=
 =?utf-8?B?Kzc1ZS9ET0VvdDhUTEIxSUdyWUkzUUJGc1UvWTZRSXZFVHZTQTZnV01yMHZq?=
 =?utf-8?B?cnRIVWlZK05yeTNvVW1CS3BtRVhMTlFuUURSTEh5YVFTV015QlFkWWtaREFU?=
 =?utf-8?B?UCtKNW5uVCtQR3preE1NdklLOW9kaFFhSWNVaEljU3RnWllNSXdua3RHVXgv?=
 =?utf-8?B?VDdUQ2IyVkdaOVN6RkVjcDZrOWlVdkVqcEJHM1ZWVnB4aVVtVDRNU28vVHE5?=
 =?utf-8?B?emtPM2tVNnZtbzJOaGlIK29xQU56NGd1ZW1lcmVCRGVDQnA0R045Rll5VUMy?=
 =?utf-8?B?Wm5WbGpHTk41SXdiYTNuZUNmdTVxKzJxcEFIN3FielRpY1ZycWdEZUR5cU5k?=
 =?utf-8?B?V2pacmZTL3RHRklGcHVaQUVDNkxUZjVSL2pYOWJ5c0dCcnRqaVJyeiswOXQz?=
 =?utf-8?B?YXVoWnQ4MXR2V2VXTWNDRzA5NFhYUjUwKzZUL24xaHROeS9hc0MzNjJnT1hu?=
 =?utf-8?B?ZTduc3UxZXlBY2Jzcnp6UVpQWUg0UVBLT29aZlJJQjd3Q0IvTGZXNXMvbGJ1?=
 =?utf-8?B?emM4SUpndWhWWXkyT1VTcGlCcWY2b2sxOEhGQzlBcTcyQVQvRnAxVHdzT05C?=
 =?utf-8?B?MmFkbUUrdFZtRnQxeVBBUEpmRyttSkhzVGE3eUlKbVI0UlNBNkF2dzBBanBF?=
 =?utf-8?B?cnlxS25QTGFRaHRtM1U1MUNwOUh0VDhMM0dHd0dURHRTdXNDK0lzVW5rM1g5?=
 =?utf-8?B?ZzhtOElaN3hkNVU0b2VvVzRuTEtrMm5xVlJSeUVVbk42N1BwbTN0NEhld2pT?=
 =?utf-8?B?c0xxNHJER0NkNm5xWHdlamZjR0Q5bVBvV2J3dHVJUEcyR3FOV2xqM2J0ZG1s?=
 =?utf-8?B?b0V5QjJQQnlYYlI5QzFTc0Q1ZWVzRWpiSkxRNzNWMlBkeEJPNVVYY252SmpF?=
 =?utf-8?B?MUtIdmFVZFl2eE5KeDVSL3dFdzJhY2RpNlFudEtzZkhZSWQ2U2ZONjZFU1Ji?=
 =?utf-8?B?YTVSckloSlJrS3hVZnpCTWMyREhrZFVBaXdvVWpKOENZYkpOWHlrbHpLU0R6?=
 =?utf-8?B?Nzc0bC9ab2tuSUNSdDZEVVFNNEo3Y0ZBLzB4QVpxMlRZM29aNG5NczlDcW1C?=
 =?utf-8?B?VEkzSFBvMlZiUHJPbVhvdHFxYlBGSWJMcEF5UEhFbkpaNFk2TFk1NW1NN05r?=
 =?utf-8?B?S3EyNW5lTUg5NHF0UkVoNlppajA3OUVrQ2F6SWdraDZITkVjRnlXelpvVmNy?=
 =?utf-8?Q?c7Fa8x?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6683.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0t3MFFWanJqNW1Vbk1JMVdKczl2d3NGS0RKSUtGeDUxK2owejFyaWZSbkxr?=
 =?utf-8?B?WXpzbHdHa3V3RXV6bThyUGR4aW1ySnlvUCtQRUdSSWd6Ni9Meit4TWhaVHJi?=
 =?utf-8?B?RGU5R29IL3ZLUzV5MHNzakZzVHZ4dlRjc0hxWjUrWDZBY1MrVWZkTVIxWXBX?=
 =?utf-8?B?TEVTQ2pTQm9vbWxBRUtmSkxGZkx3d25kaVcwcGR5WEF0Wk1aRU1MSStMeVB0?=
 =?utf-8?B?RWwrWEpDUmF0V091d3Fja2RjTDU1QTI1VE9lQ1F4c1VodXpKbE1GWUdhTkNr?=
 =?utf-8?B?MXlTWTZicEFEV0pwanovTXpyUUFCOERlTjJLS0w5ZFhSWlJKYnY1YmtLNWRm?=
 =?utf-8?B?T1lrRFpMQjFObEcwRWFHbXI4aXBMWkYvUkVCdm5oWWxxT1pHVDdBUlVrdExn?=
 =?utf-8?B?QldXTG5sV3JxbElrUlRBWWtBdWE0TkhJa0c3UmZ5c0FocS96cGVQV3BnSGhC?=
 =?utf-8?B?bWprdVg1cHJUTEczdmplZytxWG1wb0tuY1NSdi84T1JtaGc5L2czNTBheW1n?=
 =?utf-8?B?TEJBZW5vUkpzR1laVUhUM1ZScFlIcy9ONU94OXgycmE2b3NvK2ppNndkaTN2?=
 =?utf-8?B?ZUpEZFhIbFJCQzN2T1NObmh5QXdIRktmZ1ZnWVAvV2Frc3RrS21Bb212ZkJy?=
 =?utf-8?B?eVNzRjliOTk4SFdYWE5Fanh3YjZrNjA0am54OGdzUE5RRm5GUkRMNUhxRStt?=
 =?utf-8?B?TDF2Z21PNXdDSm9ycDVOMVRNTXV5cm5wVnNDVEFRZDFaMFk3MlZwcWRQRFA5?=
 =?utf-8?B?SFFRNjRNL1ZhaUVyNGdPWFNoaUxNYjNXWDgvVlhFQnRZUlJiR1NsK0l6WnMv?=
 =?utf-8?B?WlprTG0rVG42dk9IekRGYWs2L2tvR2ZTVEpGUUdEQkRvaFg4dkdlRWJEM0My?=
 =?utf-8?B?S3BiVTN2TGpGNVdRUDIrTnJub044TkwwcDVOWjhrdUdtcHkzdTVhbDZ0Lzlq?=
 =?utf-8?B?QjVvNEwzdldHR0V2MWxZQ2RMQ3FNWGg5RUEvZVRYMzIrS1prUHM2RVE3Ykpi?=
 =?utf-8?B?cHVMUmtERUsvSWtLV1VvMkZ1c3liTkFHR1NPQk4yZkdTTTFoL0pyMmg1bnlB?=
 =?utf-8?B?dk56eHM1d2FPK1pzbzF4S2kvSzZyc1ZWdC8rM0hNNnNwVmhUMWVRSVJWbXJ0?=
 =?utf-8?B?N1RpN3grazhqeVBqb2Q1R1pVci9aQVIzZ3dZR21rMHk3akgySktmWW5oaDNP?=
 =?utf-8?B?djduSmh6TXJJM3NzKzVVc1F5aTFFOTJiL2RHRFcxWjgrTlRJRGpwdkVZVS9X?=
 =?utf-8?B?ZkRjVHdEdG5IbU1Qa1VxQkhSR2Y4MDJMWHVUdktDMGYxcXhuWThBNzI5cWV1?=
 =?utf-8?B?YmVIbVRKN3QyK0QycjlDNzFta0EwS1k3TExKYlpnQWI4QzUra0dzUXVhQjdU?=
 =?utf-8?B?STcyRVkxTGoxWTA3MUxCOVRqRHRSRW9DcVZSMkxJYnc4S3Z1NDFxVlZDYW5D?=
 =?utf-8?B?aGFjR3RITVhLa1NyczVZeTE4YnRHSmsyVTEweGo3YVFXRGVSeGY1VWF5YTlY?=
 =?utf-8?B?T0R5dW9xWjBySWF4cHI3c0V4dXR3WW4rZDVaZ242MVBLZG1OdVZBelVTNjdJ?=
 =?utf-8?B?SEdqRWRkR2VEZXkyUkJQeVVvVFQ1NWlyM0lqWHUvbWdpQ1k2c0NRR3Q5Q2s0?=
 =?utf-8?B?d2xCOVJSUXN4T1JmaFptYTlyV1Z3b1ZHTWJibmtjRDNHMlpJVjJ3MjZkNkJR?=
 =?utf-8?B?TW5vcTFkZ25aUzFidFRBY2twdFErb2FYWXJIQ29DYkQ5QmtCNTd0aEt5WmIr?=
 =?utf-8?B?dUlkSVVKV3J4OTA2ZTF4Y1Foc0VEYUtrbUJxSkxnclQrdG1CSWdmQWpxQmpU?=
 =?utf-8?B?Uy8vOHlaeUU1THNZcit3cmNsNGw5WXNmSG4zMXlxQ1NwU0krcTFSdVMyeW4z?=
 =?utf-8?B?bFBtaWl6UFNTckVkT3hlQXRSS1NJOFVnaG05SVh2aEVrNEVtdzJtUFMrUHpL?=
 =?utf-8?B?NWg3TkVBbXVjOTZDRVVTbDJGVHRWd0twOXd0RndGUjNwUmxyNXRGYk9LZS9a?=
 =?utf-8?B?dGJWR29FZFNtazBaVm1wNjFGQ2NKeG02ZmZZNlh5SEpWZjd1b2Z6YllGSGR3?=
 =?utf-8?B?a0JTc2YrTDRFK0w1SFVtREl3VHN6NWI0K2NqSDYyQ0k5SUcrejY5Wi81WWVQ?=
 =?utf-8?Q?5kkD+PMRT8e5mYnWKdsn0gMOg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6683.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ab323b-dfd3-422e-718c-08de2605bb47
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 18:18:39.1373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4lQL+uc/uiZTA8bpz4Nb4LAYe5Cwhns0RV3zDj5Pmu/9U2bxxOCwShIsI9nQfLrZTMx+frtVgMNXW18uZ3LyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4783
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

DQo+IE9uIE1vbmRheSwgTm92ZW1iZXIgMTcsIDIwMjUgOToxNSBBTSBLYW1pbCBLb25pZWN6bnkg
d3JvdGU6DQo+IFRvOiBCYWksIFpvbmd5YW8gPHpvbmd5YW8uYmFpQGludGVsLmNvbT4NCj4gQ2M6
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1
bGRAaW50ZWwuY29tPjsNCj4gV2FuZywgWCA8eC53YW5nQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAxLzJdIHRlc3RzL2ludGVsL3hlX3BhdDogc3dpdGNoIFBBVCB0ZXN0cyB0byBp
Z3Rfc3JhbmRvbSgpDQo+IA0KPiBIaSBab25neWFvLA0KPiBPbiAyMDI1LTExLTE1IGF0IDAxOjE3
OjI5ICswMDAwLCBab25neWFvIEJhaSB3cm90ZToNCj4gPiBGb3IgY29uc2lzdGVuY3kgd2l0aCB0
aGUgaWd0IGZyYW1ld29yaywgdXNlIGlndF9zcmFuZG9tKCkgdG8gZ2VuZXJhdGUNCj4gPiByYW5k
b20gc2VlZCBpbnN0ZWFkIG9mIHNyYW5kKCkuDQo+ID4NCj4gPiBDYzogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IENjOiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNv
bT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBab25neWFvIEJhaSA8em9uZ3lhby5iYWlAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9wYXQuYyB8IDggKy0tLS0tLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BhdC5jIGIvdGVzdHMvaW50ZWwveGVfcGF0LmMg
aW5kZXgNCj4gPiA1OWRmYjZiMTEuLjU0YmVkZWZiYiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9p
bnRlbC94ZV9wYXQuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3BhdC5jDQo+ID4gQEAgLTEx
NjEsMTUgKzExNjEsOSBAQCBpZ3RfbWFpbl9hcmdzKCJWIiwgTlVMTCwgaGVscF9zdHIsIG9wdF9o
YW5kbGVyLA0KPiBOVUxMKQ0KPiA+ICAJaW50IGZkOw0KPiA+DQo+ID4gIAlpZ3RfZml4dHVyZSB7
DQo+ID4gLQkJdWludDMyX3Qgc2VlZDsNCj4gPiAtDQo+ID4gKwkJaWd0X3NyYW5kb20oKTsNCj4g
DQo+IFlvdSBjb3VsZCBhbHNvIHJlbW92ZSB0aGlzIGxpbmUsIGl0IGlzIGRvbmUgYnkgaWd0X2Nv
cmUgYXQgaW5pdGlhbGl6YXRpb24gc28gbm8NCj4gbmVlZCBmb3IgcmVwZWF0aW5nIGl0IGhlcmUu
DQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KDQpUaGFuayB5b3UgS2FtaWwsIHlvdSBhcmUgcmln
aHQsIGlndF9zcmFuZG9tKCkgd2lsbCBiZSBjYWxsZWQgYXQgY29tbW9uX2luaXQoKSBpbiANCmFs
bCBhY3R1YWwgdGVzdCBydW5uaW5nLiANCldpbGwgcmVtb3ZlIHRoaXMgbGluZSBpbiBuZXh0IHZl
cnNpb24uDQoNClpvbmd5YW8NCg0KPiANCj4gPiAgCQlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklW
RVJfWEUpOw0KPiA+ICAJCWRldl9pZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZmQpOw0KPiA+IC0N
Cj4gPiAtCQlzZWVkID0gdGltZShOVUxMKTsNCj4gPiAtCQlzcmFuZChzZWVkKTsNCj4gPiAtCQlp
Z3RfZGVidWcoInNlZWQ6ICVkXG4iLCBzZWVkKTsNCj4gPiAtDQo+ID4gIAkJeGVfZGV2aWNlX2dl
dChmZCk7DQo+ID4gIAl9DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo=
