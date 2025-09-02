Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A87BCA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 19:06:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2910E81E;
	Tue,  2 Sep 2025 19:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkfwJQej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7548B10E81E
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 19:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756839979; x=1788375979;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jGLRv8fzKcezrXH29bM4yc4NumphiIsRUKEjfik7RvA=;
 b=WkfwJQej4u1ruRo+x5osMwO87UatDGCyQsQgAvY+fPqbuvOXZxnziqf0
 AllFZESg/DIg0OCJIr9Z/vVVNtyDOdRqfI53JmAWUBfHWo1PWKpoMf+3f
 QbOARx2WC8gOZsVAZKoe2+eXlk5BE3NXwKkjy+x5l3sjWvus5Z3Ufewf7
 HIT8YRPBXpbGj2mP9jKikQRSeYNU4NO6xIcrUlVhezSUh9ffiTmCaLKYg
 zXx5IwgXJ+pmNddFAWVVGordcSAwt8pZCEWfD456OSsLwiQlxuzHEGZnS
 pvdV1o8igtJ9IJWH5rzuDzLXdqotnJUOlEwMjM1ArgUli3AqDXNXSjyxO A==;
X-CSE-ConnectionGUID: qIOGiHyfSjqH0wHkc+xPVw==
X-CSE-MsgGUID: LgS1WqWTSTO6ejnD0HwLQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70508342"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70508342"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:06:18 -0700
X-CSE-ConnectionGUID: XVoAffjtRgC2wvQKyZv40w==
X-CSE-MsgGUID: RRF0L7TlQ7G+/xDiBsw5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="170923193"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 12:06:18 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:06:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 12:06:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 12:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ik0IHJKjgRpNSyeIEP3Ed5xkM8A7fx6x6oFeLSCEbvS1PqqxqWTNKY78+JZe3CSA8Vfs2XPjZpM7jHVR5afUPgjh5PBX9Nk0EZAb5X3B8ytS/kTJCa4qFYAssGHzvNYRl6YArneH0wTRE4s3zxnPkQ6iubD18J+ERlbFCg7BtP72DUpYLtRyicj8n39xmCkQJlXd5qvxjIRcAM3+iZmN1qGsmbb4rG2OKAcILW7l++dDSsxdIXx1Bz7RXcVIWEvKfP6Pfj8UjY1hNzoVOum8sMFVeN6QHW7s0wyZ4VaV/Z3X1L7gpe9vOy+mQUOMdu6Idrz7tRqHrXU6Tru+QR+HEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xUtdG0y3hjLLoeblF8+TkQkH7/bXWonokuJETHHWxw=;
 b=uiKlV+Xial+y64rnqD1YgfN8fPKLqMxgFvZjVPEcZ+mnQkN77rAx16cltllvuC5HmZU05Cqa/2gy03OVN7zSTOh/Ho8FbzEopK0lr074sD5HUh7kX+qyDk/EjKI6OdROqaHhwDq4inLm/aEPGgU8lR0OGm1ag+2hHaizmB9jTFfYj7WjG8nJEZUIpZYLMPhtI1Sc3rXvWTMU230FCoAAKsJksfOQ0XkpPJqJ+vw3N93e2iKnIYM5rPWbxjLNcHtrSOXufIwci4UOkqALAeR7eD1o0UCE70Pv926Duu7OFYQ5lO8vNNP7+9fxCLA8JVV1zU7l5zgbL7lQ8RV5tVE9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Tue, 2 Sep
 2025 19:06:13 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 19:06:13 +0000
Message-ID: <e782b59a-0ce1-4a5a-b7fe-ddc440e9c23d@intel.com>
Date: Wed, 3 Sep 2025 00:36:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_kms: Add helper to measure vblank
 sequence difference
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250818214431.1331399-1-ramanaidu.naladala@intel.com>
 <20250818214431.1331399-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
