Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E330D3B7E7
	for <igt-dev@archiver.kernel.org>; Mon,  8 Dec 2025 13:46:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB6010E158;
	Mon,  8 Dec 2025 13:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkjAPOQ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B8510E455
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Dec 2025 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765201595; x=1796737595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/P6bSNPlsLiTLaMF48ce25lmt24lSeLWehZ9sf1KoUw=;
 b=bkjAPOQ49nJBFffbHqdWkK8owEHXjwD9ovKVmL010DGSR2GuFXc9sNa/
 AP9mi8GZlfzSBAAXbVMT6kZg0dKE/o2Iv+26YfMwUyDZXO0E8rflEj1KT
 PgzvpPRcbhXLb4/CUmt8kd7VdB1rJMVbm8Z43bAd6CQ6XQYUjg3qzZM81
 zf38pcq20VLoOIR0R3jYfPPPGZUtv+FB5YCENWruvEATtZzkfHdVCAxl6
 DegIDILtrCF8Hn/seR48AuCMnzywt75Rt5RWWJYEDMdudlpvv7PZw+GLo
 MORe98kvpLldqjPUsffenk/aCJF9mmwfJ7DvfUTOYlO/ggoKV/jH4MboH A==;
X-CSE-ConnectionGUID: QOgCXpdyRE22JhP5UnN3qg==
X-CSE-MsgGUID: TwkBdJYwQey8y85hPgJ6yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84548040"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="84548040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:46:34 -0800
X-CSE-ConnectionGUID: CmIGLDw+RUqPxcJqyltgtg==
X-CSE-MsgGUID: KfuM/Wa/TwGOGZ+RyCbpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; d="scan'208";a="200106274"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 05:46:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:46:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 05:46:32 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 05:46:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLTN0y+naLHwhy0lt0TxnVSR+MhwoYe5VrebwCR8trAYYXuS9rY+4KmNfwfxpgr4ns8oY1foaC/y9P1rTzBnvue54uTiCbKetGiI0KS4VcYQUrIbXrwgntl02e6yF/oH9oJgJnRhR88eSgtos9l0eTjCF+EN9ljzj/AO19o91nUULkGlTIP/F4/m297R6M/Rq2H3BUlL3f7vFc+MBKLrZXbWKPh7L7CJwmtaglyBYpoS+z8ifadQWCfMqCsZVQsk+wmvpoepy3KLz++LKpuDjtjTNXBNRDDj6cGizvFAcqqCZPbIUc7miTB+Mp7MAagr/fVi6puSsA6v9XJwXqwJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gegpPT/4lfD1KPfSDB3P35e9CnClxzZn8gMj7B/qRZs=;
 b=do1RZ9Hxd0zSey//kBOJtGi25OGuDWAIf5RhztVu3wFsoDrvG5tsC+lnyHU42oZ3Imlo01eEST2lcR/QDth0LfFSb8zjlaGyLqu7sXkobqp1jRPWxL2eBHXve2CamFSd+XzkH8xKTTmXEOkOct/kTm1HyNo31WF3Z+SM6Q1NzfJ9bspwQn3/0H5sFLBw9Sw7LiXuxqI9AGLHD/7pYaJLN9RtcUq9N2TuvEv/kjoLkd6HkYkm/pKcgzbYuGC5YOTLl2gUOf4ncoyh4Jig2KV1TnMGzPnCoCYzDq3JjGj9NJ89FgLX+CukoV/3RYKO6L2DeME7yrRgqQWJYry5cst9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 13:46:25 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 13:46:25 +0000
Message-ID: <b9171901-2b08-481a-9166-66a92cae4e9f@intel.com>
Date: Mon, 8 Dec 2025 19:16:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 13/13] lib/kms: Skip when plane has invalid color
 pipeline
