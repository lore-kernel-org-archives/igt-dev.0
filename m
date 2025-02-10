Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2C5C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5528B10E5EF;
	Mon, 10 Feb 2025 18:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMbowalg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B231910E5E9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739212796; x=1770748796;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uaAC4HHJAoFCUoSi+ImsC2gcEUEUee0Kba/Q9KzyKQg=;
 b=EMbowalghW46Jm/ygvq0ewEhr6mndO536e7c5+Ax5DWJit/HGRKvHr7z
 V8hXykllCkxNCBRSqM2y0QZuVZjJYiHIMrBD7jNxIIAX1zOKs79d6cP3V
 4q4FJzd4EV+rHyiX6dQtm+wzwDfglPzE9fxVch5EXKi24VHT2VqvkbVs4
 gcIrmBVaIyEkFBe4uyyB9bJhosqfXWmXjV4o4fiyd6opz8JP412KbiohI
 WDKVa93SjzZ96mTMBsAw7UMmbFooveVpdHwaTnDeb2xOJQpjIsQY6hE7r
 sgkQqHpc+6BsGSZ0MTSNl3XsYRot7koCZhWaLg9IrTx63Jwmi2Xl/FPzU g==;
X-CSE-ConnectionGUID: UBUslrIRQm2DxyF+5czLrA==
X-CSE-MsgGUID: qyzmt13fSNW38votkrwUow==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43467512"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43467512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:39:56 -0800
X-CSE-ConnectionGUID: jzQG0ETaSqOwYEIkcYVrzw==
X-CSE-MsgGUID: W2oQ9vDhR6CWKo0w+Ejhhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112900685"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:34:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:34:31 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:34:31 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:34:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFa9wDy+nddy7Amqgila8/B9bpI4e6FFxESJl+HhjaRrT39UDcEka8KtHwRxWeRGZJo7b2ITAuQmV8NPmyTUUjRkL83Q/yLChvx10HTCHVd9eoqeruOWFjBaXkwz2WF+Xdgrbp+8EHe2FSK2dlI/NmQg8Cp/LcaCQjaI+wPjpnWJJH/SMAWmtQrD6puRk/eH1Vjjb+dmyAN6EC5XMp2EJFEWuwLa+N7/FtqEXWcnTc+8VPenv2WTmcKJJtdN8zH7aXaW2SfPsNreGtTXN1QgfsYqEJYN8vlHnLmUATOeiGsnqJxlDcvGZ2q7GWjPdLR8stwjg/+6ZkIoXKq6ZIokug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZe4NUW3QmapvNscRtaJXluMrNsYt010rCQ4f9pzZ2Y=;
 b=of4jDbMyZPWZvUJa7BBlWO7qoyL+3RGzmolf7eHkyAboUMlPwRUIdzXM6uWz+vOOAMtzgETq6LnOlyiKEQLq5bGvL2C3ISYGU2GVNpkX91e99A8Tbar9DvoTakSoyRCiuO3fSd5IDuTs7PCkskeLvvC7jRHbPzo1t6OIVA7ANgToyLWdSG0GP6P2Ua34BGpT0eoDl+J4FDGuJXbbmUzNhzxRXPoftKf7lWVA+20WyaFgqW/OVOiSAWVj8m9zWUf1YLLZITfOxC2Vtm2SFWNjIwmG9zQCv43Gb1/644ltWwTPDzLi713fnQuHSiAStpZ+EslGAWejT1T572aIa/xGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 18:34:28 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:34:28 +0000