CC: <mitulkumar.ajitkumar.golani@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250818214431.1331399-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: d52916b3-6c5a-4f59-aa2a-08ddea53c902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUcvbGZWbm5jOGgwUnNzVUZlMlcvSFdwZGxUdGZqQjN3VkI3RHRVYzV5WW95?=
 =?utf-8?B?Zmp6R3czeXFJTVVoUGY2cEsyZDZNYUtiSmRUV0czcU55K3ZIQ3FwdW1MYXdG?=
 =?utf-8?B?N0JucVdIMWplM2l4WnRaNXlWdEkwUUFObDlvUDdDS2p6U0lmc1BZbHFTNWZ2?=
 =?utf-8?B?djJjaWg5aVBQYVQ2ZVk2V3N0dXFiYnBCMFFaU29MdC96Q0FnQjJsNFNITWI4?=
 =?utf-8?B?S210V0ZWQXh5MzJnOE8xY0VhMUtKWnpLQk9nNHlWemRVYjl1eGpOY0JHWC9T?=
 =?utf-8?B?NmZKWURQZHZWTTYzRnVqNjUzQnRtbkE3dWhPSk9XK1lvQjdobllGaS8vT2ZE?=
 =?utf-8?B?NkpUYmlCZzBPZTdmMkJ5OUo2V3pyYUpxMVhOZkh6Rjc2OG9Dd2ZCeUlOK1dI?=
 =?utf-8?B?dk9MZHYwV09LaHNMYkNhS3hPeXdOcEJrSkUwVVFCYTZXRTdjYml3TXVQQUhU?=
 =?utf-8?B?Z0hQVnVEeFE4bmhGc3poTDRUbVluOGRtV2pWcG1GcXpsOUMwTzRnSE52WVJU?=
 =?utf-8?B?UUtaem5GamZ5WXRvM0h3SEp2ZFhRVnZ4OEhlajFUMGVnOFNtZXNhem1jd0Zs?=
 =?utf-8?B?K1p5aExZZmFmaEExSWR1WmZXc2pEcktGMmJnSUZ4bmdPVm8wd3BuQUhXM1R4?=
 =?utf-8?B?MEgyL2JXSFBrek4yY3Z4MTkwOUwwcUhJbU1iaWJSMWlKWEx5N1NVd1RoWnNM?=
 =?utf-8?B?ank2ZGxHRzI5TFNaK040K0dkbHROY2FWeklFVHZydjBlZWsxeGpDcjIzNUJE?=
 =?utf-8?B?djJ5VDdZVlZkNUxRRlNJY1hNV29HTXIzZEpxN0Jmeis0Zk5veWRQb2Z3d0Ey?=
 =?utf-8?B?ckpwL2FLdzZqN0tDbmc1cFE2bGovcFdmQTU5LzhHZ0MvTGs3NlNOSDlkY0pq?=
 =?utf-8?B?Ym5wOXVYNkluanpqVVFuRzdQODlYaUJwanQ0ejZ1Um5EUVRtYTFDQmtubHc4?=
 =?utf-8?B?d0JPd1F3b0lQUm1YOU8xOTlXa2U0Y05ZbnNFY0VUVXQ3Y0R3bUtYMjh0SEhJ?=
 =?utf-8?B?SnlrYVNERzdzeTRZa1hvd0VQRUFORENXUjdlR0Ewc3kyeUdtSVZTVmExbEdD?=
 =?utf-8?B?aFV5UVRvRW9TTW9uS2YyTUxsZC9nRjFwYlJZMTJqbnI3bmFYMS9SVkdQSGtv?=
 =?utf-8?B?SHNqWDVUdTBTV0krZUVPeUJPM3AyeDFacytGcXZTYVRTKy9UV2k1WjZLc3g3?=
 =?utf-8?B?ZHBXbDMvTmNrSFdvMm11UTRVYjlnTEM3RVJyUVhLV1RqTU90aDFJQkZEdU5D?=
 =?utf-8?B?MGRrMC9nNE0wMEtmUFFia0tCd2hJYi9rOU1ISGFTbzBZZ09XRjJNRzFsMk9r?=
 =?utf-8?B?QWU4L2FDS3h4cDhieDhUeGRreCtuOE5vbEhnRVRORjVrLzF6YXVRRy9UZHI0?=
 =?utf-8?B?Q2JMbURabC8wQUR5UFRRVEoyNjhrTXhzRCtPYnFpSmsxRWxxR2dRYlRVU1JU?=
 =?utf-8?B?UDdzZTcxUEZWQVIwaGtLKysvaHF3aUV6UEtLV1RMUU1xNHhZdEdvYVBGSzdo?=
 =?utf-8?B?c1NvemtnMzU3WDJqcmdVM3FKcnlHMHRkWnBUa0trVitBb0xoNXRYU01GOEVD?=
 =?utf-8?B?UWlTVEtmb3NPUW56Sng5ak1obFd2ckFrNTNSN21FcW9qUW84Y1JmRGNwWlBp?=
 =?utf-8?B?M1hKYjNpUG1IMER4dVJ6QnRLMElZSkI0Q0FIL0ZhcjlBbnNoQWpGVUVyTHJ5?=
 =?utf-8?B?VGNoMTNkMXJ4bFJzRWNYaWlHcllnRDQwZXF3MHFqNDBiTm1wWDNNYjJ5a0x2?=
 =?utf-8?B?b3hBbjZIeUdxdklUM0EyTnJyQllkYXFzLzVXamVyelk4VnZjalhOMUNwYTkx?=
 =?utf-8?B?VEVveFcrT0JBYzd5ejQzb1M5ZWgzMXpVZmp4emJMd0N2cC9ZOGhjZ04vZWZB?=
 =?utf-8?B?aUQ0eWlKaEdXSTJaZW5kVmx1Uk5wdnlHOUdhMGxvZ1lQWG05aHRaYjJvZGFK?=
 =?utf-8?Q?s/nmrVs+kVY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NExTb2NqUndQUVJYMDlGNlppdTBraFBDbjdML3BMMWpFU0V0TmNja1RXTFlB?=
 =?utf-8?B?UTRQdEkwS3QrNEdqZ3hKTk1ud0laZEVNYVpjMDY5bTN4dyttU290N1RRbWVQ?=
 =?utf-8?B?RjdCUTdsRXBnM0J1d0FqQzJINklvV2NrOFlYS2xrRklRUkpMbkp4ZnltUHc2?=
 =?utf-8?B?Zy9rMTRGQ1ppRGVteUtJUXJFd29LN1dHZWM3MTFqV1FwaTZ5SzdOOTBnSGYy?=
 =?utf-8?B?Zm9HN2NWdXc1YnQ3UDdIZGx3RkZkRHVTMGVLeTUwdzJXbUN1c0J4by9kcHF6?=
 =?utf-8?B?OFZPREJKV2R2S0JlWXI3VnZ2WDJVVWJLbmVQWUpMbGl5U1h0RGZCcFplSUdo?=
 =?utf-8?B?ekkzWGoxYWhzM0FaZ2xrVm9vYWhoMHJ5RXN4Ri9oOGZWKytiOTlXYUVTNUxp?=
 =?utf-8?B?N2MvV2wreG9ZN3dSY29ac3ZzSkZ1L2c5d3luL0JlRjROSWFmdC9UUS9EZTJn?=
 =?utf-8?B?N01udWJPM0tuYktlSE9XZ1dZakVjTjc2THNTNENmL0FJdlJQRnNpbHYrZDQy?=
 =?utf-8?B?aFFIcDRINWJjeHBlL01DR3NYbjFyc2cwaVhYL1ZkK2x4Rjljc0tZS202cWdt?=
 =?utf-8?B?N1ZGTC9VQXVNd3ZSTzlnNmtLVStnblhMQldLcVBYdWZLdHorZG02TDBRRStm?=
 =?utf-8?B?WE5tYjZaNHB2dHdtUXlQZFhNZjlUVkY2KzkvRno3L3ZxMXVIZStpNjd5NzJU?=
 =?utf-8?B?UUk0WHg1MnJ1ZjBSeCtreC9iWEgxeWNVZ2lVV3lQb0lPMjVaUG84QlY4dVNn?=
 =?utf-8?B?WXJoNkN1d0FyODJxUGhFS0crdm9NanlyblhzL0dtUklQR2ltVWtwUXJOUDZU?=
 =?utf-8?B?ejJaVlNHWCszcmtScXMxZjVoTzA5VGdJbTBjMjAzNVRHRkx4SVZzNzB5c0E3?=
 =?utf-8?B?MEpNYkRyUlZGTVpVZUVsQmxLYUxPQmJxVGVZdVFUUVJJbEtnaThFYU1KMXlR?=
 =?utf-8?B?VC9LaUNjWUdDVWJQazdMZ0YwcWhRUlEreWc5SW1DZ1pWVnBOVUFYd0VDQlI0?=
 =?utf-8?B?TE12YzJlZWFBQ0Q1UU01cUJjbkFOSUlJOHBxWHFVV0ErdmpaK1pjVlJDRWI2?=
 =?utf-8?B?QTV6OElYbVZnUmhmWVg3am1waHhMWG1Lejk5ejQ0TXNkektZWGtaRVFVRlB0?=
 =?utf-8?B?dkVvaytFRWE0b1YvV3ZOcEYrdWtDT212bG41NDJhb3NZci82SnAwM3d3eVBL?=
 =?utf-8?B?UEh4Uy9maTlSRC9EVTlhMHZuWFBFNDIrMEZUYy94d3h3QThzbGlOdnRYRXQz?=
 =?utf-8?B?ZE5vV3Z0emdkRjk1V2lFVFU4a3pvR3h3em0xTkwvZ1B1bi8vVDBKeWJRYjBD?=
 =?utf-8?B?Q2JFbHZHb3cvL0ZndFpDdi8xTTludStYdGtXakRJS0MzckxPRktIOGVYbXNu?=
 =?utf-8?B?b0dBNllQVXZJaTEyT2dtVlovR09uUFkvOVEva2d3dFR1aWJYeUU0dThOSEU5?=
 =?utf-8?B?L3gxQll4NjgrOEJpTXJSbzF4Yi9KMFJmaldhYmdHeWhocDlpVWRIeUdmMElv?=
 =?utf-8?B?dXpKOXEvd1J2S2V4eGRIbUlYTWh4eGM3ZldoZG5MdVBWYm5JZHZFaVhoWk9C?=
 =?utf-8?B?MW5kQWc5c1hSYU42ZWx5NVdXNGVGQzZSVTU0LzVDczNQNmNOS01JdlJGYmNX?=
 =?utf-8?B?RWNNclEzYUtMMk5KZDdlN3ZxNmx4YlFpYzNxVUQzcVlDdjRKdlh0ZjZIQktk?=
 =?utf-8?B?TkljcUViNWh0bXY1RHRIV2RSdUlpL2tjZTl5SFF6dDVKc1NIRHowbWt3T3dI?=
 =?utf-8?B?SHlqWU1pU3Y2Z0tGczAvN1dKdGxQRERQQzRvR0Y0MVliVmgySDRTSnFIZzgz?=
 =?utf-8?B?T2Y4S2tQS3cybEhzUTVnZEtyVU5pUnROOHZBSXY4cGZwb243RVd1N29zeU5H?=
 =?utf-8?B?MklZcWQwQVFnNkV6MGdhUDBGYXdreG54ei95TGc3WjlVOTFQekJZVTFxSm0w?=
 =?utf-8?B?UHFpdkJzeFIwck5scWc2Z2txNExEQ01nekhONmhSWWRRYVRvT0UrOG1MM0Yv?=
 =?utf-8?B?WW10Y2xLTUliZTliNllZa3hKZkp6VGdpTEhQMkFlc3d1U0wyRlpwQyt4S00z?=
 =?utf-8?B?WlV5OGJpM2xwdlA2Wk9zdzVybnA5eXVuOExoVStFVE5PbElxV0ROT2VmZWhN?=
 =?utf-8?B?Wk13NkhaQ2RKN29PN2E0TEZac1lvZFVESk1RZFBVcmRlblBneFlSSUpPWUZV?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52916b3-6c5a-4f59-aa2a-08ddea53c902
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 19:06:13.5483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b2+b+5pESv24fzjtEfSRqXed3pGHV+TOa3+4qfUSqLewpnMNe4wAGsHzCO5FyFmg+wACLxC+cQ1Vh/foIjwQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
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