Content-Language: en-GB
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-14-swati2.sharma@intel.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-14-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0254.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::9) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH0PR11MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 63794528-42ed-4ba0-ae38-08de36602df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnQxWHl0VFdlSXhoR1NJZkhrM2tvNTg0ZmpxY3ZrR1NBb3hCSmJ1KzVJcUpH?=
 =?utf-8?B?bTJ4Vld5N3kvNTZ4T0ZwS0pMZTdkaDZUeGpDcmh2Q1JwYlltVElPaWQ3aDAr?=
 =?utf-8?B?LzFYSDNtR0xveStOTGRWNjhyaWFRM1owSlAyV0owTDZ2dEltbE1QcVM0Z0Nm?=
 =?utf-8?B?OVFoRHA0U3pob0hwWURxTisvb0o4dEtETGl1WDdwdnJsOGlmOUVMUVIxQzFE?=
 =?utf-8?B?NVJEeDZLUTlzZzlJOGlzZkNiVUlid3hZYVBQQmpYZVBkN2M4ekt3cURKSnRT?=
 =?utf-8?B?NFE0Y0JhblJid3B5TkI4Vk0wU0oxR3pydjJQL3grRGNYNXB5Y3NaVWJ0TUNJ?=
 =?utf-8?B?REt5dFFKQWV3dVEvMjNFcEFpTWgzSWw2K2Znd3N5YktRNUFxYUpJRDFybk13?=
 =?utf-8?B?dDVwMDhVN0NLZFo1dmFsQjV0VE81Z04xaGlsSVFWMGM1RnI4QTlKZVVFQ3Bl?=
 =?utf-8?B?RFZUMkVqcTJROGJnN3R6M1IxUGpsemR0OVdwMitTYXR3UEdpWHYxOEhmek1E?=
 =?utf-8?B?U3dJS21Cbkk5SUErVFpkTDB5cDdwYWg4a3prU2w4WmsxK2JDam1wWjdKaWJ6?=
 =?utf-8?B?L0pzbEhzS3hjYmZqQy9NQ3FBWDk3UUxEaVJZUTkyd1h1Tkp1eGNRNHBDMURM?=
 =?utf-8?B?L3g4cG1laWg3aGJkM1dMcVpMR3Q3SEFxMG56dWpteks1ZFRINXc3aGtHamQ4?=
 =?utf-8?B?NHJsL3h1VWRjclU5cVZROXRONGNkc1owNFJEbFV2dzRINjR6ZlZlRFBMTWJF?=
 =?utf-8?B?V2NsNHlxdnAzekwwWVlCbjY2VU5wQTRzME9pT05aV1J2Z01YdnVTWXZmTTlD?=
 =?utf-8?B?QzZHNHdSZHcva09HeGlZTlEyK3FtWjlCQXF5dHUvclUwZklFU0hwcGFSRzBQ?=
 =?utf-8?B?YlZIbGhpK1BFM0lFK05pSEVhbzgyT3luY3lRTWx1YkxaVzU2Y2JRYURwcnll?=
 =?utf-8?B?N3Q3N1hUcVBZcklYUUhZOGVaMHdlUExiaUs1S3dCQnJHd0daeTB4RktnRnlw?=
 =?utf-8?B?V25wSlNDb09NOEM2a2VUc3k0eWZGREt3Tjd1WENXMlJySFpHWjF3d2dYcnd3?=
 =?utf-8?B?c2hyRHFnRTFja1JXUEhDa2NBUWVMR3pseUo1c3ljNDVjR0Mwc1VERTNVZUJN?=
 =?utf-8?B?SUlTWWk3L0ZJU0ZjYmJ3VDkvVmRjY0R3bmY1RWptVjArODUwU2xzY3U2YkJN?=
 =?utf-8?B?amQ0QjRzY04yekw4MlpNdnUvU083bUljZVdaM3RxNHRZTVN6QmpqcFVXVFdH?=
 =?utf-8?B?dmVjcXp1OFhycFllZEg2eXZubEgxcWl1c3NKNGVDU3kxTU5lZDd4SGpQaWx4?=
 =?utf-8?B?QjRXRGNQNXViaSt5bTdsOUVtTHhVUzloa2crcGx0eHArQUprTTJaUjZKb1gz?=
 =?utf-8?B?SytDUENvZS93d1p4WDU2NEFEWHlKb3p3eWw3aUEzSmk0Y1RmZk5iMGhCb2dV?=
 =?utf-8?B?OEVNWGtpdWZZY1JPaFhIbVMxTVpzNnNuZm43Mjk3Rks2RzJ4OEFWeno1OFNC?=
 =?utf-8?B?cVYxdE93VW1RTDVDMGdiOVZ1NHphNTFJUXg0RjNaRXpmRUl4L2prT3ZNSkZP?=
 =?utf-8?B?V2tKK2FIa1I2WTBjaFNFcmZhMjN6RlpzOElQVnI0WWQ4a1lXSG1RcFN4cmwx?=
 =?utf-8?B?UjRhdmdqS1JlM0Z3R3pxdFM0SWhLUy9xaXU0enFkbjBNT0lxbkZlTlpyZnRH?=
 =?utf-8?B?bWxOZGVHRWVCckJ5am1CQlFDRll0ZFFxcEZQaUIxc0RuUWc4OGNHbGM0RjF3?=
 =?utf-8?B?Z3V2TlJ1WGMzUit5a1hsbncrVEdFb3gvaXBhcFF1RTVmL0pyNUkxUjhJeU1x?=
 =?utf-8?B?dVdyUXpkZ0dac3h3Y2FZWUZPZnI3MjE2eThBMmdqazJxK3JjNk9wTFY5Vkcw?=
 =?utf-8?B?R0N3MmdhK1I2aHBXNU5JeHhZYmU4bDluMTJDYjhQS3JWalVCKzJPYnlTVWNi?=
 =?utf-8?Q?IdiknQ+62A+/S/f1p2D7qzLcN+KB6V+z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWxzUE12UG1tejFmWE5FWGNTVmorSS9Zbm5qbFNuK3A3VFJadFAzeUpxRzNJ?=
 =?utf-8?B?SXBiMzJBY2swdysvWTRnVVJuUFF4UmpIUlhQTTlYWnFTT3JSQ1FXRHhoM2hY?=
 =?utf-8?B?TDhUVlhEOGgrbmg0MHJoN1RTeW1ZbnpUdHYvQmN0dmhrZGQ0c1ViNGh2eHl2?=
 =?utf-8?B?aFdYTHp3a3FGQTI0aERxVkNCOUdLT21DV3FGNS9jQ0pjMWhxNVFYY2FkUExM?=
 =?utf-8?B?Q25GeHFSTFB0ZWRzTjlhaHhyNGhCR3N1TzMwQUNxcGd1eFFJK3VBa2VvWTBt?=
 =?utf-8?B?WjZZbXRnNzZDVXYwcm92cFdtQ1l4dHAxUVZmZlFzZUtyYnV4cHd1MzVkV2Vt?=
 =?utf-8?B?c2kvYWg4a29tQ0pzbXl4b0pKZnVnUFNrTFlXLzBDc1BJa3hHSmRDeDVOb2Vy?=
 =?utf-8?B?Q2RUeW4zdHc1MnJpVHRyTlJNZUFtTW10aXRmQUNNTGRjMGNyKzlabWJVbkli?=
 =?utf-8?B?dW5DVXJyM1VVVmFQY3pPWmhDcGhvVE1odDVwR3JnSVRRRlZqSVg3KzQ5eEVY?=
 =?utf-8?B?OEFkc1JuMG5VbU5reHZta05vUGcreS9Nb2ZtMVQrenM0eXE5bjkveUN2cTdT?=
 =?utf-8?B?M2JsSVA4NHRuZEZGR2c0bC81N0FlMDVkSFdqcHRHZWF6d0RSLzFHRlVPOHNX?=
 =?utf-8?B?SVRlZVpIYkV1NFhhUEFGcGp5WkIxWlRrekszeVZNemgrR1k5SCt6eUJocWh3?=
 =?utf-8?B?eWQ2K2lPL05kN01keHg0eW5RNjlYNGxwK1gvS1J6MHJHcXFpcFdBMDhjZ1JO?=
 =?utf-8?B?cjFDQ0FCWmNGMG9BaHJLYzFBd2NqMDFncmc2TVc5RmRqWnZmaStjY3plV2Fy?=
 =?utf-8?B?TzZ4a21vejdYb3I3cmdiRjZaZWlFaGF4VXEyRkhxWXl0Y2t3RHRUeVlrRmpC?=
 =?utf-8?B?MUVtdVpzUm1yZHZQeE9kVmhORjl5Vncxb0U5R3JLRVU3MVYyWE93SGsvZVRP?=
 =?utf-8?B?WjZiVHRZSi9yUk1neUdtZzBzMy9iV2t1T0I1T29pbUlEYlBMMjk1T2ZraVEx?=
 =?utf-8?B?N2NIMEI5SVc3anFWWWdCblZhdE03VXROTWw5T2JFKzBrUnhlQ0lvb2VCd0sv?=
 =?utf-8?B?dDVXWFF4NE1ra0tJU0xpdlZncXU0a1lFMUd0TEhIaWttVE9JUVEzM1ZJcGQ1?=
 =?utf-8?B?TXNOck5YU3BJclR6SnhIeFovOXNvVzVoUTZvSVFLRkR2QkgvTFZxSGJrTjdB?=
 =?utf-8?B?aHM4V0VjUFlocS90dE95dnBBQVZhZ1YybGp2V1IzSmxxTTBPTWlUQ0FTUDRl?=
 =?utf-8?B?aXFZTkF0RG1pUS82TUhkUkZ5WStFWXVWQzgxd1dLd0t3QTg2UGdMOGJHN1hH?=
 =?utf-8?B?aVNIMFZnS0krTnhvOG9vQng3bnNWaWo3M1RPMndFb3IvMXltKzVUekVXYWVm?=
 =?utf-8?B?Y3lNNlZVbTlvRkJ5cnkrMzNBc1Ixc0RxNCs5dFZsc1JMT01VenI0ODR2UUFr?=
 =?utf-8?B?TU5HWkpLMTVoSnRCZDFod21aQ0tVOEFVbG10S1FyVHdidVo4MEpFZU40RU8v?=
 =?utf-8?B?amJvOHJkYzhzMU04aHZJK3FEYnltV3VvazdDN1RKSDZQVmVoTEphSElHcmlY?=
 =?utf-8?B?eU9jVHkvNndWbkZ6clJqYU1SQ0x0Z2Q4MUNzTzFWcnlEZUpES1dvMDEzN1FQ?=
 =?utf-8?B?Y3R4MVNCeXkyalE0LzFYUnpGVEtrRTcvbFdiZGNIWmZMNVpHMnJrVWtlZTVI?=
 =?utf-8?B?NitKTlE3ZWRFZEdyWXNCQ2tkUXV1TThlR2NCcHNnazVoZDdiVlFVZDZ4VVRR?=
 =?utf-8?B?M3pLTEZuZy9ITGdTTTBYVk9MeHJmRnFHZnI0ZzdUOHJCd1kvcFFBdGNrUVJs?=
 =?utf-8?B?RVA1ZzNrcG4ySzViMjR2L2Nma0hWa0o2ZXYrNjVLZ3lza0VFMTlWRnNIc3lH?=
 =?utf-8?B?U01yU0d3NHVNR1lqVWQvT3pRdDcwUE0zcEYvT3IwTklrUXJ3NjFzbXE2UERN?=
 =?utf-8?B?R0VBbCtYeWFub2tabEI4WGxqUnpEOEQwV0JqQ3JFaExuR3l4QjdQYk9YMnN5?=
 =?utf-8?B?ekhCRDQ4LzBvbGczQVVkMDZFdWR0YVBod0Zib0JQRkMreHdya1FpTTdYdUNK?=
 =?utf-8?B?VGdacU1xc0wwVXlidklpTHQ1ckF5cHI0RldOd3lUQklNY25VTlJFL0gwVXA1?=
 =?utf-8?B?OC9VMkJlOENPK3BDL3lkc3pOSndmVk1GQkJXbUZPYTRlRHZRa1R0a1kyMk4y?=
 =?utf-8?Q?Jzqc9hDpVT0jGl9XGtrDJO4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63794528-42ed-4ba0-ae38-08de36602df0
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 13:46:25.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBdm0GFpc0kdXV9SZWJo2HbsVZ8RVnSMxie2LX6IWbttxFpY59gRKg5lAO6vCELjmU58C2Ic/NZ1GLchkFID7s1Fn6y0/r4XcfIaLsLdt+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> Replace assert with skip in igt_plane_set_color_pipeline() to avoid test
> crash when color pipeline is not supported by KMD.

We can avoid this change if we follow the pattern

color_pipeline = get_color_pipeline()
igt_skip_on(!color_pipeline);

similar to kms_colorop

==
Chaitanya

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index b522495f8..9b3958804 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4436,12 +4436,12 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>    * @plane: Target plane.
>    * @colorop: Colorop to set as color pipeline.
>    *
> - * This function sets the given @colorop as color pipeline on @plane, or fails
> + * This function sets the given @colorop as color pipeline on @plane, or skips
>    * the test if it's an invalid color pipeline for the plane.
>    */
>   void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
>   {
> -	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
> +	igt_skip_on_f(!igt_plane_is_valid_colorop(plane, colorop), "Invalid color pipeline for the plane\n");
>   
>   	plane->assigned_color_pipeline = colorop;
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);