Date: Mon, 10 Feb 2025 13:34:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juhapekka.heikkila@gmail.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
Message-ID: <Z6pGsCYjeMJ50LsK@intel.com>
References: <20250207001432.48524-1-matthew.s.atwood@intel.com>
 <Z6otorjM88ECUD-2@intel.com>
 <CAJ=qYWRoht3TV3zv6v8LA+cQDVP7SHMT2=45OkZuGniZiyZysw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ=qYWRoht3TV3zv6v8LA+cQDVP7SHMT2=45OkZuGniZiyZysw@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:303:b8::22) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: 8adfe0fc-8683-4c5f-9c8c-08dd4a018cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXVHdEg1ZU1JTmtCeFd2VzhnUGkwL3JaYU1BazdMbDlpZnNoSTVFU3JaaVJr?=
 =?utf-8?B?R0JWbW1mMVZ1ODAycmxUUHAxNm9td2xRNW9VSkg5blFwalZkZkpzL212ZFdS?=
 =?utf-8?B?M1lxSEhBMmQvUUtNN1R0Z2R6Y0VsMzVDbHlBbVpGSjF1aWx3RVZyWm1QMU40?=
 =?utf-8?B?QTVSS3pVVzE3RnpnamFJSlVscnp2dW1IcWxnUFNPU0daNEh1U2d6SnBFM09Q?=
 =?utf-8?B?TVJTSkpETTQyTGFoRWZZanpKblQ0UXdIdXFmdVNTODB6TjZVUzlYRjdsTjRU?=
 =?utf-8?B?aEdEaS9hS3lZUXpmVmJTZnQybDFWSVJjdm5DVkpqRDhxUnNJYnhCVVh1ZTQ2?=
 =?utf-8?B?d3RickFhUzAwTmNEZUUvSDFmWUFoVmgvUHQ0SkJXbkpLSTNaSXpVUmNGcTlq?=
 =?utf-8?B?cGFXYXlkN2ZSSXkwOXRrTGJtamdRMWYwTVRWRHpJRHVmeWRWZFMvUkdQblUw?=
 =?utf-8?B?ZWZmTC9MOG9LaUFObVZicEw5RXROMmh4Ym1kdk80LzRleUkzZmhaSHQ1alBr?=
 =?utf-8?B?NytEdU02SHZFdzd5aWVIOHcybTdKbEVNa3poRTFjYndhN1o2ci83UnV2Rng1?=
 =?utf-8?B?VlNicmNSMmZDK2VVOFlDM0ZyV2FkNmVnL1RpQlZRTzdCaFhkQ0Vib1RwR2o4?=
 =?utf-8?B?emU4eEpVSTVERE1pQ1FOUHFINlR6UWtmeVBHOTRDYStLNDA1MWs5ZTBydFhk?=
 =?utf-8?B?TDF0QisyUktoSnZRVy9SVHBaM0p6ZFpxVVpwcGlxTHlTSHFNVmxhUUVBeTNH?=
 =?utf-8?B?WVlJa2tPQjNVejJJSFZNK3h2OGZCaW9mb3BuZE80b1d1QnZJZjhneVF5WFFz?=
 =?utf-8?B?QTFnamFoS3JXSWsxbFJMNnVTY3grTG1pTHdtWE44K0g2bENocE9MM0pLUUhl?=
 =?utf-8?B?WVFrV2w3KzdLbjBXWmNVVFJLa1prZmtUWDBsRkpQV2VXR2VDZnc0ZlJVYjBV?=
 =?utf-8?B?L0dENGpIMGRvN1JZaCtpbW5hWGxIdnlybDYvZElPUFRrNkJucEhOeHFEQzF3?=
 =?utf-8?B?b0RlQTNYbE1lNHFXcUVucTMrS1J5WVdCd3dqdUU3cE5NS2l0VU0zaWUyN2ZP?=
 =?utf-8?B?a0dhSE5lNlVWQUtZRmcvR0x6UHc0M21keFBLMDVHZzNWbVo0T1l6NG5nQ2Fh?=
 =?utf-8?B?djJsY0ZkYXFrY29WYTdKYkp5UGxvK1RqWWRvVDNvSVBBR1d6clNZelBxczNZ?=
 =?utf-8?B?QWVGNDNpZWtEZnRRVEdZOXhQRWxyYlp0dVFZT2tKeTVsSlF2a3BhWDh3Z0pK?=
 =?utf-8?B?emtJaEs2UjlFTHZ4bk1CeVcxd2pNdFZDWFdZUEVSMTd5L3dHVklGb0QxVTNK?=
 =?utf-8?B?QlRRNnlWSHFjbFFrQ2JQVldDbjA5emtoejJYUldSaHZndDgwOVZQOENLVTdM?=
 =?utf-8?B?Q09VQi95d0pBWnVSbmZ3THd0SXc0TWVaWXV3Z1dIbm9TQmlFaEM1MzY4R1pN?=
 =?utf-8?B?SkZrZFM3aG1sU21sWHkxVEtHcVRyS2dpL21MRmxHMnBOVVI5bm1yNW5HVG9W?=
 =?utf-8?B?ZjZkczFXcW5oOTR2YzN1TWRKSkt1T0MwN3BiVnhicW84RlV2VXJHb0pzMCtn?=
 =?utf-8?B?cEozZkN3UXVQRmwzS0tIdjBnTDYxdlRMVmxocjdrYi9LbXVQSjV1dDQwSUhu?=
 =?utf-8?B?R2ZSd3hZdFNJWC9QRm40OVNjUG1ranhHZDlYSTRjQTNSUGwwSlRzalltUE41?=
 =?utf-8?B?S1Z5dGFMaU8wM2xqTWQvVmpaU09UcmRnSmJJZTlWMWswd2Y2ZmRGMkpMVUZ5?=
 =?utf-8?B?YkVsVXBtNVlROVZIUHZpVGgvYVRNQURETys0RzV5T1g1b1B0Ymxkd25GWmRV?=
 =?utf-8?B?cUs0TzFBbnJhY3E0Qklnc1FTS2NRUWJIZ2RHRmZXR280cVNyYUR5QjdkNjZQ?=
 =?utf-8?Q?uXzAvcr4xhloV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29Vc1grWUdLTHZaMkx6MFhQczRuU2NxL3JvVmFHVTB5d0NjOGt6cUdCN1ZQ?=
 =?utf-8?B?Z1NoZVVvWFI1SXdON0Z5eG82dSs2OTFHQ1UxR2lsTy80eGU2MlRSd0UvUmZY?=
 =?utf-8?B?Z2RuWm9BWENxV0dEYzF6ejFFR3dDZkRDOGFoQlcrTlVPNnhORmUzTVNBYnZE?=
 =?utf-8?B?RU5PUURCWVNUSnVpS3ZwTi9neUVBMFE4SWFDOVlkWHB2c0Nua3Y1bFNTdzht?=
 =?utf-8?B?cnhjWGo4WVVEbUwvS2ZEMkVtMGZSV0x5NUwralVla1FLU2ZZK1E2L24rTnVo?=
 =?utf-8?B?bmMwQnM0U0ZLWldNS3BFSHZhYXpDMHFVRDJuRmg0bGRsSThVb1FyQjFualEw?=
 =?utf-8?B?OTlPbHI2bG96M09MWnVPY0lzMllkWkIzanc2aDY1TW9DZFhDOW03bDB2VDZX?=
 =?utf-8?B?eTRuSGFHTDg5NmI3d2YwTXo1bjN2ajl3cGVqYTZtWnl4S1VhT2ZrUE56dEpP?=
 =?utf-8?B?RjM0RTU1YUdVWmNhbVVoOElvK2FwS3E2TWwxamVndHFWYmJxeGlvZzFDaGtk?=
 =?utf-8?B?dUJORnZKelFKWXZCN3dvUHh6ODJJOEZvZmdNL0hERWpjL1AxYUNTVWtoNUE1?=
 =?utf-8?B?c2h6Z0RYVStKRTVKbHpPeTdRLzdhTnZqVmQ2dnJFQlZ3NzJjMW92S1drSjdo?=
 =?utf-8?B?SzBZNEJsbUVibVVhZkNRUEMyN3ZlN1hURmJyU2dDVG1wL3g4R0lXMGlndm9V?=
 =?utf-8?B?YU5QU21PQ1BnaExEd29rbmJTeG00U0JvZHl2bDVMSkRrR2J5L0hJNXk0cEJ3?=
 =?utf-8?B?ZEdoOFIxalR6R241WXl4Qy9JYmdjbGFRUjBIdHZMQ2dBTkJBZ3Fqa3huWmxr?=
 =?utf-8?B?UUVKMG1lSDk1S1lnL1Z4d010bkFzNVFFRXZ3WVdVeUF1RSsrNnBXdGtpdW5U?=
 =?utf-8?B?S2ltTWJZd0orQTM4RVdSSWNLR2hHc3Rkc3NVSnRpTlhNUnFGUkcrS0dPWnNr?=
 =?utf-8?B?N09jYlBOazFUT3IxMElrcEEzYkhYdjNacjJpRm85c3UyMks3UkNlK0FrQ2U3?=
 =?utf-8?B?QklMUDIyVTJrc01pdlM5OUw0TmRPdzNFMDBIdWVRdWVvRWpyMXMyVE1memND?=
 =?utf-8?B?WWFEUDVGSGdBOGtxbmdmUWVIUytEUGRPRmozZTZoNU9SajN3aFAxa0dpVnh4?=
 =?utf-8?B?Q2NiRkVnYVdxNG5NT2NIM0VIbFpEYktVbEs5TVBPUWcrbjY4cHBRaVNzYkZa?=
 =?utf-8?B?R0pDQ0tpWmtvWXRvUzNzcVErK0ZEZm12MlRoSWxMaDNtNVRIUDBMd0tVVUxm?=
 =?utf-8?B?NmNLTXlUK1FpNzdzL3JQbW5DUDYwa0VjeGJuRFErTWNSOFV0ZVIvbTV0SlM0?=
 =?utf-8?B?dzNGblVSRllMaFliNklpRFVRMlBQdCtNMXV2ZHRhcGs1cjBjeUZKSmZINWJh?=
 =?utf-8?B?SVl4N0ZRRVpUMUE1TVZqckhkeGVyQ2tFdUxadFd0Q0laSC93eE5ZbWdxN3Iv?=
 =?utf-8?B?N1BnRHNVOFFvUjBxY3E0NXRrTXNMVFhXcEVJamxab3hWN0E0bHFBOEtIZ2xS?=
 =?utf-8?B?VjNaOGNnWEs2UHVFQ3NFalFZUGp5eXd3djJMdWc5ZEdUK0Vud3dLdVZNNXJi?=
 =?utf-8?B?bDlHWHYrS0IxckEzVHJ2Sm1iTnowbFJ6YkhyWHByNE1ycncvckp4cmUrZm1p?=
 =?utf-8?B?VnRVTEg2YXo1QnpDNk9NdkdkM05aTlVuSUNRZFBZSjFPc1ZJMnR1OGlyaEJV?=
 =?utf-8?B?dFgvT3BzL2dkeWYxZGRWQjUrTHlONVJZNEdUNFlPVXptOGdIc0FxVWQ3b1NJ?=
 =?utf-8?B?MjJxanRwaGVFV0lYWUZxeVgxKzJMbUxxWlRudEd4WkZQcWVsZkdFdnpYMS9t?=
 =?utf-8?B?QStTMEcyN1JCUDZrYTJUV3RWclIzb2pSNUhYV0ZzOTAxUDZDNVN3OGIzOXBH?=
 =?utf-8?B?TlhlVGw0Wjd0Z2JoZEtRV2pnTGdYR2VvL0dPM0Z5OEdnMVR5UVFlQWZpYnRT?=
 =?utf-8?B?KzFlK1BhTGNPaHdYQkdadnBlUFVUcFY2SWRhejdIMThORmJNUEpPZzJEQWFs?=
 =?utf-8?B?SkxDNk1RNXl0S0pydzdqYW1Ca09yallEdkxlcEluVDk2S2RRaVJEdEdJL0pJ?=
 =?utf-8?B?YTN6RlZkbUwrQUFJRXhZWnpPRzJFTFhHMWdPT1gvZUZ6SXpvTmp3SlczeUl4?=
 =?utf-8?B?MkR4ZjJSNHNqWmJZTXE3ZzVwL3d3Mkp6Y2dHRlJ0N004TDNZUmVOaE96RzMv?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8adfe0fc-8683-4c5f-9c8c-08dd4a018cfa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:34:27.9365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GjAcGCIEMeBmB/br8f/xugutBLiIWlsD1/pBF/9ZPWhc04OLbx2uK8DaNbIFOugQ5SMaypFxPUP12Amaes4zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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