Hi Ramanaidu,

Please find review comments below.

On 19-08-2025 03:14 am, Naladala Ramanaidu wrote:
> Add a new helper to calculate the number of vblank intervals
Shouldn't this be " Add a helper to measure how many vblank sequence 
increments occur during a single |igt_wait_for_vblank()| interval"
> between two consecutive events. This enhancement enables more precise timing and synchronization measurements in simulation
> environments.
You can also add mostly expected to be |1|, but can be larger in 
simulation env.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_kms.c | 21 +++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 22 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7191bf92e..1dfe70637 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2355,6 +2355,27 @@ static inline uint32_t pipe_select(int pipe)
>   		return 0;
>   }
>   
> +/**
> + * get_vblank_seq_diff:
> + * @fd: Opened drm file descriptor
> + * @pipe: Display pipe
> + *
> + * Measures the difference in vblank sequence numbers between
> + * two consecutive vblank events.
Measure how many vblank sequence increments occur during a single 
|igt_wait_for_vblank()| interval
> + *
> + * Returns the number of vblank sequence numbers are elapsed.
This could be rephrased as "Returns the number of vblank sequence 
increments elapsed.”
> + */
> +unsigned int get_vblank_seq_diff(int fd, enum pipe pipe)
Function name |get_vblank_seq_diff()| is a bit too generic. Since this 
is an IGT helper, prefix with |kmstest_ |to follow naming convention.
Also, since this helper returns a difference of two |uint32_t| sequence 
numbers, returning |uint32_t| can be considered instead of |unsigned 
int| for consistency?
> +{
> +	uint32_t vblank_start, vblank_end;
> +
> +	vblank_start = kmstest_get_vblank(fd, pipe, 0);
> +	igt_wait_for_vblank(fd, pipe);
> +	vblank_end = kmstest_get_vblank(fd, pipe, 0);
> +
> +	return vblank_end - vblank_start;
> +}
> +
>   /**
>    * kmstest_get_vblank:
>    * @fd: Opened drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f140ad91a..01d1b8061 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
>   void kmstest_wait_for_pageflip(int fd);
>   void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
>   unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
> +unsigned int get_vblank_seq_diff(int fd, enum pipe pipe);
>   
>   bool kms_has_vblank(int fd);
>   

