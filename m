Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CB4CCF9E3
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 21:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6289E10EA3D;
	Thu, 30 Oct 2025 21:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8yJB5H6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057AA10EA3D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761859211; x=1793395211;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ePwSjv3WWc/aPe9klUrYL+t7Vnv9oyjvHYRVpbcc+HA=;
 b=B8yJB5H6vvJkQxGfO2R8pcaE0D3cCheXB+lcf2GUYoxgozfpd9FGaaso
 634z8V6YWIfSBRSajcY0JtHnvixUtsYw6M3bqAUoOb1rc7MitgFScqnur
 icfC+ebROywIgKCYHnIeu5MJpNd85uUI+p7J/434/QZ6ieAOMwStLc63y
 80wDtpaMU3yq+wXKB9ijFV3bNtU2T6fWPhgukUctkGvRF/AAmX00s5q3w
 6AFRLhU7mdeNjYoEpI5uRPQXefO+PF2PX3c3Z4kjAW6XYpyl7ANLADdL6
 oIB/ZCsUduQ4G0DmJEqKIxrDuR8z3WlqbRHSMW5YK/z73PQIJzPyoNyyO w==;
X-CSE-ConnectionGUID: j450nm4gSNqgKVd8UFZv8w==
X-CSE-MsgGUID: lLrIYF4jR+CXTLFIBV5/eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63036103"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63036103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:20:10 -0700
X-CSE-ConnectionGUID: dvboWTaAT1ernmH8nhlR/w==
X-CSE-MsgGUID: aXKpginmSmGeTYvK0Tgp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="190414243"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 14:20:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:20:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 14:20:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.69)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 14:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIzDtrXZtpf1KA3o/ffQWxmECqX9hH1j5PntH0gF703qR8yufvKs3K/vLMw0IxkyzGoi7RFemPsjINm0kp5BXpcR3hCE8zTcGIgh/uj0doRf/sFsHKvnotH8y7g4WFSJqnLTgkjcE+5iiwYDPFo92QAVjpmFuvwhX0r45SNA7I8E/MQXPw/uRbRbi5YOgxxVBYyyKj+HM+uqmY8x1aRlUPUdKaIKSeOwKUYazxY/CaNOSgg6nnCid6DSq1NkhIbWdFhjINMQlTnAHi6iLeALz5uFjwag1exOpNacwRoYVwa/07T2mxug8iUlK43vjkcVRZ9q2ZEENQ2qkNLly01btQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePwSjv3WWc/aPe9klUrYL+t7Vnv9oyjvHYRVpbcc+HA=;
 b=aVGfrJ/ns5plgiMlmqVEmY6pBjpDh5oPKNPUZP1jjxWF23XmTkluJMrOv+8GCq0x0UC4YqQLD9ak7SlgfziFxnFnopveWLymrTZgTYdK2g6hL/BF9mBiAFwh9eANHBSoXblCXu4nNcBjDzQ9F27lGcXI9v9nl/eW7FJyzzG+K9Kf2CLgzwkOtNU7sB8uTX4Jg32UopMhJMZxZ/2U9ppKpIjOMsuNPWHchaIATmKuKzCsYSGYWgMuVAwd/zuyO51jQfJHqy4qecIwpnRyn8ROG9QOZQBrbg+xyj6rPJ9Hs3qoO5oUzjKcBd7d4J412IWa3rHDAZ9jP3U+R7LFVTS2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV3PR11MB8553.namprd11.prod.outlook.com (2603:10b6:408:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 21:20:07 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 21:20:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Wang, X"
 <x.wang@intel.com>
Subject: Re: [PATCH v8 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Topic: [PATCH v8 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Index: AQHcQhcanI6eLfZsYUWrZ2+iclm9hrTbQbwA
Date: Thu, 30 Oct 2025 21:20:07 +0000
Message-ID: <a549bea6f9dae1d3548ed46e377d558e97b3c817.camel@intel.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-2-x.wang@intel.com>
In-Reply-To: <20251020231253.138842-2-x.wang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV3PR11MB8553:EE_
x-ms-office365-filtering-correlation-id: 687b8976-fd25-41d2-6529-08de17fa19df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?amYyUTJGV0MzSFpaZFF3d1RKL014MnB5aCtFeUZkdkt3c1FSZFgvTE1DQjVw?=
 =?utf-8?B?N1lBR1pmMXQxTHJneG9HOTB6MkhBVjZnVk1odURYTG40c0l2TndhS08vclF4?=
 =?utf-8?B?cW45VzlZSG5tYVZhQWdGNDhMQ3c3d29BY0taemdCa05RYUZQQWIyU0k3Q01s?=
 =?utf-8?B?R0h6amtya2RtZ1JmcGJuL1kxeGRFT3ZwMVNSbjFXdS9GNHZxK01lT01xckVv?=
 =?utf-8?B?Rk9mRm1sTGlPNmdWMDJsSWg1RTd4cTFMTkU2cE9mTHlpV1piREI1ZXRWK1ZP?=
 =?utf-8?B?dnhmM3NTSExJTS8rZ1IxRUJ1UzVMRS9nQml4U1IzakM5NDFCazRRbzFxV0lZ?=
 =?utf-8?B?ZlNjS0treDgyWStCeUwrb1gyKy9obVl5QUhCOFpHMU5LWFVvMmI5QXB3dU9G?=
 =?utf-8?B?WDYxSldjSFNnN3hpRUZSM0ZObkNpSTZoNDkweG9MKzF6NVJTRXRQQnJ3ZFg3?=
 =?utf-8?B?d3YxYmF1cHQ5WUpLMzlhMU9vWkJBZm5ZOTA1V2dzbHZNVWJKcm1ELy9aVHds?=
 =?utf-8?B?a2NISHB2RndpSTliRkw2bHNML1ByUnhkZjdVU21vR1NSaXYvbUhsV29MczBD?=
 =?utf-8?B?c21Md3pSN1E3bE5TN2FPZ2l6S1B5SVNSQ09zamFqRWh6b05XNmN1Q0dYU0dw?=
 =?utf-8?B?RzUvUFdKa01RbGFPRTArN1NyVzdMN2dGTHh2Y3dnY1c4TlpFamRLeEVIS1Ex?=
 =?utf-8?B?anVPaUIxcU5pOU80NlZKS0VYMkllc2NPUWdsdGZwK2lneFQrZ0JkQ01WRCtv?=
 =?utf-8?B?YTZjWEQremFmcUJOYyt1WXBVTldPLzI2bmVFOGp1ZS9zN1ZGWGZTRllGVzdr?=
 =?utf-8?B?clNxSHVLcDlPQ0pvMjNGbUtPS0FnRWpUNzFuY1c5MkdlMVBpZ09EeWJVOFJu?=
 =?utf-8?B?Y0NKb3ZwOHN4N3h3QWgvQlJVdWhDdHpVQ1p3ZlYvZTR5ME9DSmF0aFlFVTBu?=
 =?utf-8?B?YWlCbG15Rld3dmhwa2EwbjJuTWJobC9xYWE2Vy9NQUNHa3VsU0VSN2NWUTdy?=
 =?utf-8?B?aG9YREZKQTBFS2tXeVhRMUI4K2ZadU92V2xoa0lRdUFyei93bkhDQUxDWWFn?=
 =?utf-8?B?cThaYXVZbVZVNU9wa3dTTmdQQ2NRbWNzRXFRRGVoQzlCVkoyMWwzQlkzQ1B4?=
 =?utf-8?B?MFBOQ3M4emt5TGZxVGRxaFJzcG1FUjdoUTBibklBN2YxYVdBTndhQVFmUXA1?=
 =?utf-8?B?UkdoWXI2NG0zS0d6ZmVvV0RMdWNGVlR0QWZEVDlrcThqS3dGaGt3cnhVWkt1?=
 =?utf-8?B?RDBSU0VuZzFuazJpcC9zclFndW9xZlM3QzRQTis4dzBWQmYzbWRBVW9QekdH?=
 =?utf-8?B?QTRWT2VxQVZBa1c2UDdpRlF5WVdzS1NRYkYvRTNaYUVVd2JJWUthUkh5ek9S?=
 =?utf-8?B?S1R5b0dNUkgvYnBCT0MxRVJGVHFBUTM2M1FKSWxWN3hDRjB6WGVVUjh4ZDUr?=
 =?utf-8?B?VjZxMDVQcFpMeDR5dmlPRHhJazdCZmgzeTRvU3JGTEVDRTgyajgzTlZOZjRZ?=
 =?utf-8?B?YUhnaEF6WEpHR2hubCtSUEN2dlNRUG0wdVZzSnFieWMzMHBJSnRPQlJYamlH?=
 =?utf-8?B?ZXFrRzhEaUZNaG1xQlFHS05aV1g0MGJJU1dySHBPRTFVMXNRMGczOXhLRXZO?=
 =?utf-8?B?QWJ4QjcrbU1BRy9obFo5M1ZqZDNMZklVMnBjSlI2WUNNaStYS2NFall3bi9N?=
 =?utf-8?B?c0hTVWZkZm1CcXcyaDkzNGU2T2NHTkYzeTBhaFVTc1Z5NXZvb2lEVlRnU0NZ?=
 =?utf-8?B?aU5Ubm4wbldiOG1QSnBNMXUvUThsYUxGUHVpbWd5MEtxcmt2Um1SZ1JJZkl1?=
 =?utf-8?B?c0ZIVFVKazFyR1JoaUltUnFrOTBVTFBZRFBxV0NmelhFZ3laeXNuQjFMbFoz?=
 =?utf-8?B?WjYvWU5YVDVFMFJ4MDNHNnVaQW9BbUg1S1pMaFgrWi9KcnMrR2Rsclc2Tmkv?=
 =?utf-8?B?SURtYiszM0drZDhpdkY2Qkg3TUxWeEF4VXYvYndkQkI1Sy9na2dpWXo1WWZX?=
 =?utf-8?B?RVBYZldRT1JTSVludlBqVnB4WURySGJraGw4VGFvdDZkOWRDM0VtcFVQbWgr?=
 =?utf-8?Q?bQhGfv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHZ1Rm1IRHNWeVYvb1pJTE1RQW5hUytVdFZ3d0pmVTRDRjZ5U2crRTFXUFhZ?=
 =?utf-8?B?ME5BRDlqYjJudThNYzJiTmVQd3RZRWtzY3BhN09rNnl3YXArblNycUNqYUIx?=
 =?utf-8?B?cnJtSnY0THFmR0dWSjZacWlNTlRHM29nbkRsK0V2UTBwSnIzeGFqUlhXUTIr?=
 =?utf-8?B?eTEya25kTGxEZzhOUyt5YnBybm9CMHBSNEwvR2ZhY0xyMXg5Y0tUZjBoZXZ1?=
 =?utf-8?B?OHlmNnBkV3U5bWZ1NTRCSE94ZVFLTm9HZUxhdGtaenhDNmc1TytmTFpCUkUr?=
 =?utf-8?B?VEwzeWtIWnRybEJuODB5WGRXTnEzSHVxT2UwdlBpQ2pta1BxSGtveWRFYi9Z?=
 =?utf-8?B?MW5nSkpnREt2NGIrdkIzMTRuY21sMTMvOEVxaEM2Nnh2TFpZQVhJVHJkdGtU?=
 =?utf-8?B?RWw3eFNHOExPVnJjRElLYjNGWDEzOW43eXl4ZS8rQU1CVjB4TnladUFNMGNX?=
 =?utf-8?B?YWFveW9mL1NRZ0pJZzdRb2dTYzRXSkpYU05Fb0VMOXNyZnY2Q1p5c0NIdGRY?=
 =?utf-8?B?K1ZpOTAveERyaGhscUp3a0VJWkp3cVBCc05adWZHOGZJVWlqVU9EWmwzYTBp?=
 =?utf-8?B?MnRaSmxkSTlidWtVMWt5QXF3V09DTm04emE0WlJNdlRma25Ub3JDME9tMXNW?=
 =?utf-8?B?WG1GSVV0VWRDZGx6QldjZEU4dDBjZkNQbG1sZHpHUThqdkhHeGJMOS9DZytP?=
 =?utf-8?B?SnNQTUZUZlI5Znh5dmpxYlQzRzFRUHc0ZnRUVHcrb29MbFNSYS9YYU0wY0pV?=
 =?utf-8?B?c3paVS9mREc4T3B4ZjZlU2pNWFFEbGUwUzJYa1hCT3VsVEQ3SS9ScWtGbTZV?=
 =?utf-8?B?OEFFWE05WW5ibUlRZ0RJa2Examhxd3VaNmlPYS9kZXphUUFWdGdrT0VkaTRU?=
 =?utf-8?B?aUQ0MHJnU3lsQUo4WncyRkF3UGZMMWJITmszNFBRSURsMUFpVnVrei9sdzZG?=
 =?utf-8?B?Y3J4NG5yelBUQndwWHo5Z0UyY0VwcHdibzhNR2dDeUNsUHJHRC9LTU1zSTNH?=
 =?utf-8?B?TVo3UDd1Z0UvZEowVUJkdGVsRnBxdVNiS0RxcW9odG4rMjFIc013cmhBWnhR?=
 =?utf-8?B?alNNVFpGQjJERit1R25JRjBtZUMrVDYwd2ZqT1podC94czZRdFJHYVgvbUtq?=
 =?utf-8?B?QlRoWHNoOFFyQXlXdEpsdTRrY21xZitSUFhxMGRnK1QxV2JoU3plK25na1l3?=
 =?utf-8?B?bEJ3dFpmdTJGVVJkSm9tVW1mSGVlUG9vcTBVemNWZ0pLK1pJU3pxVnFUYXc5?=
 =?utf-8?B?dk1RRUVvVEpKK0NqN29jMnNvWWdiSE1EUURodzI5QVpvUmV2ZWRSSTF3TVZT?=
 =?utf-8?B?T0NBeHJRMGptbHhvTmVjVFFvcmhTNkVoTHZWcDR1RUdXdGozWGFwZEJuNEN4?=
 =?utf-8?B?bXNtWGlrU2FzVHJSREdYSXdzWXpVQzNGc0MwMi9MMEtCRGt1RmZ4a3RIVWpG?=
 =?utf-8?B?eExMaENFV1k5Y2NtUnRzdVFhbERGVEpFZ0EyVEJkei83TlR3ZXQvbUM3eGFG?=
 =?utf-8?B?VFJBdnZQTG52NDlHaVZjclNIY20vdHlVSzRSNHZsM3NCYTNaK2xWTkJ4SW9q?=
 =?utf-8?B?MFg5dllTc1BYZGcvbFhFSC9vR3VETTV4RmZwdDJWdmNIVElnNGtKOXRYdFBX?=
 =?utf-8?B?N2gzc0l6NXNlNWlvblhqQk4rSUtPQ1BvY1FXTXRoM253RGI1b3o3WG1Odmsv?=
 =?utf-8?B?bEFTcDdmZnFoWllsVWo0Kzc0WHZzYjYydHRyV0c5cjZPZlZBU2lpa3Y1bWw5?=
 =?utf-8?B?SDVoRmtjbHkzRVJLK1V5SzJZdFJ3b0tCSE1VSkV4bWpLcG1rTDlCM01SL09y?=
 =?utf-8?B?Y1YxS1htQWdGdnZ4ckxqQXkreUQxZlIvenlzUUR4Q2tHMVUyV015Y05vaXJi?=
 =?utf-8?B?YmZOSkJpN3g4dzJiYXdlQ0x3SUMyK0MyYk9CUlAzTXpGcmxXdWIvamJxeU1q?=
 =?utf-8?B?TVJocjk4dnRkd0ZKb1IxNjFLdEY4b2JyQTJvNTA0Wks2bU5URGYwWllxMk1R?=
 =?utf-8?B?bTluYzY1M3lpeU9yMkp0Ynl1S045V3JLcmlsT21keTh5VUpYN2NBcVRzWXR5?=
 =?utf-8?B?eWZDc1YxZFNqSTlESldWOERjdjlBMldySVBJTFZXdzY3T0VPdzJUdDZUeFEw?=
 =?utf-8?B?Tmg1dndnTG50R3NkSHliTkZFeXIvMjlqN0tKYzRsUXpTY1Nwc3pheVlrWkIx?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F1A567608FFED46BD1C3D3BB6C2D670@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687b8976-fd25-41d2-6529-08de17fa19df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 21:20:07.6347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wNbCgoUt1aoJiTYkMY6Dw3ejIAoxm68V7wzj+40lxNN9YIe0fjvKIVpGJnp2m9bg1xT/oukJ3R/teOKD205gunnFX+zHs26ViJYoctVdTTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8553
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

T24gTW9uLCAyMDI1LTEwLTIwIGF0IDIzOjEyICswMDAwLCBYaW4gV2FuZyB3cm90ZToKPiBUaGlz
IGFsbG93cyBJR1QgdG8gcXVlcnkgdGhlIGV4YWN0IElQIHZlcnNpb24gZm9yIHhlIHBsYXRmb3Jt
cy4KPiAKPiBLZXkgY2hhbmdlczoKPiAtIEFkZCB4ZV9kZXZpY2VfaXB2ZXIgZmllbGQgdG8geGVf
ZGV2aWNlIHN0cnVjdHVyZQo+IC0gc2V0IHRoZSBncmFwaGljcyB2ZXJzaW9ucyBiYXNlZCBvbiB0
aGUgR01EX0lECj4gLSBDYWNoZSBkZXZpY2UgaXB2ZXIgaW4gZ2xvYmFsIG1hcCBpbmRleGVkIGJ5
IGRldmlkIGZvciBlZmZpY2llbnQKPiBsb29rdXAKPiAtIEltcGxlbWVudCB4ZV9pcHZlcl9jYWNo
ZV9sb29rdXAoKSB0byByZXRyaWV2ZSBjYWNoZWQgaXB2ZXIgYnkgZGV2aWQKPiAtIENsZWFuIHVw
IGNhY2hlZCBkZXZpY2UgaXB2ZXIgd2hlbiB4ZV9kZXZpY2UgaXMgcmVsZWFzZWQKPiAKPiBWMjoK
PiAtIGFkZCBuZXcgc3RydWN0IHhlX2RldmljZV9pcHZlciB0byBob2xkIHRoZSBpcHZlciBpbmZv
Cj4gLSBzZXBhcmF0ZSBjYWNoZSBtYXAgdG8gZWxpbWluYXRlIGNvbGxpc2lvbiAoUm9wZXIsIE1h
dHRoZXcgRCkKPiAtIGNoYW5nZWQgZnVuY3Rpb24gbmFtZSB0byB4ZV9pcHZlcl9jYWNoZV9sb29r
dXAoKSB0byBhdm9pZAo+IMKgIGNvbmZ1c2lvbiAoUm9wZXIsIE1hdHRoZXcgRCkKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4KPiAtLS0KPiDCoGxpYi9pbnRl
bF9jaGlwc2V0LmggfMKgIDYgKysrKysKPiDCoGxpYi94ZS94ZV9xdWVyeS5jwqDCoCB8IDUzCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gwqBsaWIveGUv
eGVfcXVlcnkuaMKgwqAgfMKgIDQgKysrKwo+IMKgMyBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9jaGlwc2V0
LmggYi9saWIvaW50ZWxfY2hpcHNldC5oCj4gaW5kZXggMmY2YmY3ODhhLi4yZGQyMTQ0MTMgMTAw
NjQ0Cj4gLS0tIGEvbGliL2ludGVsX2NoaXBzZXQuaAo+ICsrKyBiL2xpYi9pbnRlbF9jaGlwc2V0
LmgKPiBAQCAtOTgsNiArOTgsMTIgQEAgc3RydWN0IGludGVsX2RldmljZV9pbmZvIHsKPiDCoMKg
wqDCoMKgwqDCoMKgY29uc3QgY2hhciAqY29kZW5hbWU7Cj4gwqB9Owo+IMKgCj4gK3N0cnVjdCB4
ZV9kZXZpY2VfaXB2ZXIgewo+ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90IGRldmlkOwo+ICvCoMKg
wqDCoMKgwqDCoHVpbnQxNl90IGdyYXBoaWNzX3ZlcjsKPiArwqDCoMKgwqDCoMKgwqB1aW50MTZf
dCBncmFwaGljc19yZWw7Cj4gK307Cj4gKwo+IMKgY29uc3Qgc3RydWN0IGludGVsX2RldmljZV9p
bmZvICppbnRlbF9nZXRfZGV2aWNlX2luZm8odWludDE2X3QKPiBkZXZpZCkgX19hdHRyaWJ1dGVf
XygocHVyZSkpOwo+IMKgCj4gwqBjb25zdCBzdHJ1Y3QgaW50ZWxfY21kc19pbmZvICppbnRlbF9n
ZXRfY21kc19pbmZvKHVpbnQxNl90IGRldmlkKQo+IF9fYXR0cmlidXRlX18oKHB1cmUpKTsKPiBk
aWZmIC0tZ2l0IGEvbGliL3hlL3hlX3F1ZXJ5LmMgYi9saWIveGUveGVfcXVlcnkuYwo+IGluZGV4
IGE4OWUwYjk4MC4uNWQ4YWNjZDQ3IDEwMDY0NAo+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5jCj4g
KysrIGIvbGliL3hlL3hlX3F1ZXJ5LmMKPiBAQCAtMzE5LDYgKzMxOSwyMiBAQCBzdGF0aWMgc3Ry
dWN0IHhlX2RldmljZV9jYWNoZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpZ3RfbWFwICpt
YXA7Cj4gwqB9IGNhY2hlOwo+IMKgCj4gK3N0YXRpYyBzdHJ1Y3QgeGVfaXB2ZXJfY2FjaGUgewo+
ICvCoMKgwqDCoMKgwqDCoHB0aHJlYWRfbXV0ZXhfdCBtdXRleDsKPiArwqDCoMKgwqDCoMKgwqBz
dHJ1Y3QgaWd0X21hcCAqbWFwOwo+ICt9IHhlX2lwdmVyOwo+ICsKPiArc3RydWN0IHhlX2Rldmlj
ZV9pcHZlciAqeGVfaXB2ZXJfY2FjaGVfbG9va3VwKHVpbnQzMl90IGRldmlkKQo+ICt7Cj4gK8Kg
wqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZV9pcHZlciAqaXB2ZXI7Cj4gKwo+ICvCoMKgwqDC
oMKgwqDCoHB0aHJlYWRfbXV0ZXhfbG9jaygmeGVfaXB2ZXIubXV0ZXgpOwo+ICvCoMKgwqDCoMKg
wqDCoGlwdmVyID0gaWd0X21hcF9zZWFyY2goeGVfaXB2ZXIubWFwLCAmZGV2aWQpOwo+ICvCoMKg
wqDCoMKgwqDCoHB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZ4ZV9pcHZlci5tdXRleCk7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoHJldHVybiBpcHZlcjsKPiArfQo+ICsKPiDCoHN0YXRpYyBzdHJ1Y3QgeGVf
ZGV2aWNlICpmaW5kX2luX2NhY2hlX3VubG9ja2VkKGludCBmZCkKPiDCoHsKPiDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIGlndF9tYXBfc2VhcmNoKGNhY2hlLm1hcCwgJmZkKTsKPiBAQCAtMzc5LDYg
KzM5NSwyMyBAQCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBmZCkKPiDCoMKg
wqDCoMKgwqDCoMKgZm9yIChpbnQgZ3QgPSAwOyBndCA8IHhlX2Rldi0+Z3RfbGlzdC0+bnVtX2d0
OyBndCsrKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2LT5ndF9tYXNr
IHw9ICgxdWxsIDw8IHhlX2Rldi0+Z3RfbGlzdC0KPiA+Z3RfbGlzdFtndF0uZ3RfaWQpOwo+IMKg
Cj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAqIFNldCBncmFwaGljc192ZXIg
YW5kIGdyYXBoaWNzX3JlbCBiYXNlZCBvbiB0aGUgbWFpbiBHVCdzCj4gR01EX0lELgo+ICvCoMKg
wqDCoMKgwqDCoCogV2Ugc2hvdWxkIHVzZSB0aGUgaGFyZGNvZGVkIHZhbHVlIGZvciB0aGUgbm9u
ZSBHTURfSUQKCi9zL25vbmUgL25vbi0vCgo+IHBsYXRmb3JtcyAoaXBfdmVyX21ham9yID09IDAp
Cj4gK8KgwqDCoMKgwqDCoMKgKi8KPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXYtPmlwdmVyLmRldmlk
ID0gMDsKPiArwqDCoMKgwqDCoMKgwqBmb3IgKGludCBndCA9IDA7IGd0IDwgeGVfZGV2LT5ndF9s
aXN0LT5udW1fZ3Q7IGd0KyspCgpQbGVhc2UgYWRkIGJyYWNrZXRzIGhlcmUuIE90aGVyd2lzZSBp
dCdzIHRvbyBlYXN5IHRvIGFkZCBleHRyYSBjb2RlCmJlbG93IHRoZSBpZigpIHt9IHdoaWNoIHdv
dWxkIHRoZW4gYmUgb3V0IG9mIHNjb3BlLCBzbzoKZm9yICgpIHsKICAgIGlmICgpIHsKICAgICAg
ICAgLyogbXVsdGktbGluZSBjb2RlICovCiAgICB9Cn0KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGlmICh4ZV9kZXYtPmd0X2xpc3QtPmd0X2xpc3RbZ3RdLnR5cGUgPT0KPiBEUk1f
WEVfUVVFUllfR1RfVFlQRV9NQUlOICYmCgpXZSB0YWxrZWQgb2ZmbGluZSBhYm91dCBob3cgd2Ug
bWlnaHQgYmUgbW92aW5nIHRvIGFuIEZELWJhc2VkIGFwcHJvYWNoCmhlcmUgcmF0aGVyIHRoYW4g
YSBHTUQgSUQgYmFzZWQgYXBwcm9hY2ggZm9yIHBsYXRmb3JtIHN1cHBvcnQgb2YKZmVhdHVyZXMu
IE90aGVyd2lzZSBJJ2QgcmVjb21tZW5kIGRvaW5nIHRoaXMgYWNyb3NzIGFsbCBvZiB0aGUgR1Rz
LgoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2Rldi0+Z3RfbGlz
dC0+Z3RfbGlzdFtndF0uaXBfdmVyX21ham9yKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfZGVidWcoIlNldHRpbmcgZ3JhcGhpY3NfdmVyIHRv
ICV1IGFuZAo+IGdyYXBoaWNzX3JlbCB0byAldVxuIiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9kZXYtPmd0X2xp
c3QtCj4gPmd0X2xpc3RbZ3RdLmlwX3Zlcl9tYWpvciwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9kZXYtPmd0X2xp
c3QtCj4gPmd0X2xpc3RbZ3RdLmlwX3Zlcl9taW5vcik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kZXYtPmlwdmVyLmdyYXBoaWNzX3ZlciA9IHhl
X2Rldi0+Z3RfbGlzdC0KPiA+Z3RfbGlzdFtndF0uaXBfdmVyX21ham9yOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2LT5pcHZlci5ncmFwaGlj
c19yZWwgPSB4ZV9kZXYtPmd0X2xpc3QtCj4gPmd0X2xpc3RbZ3RdLmlwX3Zlcl9taW5vcjsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Rldi0+aXB2
ZXIuZGV2aWQgPSB4ZV9kZXYtPmRldl9pZDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAvKiBUaWxlIElEcyBtYXkgYmUgbm9uLWNvbnNlY3V0
aXZlOyBrZWVwIGEgbWFzayBvZiB2YWxpZCBJRHMKPiAqLwo+IMKgwqDCoMKgwqDCoMKgwqBmb3Ig
KGludCBndCA9IDA7IGd0IDwgeGVfZGV2LT5ndF9saXN0LT5udW1fZ3Q7IGd0KyspCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9kZXYtPnRpbGVfbWFzayB8PSAoMXVsbCA8PCB4
ZV9kZXYtPmd0X2xpc3QtCj4gPmd0X2xpc3RbZ3RdLnRpbGVfaWQpOwo+IEBAIC00MTMsNiArNDQ2
LDExIEBAIHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldmljZV9nZXQoaW50IGZkKQo+IMKgwqDCoMKg
wqDCoMKgwqBwcmV2ID0gZmluZF9pbl9jYWNoZV91bmxvY2tlZChmZCk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGlmICghcHJldikgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X21h
cF9pbnNlcnQoY2FjaGUubWFwLCAmeGVfZGV2LT5mZCwgeGVfZGV2KTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX2Rldi0+aXB2ZXIuZGV2aWQpIHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB0aHJlYWRfbXV0ZXhfbG9jaygm
eGVfaXB2ZXIubXV0ZXgpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWd0X21hcF9pbnNlcnQoeGVfaXB2ZXIubWFwLCAmeGVfZGV2LQo+ID5pcHZlci5k
ZXZpZCwgJnhlX2Rldi0+aXB2ZXIpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcHRocmVhZF9tdXRleF91bmxvY2soJnhlX2lwdmVyLm11dGV4KTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+IMKgwqDCoMKgwqDCoMKgwqB9IGVsc2Ug
ewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX2ZyZWUoeGVfZGV2
KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2RldiA9IHByZXY7Cj4gQEAg
LTQyNCw3ICs0NjIsMTUgQEAgc3RydWN0IHhlX2RldmljZSAqeGVfZGV2aWNlX2dldChpbnQgZmQp
Cj4gwqAKPiDCoHN0YXRpYyB2b2lkIGRlbGV0ZV9pbl9jYWNoZShzdHJ1Y3QgaWd0X21hcF9lbnRy
eSAqZW50cnkpCj4gwqB7Cj4gLcKgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX2ZyZWUoKHN0cnVjdCB4
ZV9kZXZpY2UgKillbnRyeS0+ZGF0YSk7Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2Rldmlj
ZSAqeGVfZGV2ID0gKHN0cnVjdCB4ZV9kZXZpY2UgKillbnRyeS0+ZGF0YTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgaWYgKHhlX2Rldi0+aXB2ZXIuZGV2aWQpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHRocmVhZF9tdXRleF9sb2NrKCZ4ZV9pcHZlci5tdXRleCk7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9tYXBfcmVtb3ZlKHhlX2lwdmVyLm1hcCwgJnhl
X2Rldi0+aXB2ZXIuZGV2aWQsCj4gTlVMTCk7CgpJIGZlZWwgbGlrZSB0aGlzIHNob3VsZCBiZSBk
b25lIGluIHRoZSBvdXRlciBsYXllciwgeGVfZGV2aWNlX3B1dCgpLApyYXRoZXIgdGhhbiBoZXJl
LiBTbyB4ZV9kZXZpY2VfcHV0KCkgYmVjb21lczoKaWYgKGZpbmRfaW5fY2FjaGVfdW5sb2NrZWQo
ZmQpKSB7CiAgICBpZ3RfbWFwX3JlbW92ZShjYWNoZS5tYXAsICZmZCwgZGVsZXRlX2luX2NhY2hl
KTsKICAgIGlndF9tYXBfcmVtb3ZlKGNhY2hlLm1hcCwgJnhlX2Rldi0+aXB2ZXIuZGV2aWQsIE5V
TEwpOwp9CgpUaGlzIGFsc28gZm9sbG93cyB0aGUgb3RoZXIgaW5pdC9hbGxvYyBsb2NhdGlvbnMg
d2hlcmUgd2UgdG91Y2gKeGVfaXB2ZXIubWFwLgoKVGhhbmtzLApTdHVhcnQKCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZ4ZV9pcHZlci5tdXRl
eCk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXZpY2VfZnJl
ZSh4ZV9kZXYpOwo+IMKgfQo+IMKgCj4gwqAvKioKPiBAQCAtNDc0LDEzICs1MjAsMTggQEAgc3Rh
dGljIHZvaWQgeGVfZGV2aWNlX2Rlc3Ryb3lfY2FjaGUodm9pZCkKPiDCoMKgwqDCoMKgwqDCoMKg
cHRocmVhZF9tdXRleF9sb2NrKCZjYWNoZS5jYWNoZV9tdXRleCk7Cj4gwqDCoMKgwqDCoMKgwqDC
oGlndF9tYXBfZGVzdHJveShjYWNoZS5tYXAsIGRlbGV0ZV9pbl9jYWNoZSk7Cj4gwqDCoMKgwqDC
oMKgwqDCoHB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZjYWNoZS5jYWNoZV9tdXRleCk7Cj4gK8KgwqDC
oMKgwqDCoMKgcHRocmVhZF9tdXRleF9sb2NrKCZ4ZV9pcHZlci5tdXRleCk7Cj4gK8KgwqDCoMKg
wqDCoMKgaWd0X21hcF9kZXN0cm95KHhlX2lwdmVyLm1hcCwgTlVMTCk7Cj4gK8KgwqDCoMKgwqDC
oMKgcHRocmVhZF9tdXRleF91bmxvY2soJnhlX2lwdmVyLm11dGV4KTsKPiDCoH0KPiDCoAo+IMKg
c3RhdGljIHZvaWQgeGVfZGV2aWNlX2NhY2hlX2luaXQodm9pZCkKPiDCoHsKPiDCoMKgwqDCoMKg
wqDCoMKgcHRocmVhZF9tdXRleF9pbml0KCZjYWNoZS5jYWNoZV9tdXRleCwgTlVMTCk7Cj4gK8Kg
wqDCoMKgwqDCoMKgcHRocmVhZF9tdXRleF9pbml0KCZ4ZV9pcHZlci5tdXRleCwgTlVMTCk7Cj4g
wqDCoMKgwqDCoMKgwqDCoHhlX2RldmljZV9kZXN0cm95X2NhY2hlKCk7Cj4gwqDCoMKgwqDCoMKg
wqDCoGNhY2hlLm1hcCA9IGlndF9tYXBfY3JlYXRlKGlndF9tYXBfaGFzaF8zMiwKPiBpZ3RfbWFw
X2VxdWFsXzMyKTsKPiArwqDCoMKgwqDCoMKgwqB4ZV9pcHZlci5tYXAgPSBpZ3RfbWFwX2NyZWF0
ZShpZ3RfbWFwX2hhc2hfMzIsCj4gaWd0X21hcF9lcXVhbF8zMik7Cj4gwqB9Cj4gwqAKPiDCoCNk
ZWZpbmUgeGVfZGV2X0ZOKF9OQU1FLCBfRklFTEQsIF9UWVBFKSBcCj4gZGlmZiAtLWdpdCBhL2xp
Yi94ZS94ZV9xdWVyeS5oIGIvbGliL3hlL3hlX3F1ZXJ5LmgKPiBpbmRleCA3MTViNjRlMmYuLjRl
OGJhMDM3MiAxMDA2NDQKPiAtLS0gYS9saWIveGUveGVfcXVlcnkuaAo+ICsrKyBiL2xpYi94ZS94
ZV9xdWVyeS5oCj4gQEAgLTc0LDYgKzc0LDkgQEAgc3RydWN0IHhlX2RldmljZSB7Cj4gwqAKPiDC
oMKgwqDCoMKgwqDCoMKgLyoqIEBkZXZfaWQ6IERldmljZSBpZCBvZiB4ZSBkZXZpY2UgKi8KPiDC
oMKgwqDCoMKgwqDCoMKgdWludDE2X3QgZGV2X2lkOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAvKiog
QGlwdmVyOiBEZXZpY2UgaXAgdmVyc2lvbiAqLwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9k
ZXZpY2VfaXB2ZXIgaXB2ZXI7Cj4gwqB9Owo+IMKgCj4gwqAjZGVmaW5lIHhlX2Zvcl9lYWNoX2Vu
Z2luZShfX2ZkLCBfX2h3ZSkgXAo+IEBAIC0xNDAsNiArMTQzLDcgQEAgaW50IHhlX3F1ZXJ5X3B4
cF9zdGF0dXMoaW50IGZkKTsKPiDCoGludCB4ZV93YWl0X2Zvcl9weHBfaW5pdChpbnQgZmQpOwo+
IMKgCj4gwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfZ2V0KGludCBmZCk7Cj4gK3N0cnVj
dCB4ZV9kZXZpY2VfaXB2ZXIgKnhlX2lwdmVyX2NhY2hlX2xvb2t1cCh1aW50MzJfdCBkZXZpZCk7
Cj4gwqB2b2lkIHhlX2RldmljZV9wdXQoaW50IGZkKTsKPiDCoAo+IMKgI2VuZGlmwqAvKiBYRV9R
VUVSWV9IICovCgo=