On Mon, Feb 10, 2025 at 08:21:36PM +0200, Juha-Pekka Heikkilä wrote:
> It's only s-o-b which was missed?

yes.

> I don't think we're doing much on
> that other than say "let's be more careful next time".

will be.

> It's not like
> reverting does much on it and I don't think we're going to do force
> pushes for this, force push would just confuse people. If there ever
> come any question question, this thread is found on igt-dev list.

indeed.

Thanks,
Rodrigo.

> 
> /Juha-Pekka
> 
> On Mon, Feb 10, 2025 at 6:47 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > On Thu, Feb 06, 2025 at 04:14:32PM -0800, Matt Atwood wrote:
> > > There have been several changes to pciids upstream that need to be
> > > sync'd into igt. This synchronization is different from the normal
> > > process because kernel history differences in drm-xe-next, and
> > > drm-i915-next cause conflicts that create conflicts.
> >
> > I did a s/drm-i915-next/drm-intel-next (i915)/ while applying the patch
> >
> > But I forgot the -s on both b4 shazam and on git amend,
> > so the patch is without my signed off by...
> >
> > Cc IGT maintainers here to see if there's some correction needed.
> >
> > I'm sorry for the mistake,
> > Rodrigo.
> >
> > >
> > > Sync with the following kernel commits:
> > > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > > ranges")
> > > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> > >
> > > v2: More verbose commit message
> > >
> > > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >
> > > ---
> > >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> > >  1 file changed, 47 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/lib/pciids.h b/lib/pciids.h
> > > index 23f349f65..4736ea525 100644
> > > --- a/lib/pciids.h
> > > +++ b/lib/pciids.h
> > > @@ -717,37 +717,66 @@
> > >       MACRO__(0xA7AB, ## __VA_ARGS__)
> > >
> > >  /* DG2 */
> > > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > -     MACRO__(0x5690, ## __VA_ARGS__), \
> > > -     MACRO__(0x5691, ## __VA_ARGS__), \
> > > -     MACRO__(0x5692, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> > >       MACRO__(0x56A0, ## __VA_ARGS__), \
> > >       MACRO__(0x56A1, ## __VA_ARGS__), \
> > > -     MACRO__(0x56A2, ## __VA_ARGS__), \
> > > +     MACRO__(0x56A2, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> > >       MACRO__(0x56BE, ## __VA_ARGS__), \
> > >       MACRO__(0x56BF, ## __VA_ARGS__)
> > >
> > > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > -     MACRO__(0x5693, ## __VA_ARGS__), \
> > > -     MACRO__(0x5694, ## __VA_ARGS__), \
> > > -     MACRO__(0x5695, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > > +     MACRO__(0x5690, ## __VA_ARGS__), \
> > > +     MACRO__(0x5691, ## __VA_ARGS__), \
> > > +     MACRO__(0x5692, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > > +     INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> > >       MACRO__(0x56A5, ## __VA_ARGS__), \
> > >       MACRO__(0x56A6, ## __VA_ARGS__), \
> > >       MACRO__(0x56B0, ## __VA_ARGS__), \
> > > -     MACRO__(0x56B1, ## __VA_ARGS__), \
> > > +     MACRO__(0x56B1, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> > >       MACRO__(0x56BA, ## __VA_ARGS__), \
> > >       MACRO__(0x56BB, ## __VA_ARGS__), \
> > >       MACRO__(0x56BC, ## __VA_ARGS__), \
> > >       MACRO__(0x56BD, ## __VA_ARGS__)
> > >
> > > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > -     MACRO__(0x5696, ## __VA_ARGS__), \
> > > -     MACRO__(0x5697, ## __VA_ARGS__), \
> > > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > > +     MACRO__(0x5693, ## __VA_ARGS__), \
> > > +     MACRO__(0x5694, ## __VA_ARGS__), \
> > > +     MACRO__(0x5695, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > > +     INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> > >       MACRO__(0x56A3, ## __VA_ARGS__), \
> > >       MACRO__(0x56A4, ## __VA_ARGS__), \
> > >       MACRO__(0x56B2, ## __VA_ARGS__), \
> > >       MACRO__(0x56B3, ## __VA_ARGS__)
> > >
> > > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > > +     MACRO__(0x5696, ## __VA_ARGS__), \
> > > +     MACRO__(0x5697, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > > +     INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > > +     INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > > +     INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > > +
> > >  #define INTEL_DG2_IDS(MACRO__, ...) \
> > >       INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> > >       INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > > @@ -782,9 +811,12 @@
> > >       INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> > >
> > >  /* MTL */
> > > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> > >       MACRO__(0x7D40, ## __VA_ARGS__), \
> > > -     MACRO__(0x7D45, ## __VA_ARGS__), \
> > > +     MACRO__(0x7D45, ## __VA_ARGS__)
> > > +
> > > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > > +     INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> > >       MACRO__(0x7D55, ## __VA_ARGS__), \
> > >       MACRO__(0x7D60, ## __VA_ARGS__), \
> > >       MACRO__(0x7DD5, ## __VA_ARGS__)
> > > --
> > > 2.45.0
> > >
