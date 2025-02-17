Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E775C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107A810E392;
	Mon, 17 Feb 2025 08:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhtMYJjj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F9210E392
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739781135; x=1771317135;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cvEqfdldzCYsxV7M0exdT/4FWdJduLKRyi/lVIUqlro=;
 b=RhtMYJjjNob9gLD+Hbr+nwSmXKU1pUVsCh+hx1fXyNGG9Ofs0r9cW36d
 XjSRc49DV24uh+PcakQlQWAv7XEeoL1j/W3SwCqJy2q+Q6fLv4OL8E8/l
 MTGtvXb0EV329m5jJd2NcBUWEAnjbHlcVUuk5dL+54yZ2nRBaEgW61sUH
 kEBu2UwahmT5Lprjn24bdydVUaHcoK6OmCk2BsyHPi69p68nTat2QMcqq
 cmKFnPuQ3xki/usaXMP7zcCy6LNroBiqfXnekUKvud/w1MNNl1cx1X2jo
 yRylSAzeQp6qwN0nQgs7bkmvOZhOg9xhoKSWowPQT90bXydEkSz5qhaj9 g==;
X-CSE-ConnectionGUID: 5Q57RvlrSnifBO/lZVFoaQ==
X-CSE-MsgGUID: 0FOdLhyUQNuNMMdwrludVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51100372"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="51100372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:32:14 -0800
X-CSE-ConnectionGUID: iPnoWFULRg6O+IzBiupXZg==
X-CSE-MsgGUID: IO0GDAgGRaWl/unA+NYzLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151232582"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 00:32:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 00:32:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 00:32:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 00:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3RCJgu3ceJzX9BdJW5VmlBbD5kDoUW1QbFhpz75XwaD+k8e/1OSqaN6pwq7k2zNhh0wB0pCKI4vUkAh705L2FHwPWDEoECZwJG045+iS9wnbZ8b9sHY6HJQVG032GmswWl07TxLJ/wfO3cVQylm12UwllN/jQnLbHqsttLx1pGCWWHee+x87x8eEELV89jPnqxBhqYzpmLcWhDPBMnQO/vlnuw25ySntTg/fwtHLyPqGHXpBwg/+7Jjj09z0nrYQm22AfxVykQaPF01ppup7A8G/fKFxEw0CCjwhOkRdj/ydwUlay+k/q7vVZ6skfq80rd9J5CwNNNAUWzFEad3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvEqfdldzCYsxV7M0exdT/4FWdJduLKRyi/lVIUqlro=;
 b=iTUyflYhpNsHQfPVY5KGkNFH/VnEsHlcklEei4WRgxOGewNrSlenPpmjf6eIwMJIupOHpalDWrEQ4KZzGywBf+cgDcIU8YjVQiTqjWBcMvIlTiApRvLImhsT41OxkVXecquwBDkhmD+cGKT8bLoJVB7Vovg5DUOTXIxyq1pYDYl9sc/1E9QpP2NZhNcosa0BhWDRQhUXnXGt+zpplTCivW1pWhEvicoHKCBurn1aZjwzOsX6Y4rzqH3hTi4v3Rl97Hni5/nSqGp4XvXmEbmcnElVGSKwsTK33SbOGIzuVNg1UHt9PUFSDBTdLKMWCjao+DEn8yxNrwrkIerP/yN7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) by
 PH0PR11MB5064.namprd11.prod.outlook.com (2603:10b6:510:3b::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.17; Mon, 17 Feb 2025 08:31:50 +0000
Received: from DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379]) by DM8PR11MB5686.namprd11.prod.outlook.com
 ([fe80::164e:21c2:c4f6:7379%4]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 08:31:50 +0000
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test category'
 from documentation
Thread-Topic: [PATCH i-g-t] tests/kms: Drop 'Functionality' and 'Test
 category' from documentation
Thread-Index: AQHbfGT8DmhXCVhhPEqQ9iuXea9xB7NGbZcAgAAvMQCABJQ24A==
Date: Mon, 17 Feb 2025 08:31:50 +0000
Message-ID: <DM8PR11MB5686BA1359E67AB8FEE9ED4098FB2@DM8PR11MB5686.namprd11.prod.outlook.com>
References: <20250210105646.307902-1-swati2.sharma@intel.com>
 <20250211091138.kppr5lzhvnyharsp@kamilkon-desk.igk.intel.com>
 <47345d63-1927-4871-85ec-5083ca601ba1@intel.com>
 <IA1PR11MB60971275D3EBF5AE5C8A5EB886FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB60971275D3EBF5AE5C8A5EB886FE2@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5686:EE_|PH0PR11MB5064:EE_
x-ms-office365-filtering-correlation-id: 7e2f38a0-7fff-422e-67b8-08dd4f2d868a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d1gvRWVPMGlWTGFPdW5ycHNIVWNiM1E2R2lybm0zVEtnNk43MzFjZ2hHd0Fv?=
 =?utf-8?B?ZGkvb2VPTzNrcXhGQ1RLV1FKTXdtNDZvRUxRSzFQenpOWWV0ODRRUjFvUFJW?=
 =?utf-8?B?ODdhdXEyRzdvd1B3b25OeGpBbkRsM2N6d1VaTE5tUjF6ZFY5UHJtSU5lNmlm?=
 =?utf-8?B?MXBVWW80KzdUNmFEVnB6UDNUSGNKYXlpT0dRYVRvOWpiUW5TUklTN1U4WWVy?=
 =?utf-8?B?TjFYQS96NExGVkVvU2daanpnSmd3cmxQeUpaUmJxd3RxR1l1a0JCWHpaYW00?=
 =?utf-8?B?TDcxWTNVUmlKTW9KOFNPUmRhVzF4VWZDT3Y5aGl5OWV0d0p2aThPeVczdWk4?=
 =?utf-8?B?Wk8wck5WVzhncEc2S01YdWNqZFBpZG1LbkdsNWdHMUpONVRoa0tKWUtyV0RD?=
 =?utf-8?B?RXpuYUtzZGJINDJBNjQ3RytQaDRqSFppSmxDMmFMazg3Z2w3ZXM1amVES3hO?=
 =?utf-8?B?WUZQV1Fpd0J3ZnB0dWFpaE1TVXZCM0VRaUdtQjhxbG5HR0lPaEFLOU9qaWt4?=
 =?utf-8?B?WWJxMGcrRzJzOG9sZVJocDhrWE0zMUhncW1nTG43b25GNzA0dXpKWTEzSno5?=
 =?utf-8?B?MnA2TThOM1VoajdwZnMvdERwVU9rOFpKcE9KZ1VZd2tvNytXbWpQaE5FZ2tR?=
 =?utf-8?B?UGhKNTJJVEFCbEVCK3BzQ2E5SFVhcjJhTzZFUTcwcnVXbk1BQ3NSdFF3SllO?=
 =?utf-8?B?ckp0Ym9kUEhGT0RZR2V6Z2xHQ3JpVU1qRzhlM09wdnVxeVREdGVTa0VCYTFj?=
 =?utf-8?B?dlZtZmNRa2RWbjdvYkphOFR5TzBpaEpUSVBSbTZPOFpkb3BZeTFZdDI3OTlG?=
 =?utf-8?B?R04waURCY3BHWWsxR1AvOVNaays2bTRNdE0wNzN1WUR1N2JjbUJ0WXBoR2Ir?=
 =?utf-8?B?OUZyWW9hQUxVcjV3NWh5OWFBdHFIY1hHSmt2ZS82SkUrYU1UOFQzY0orZFBF?=
 =?utf-8?B?emt4LzIzL3ZVTnBtY3ZlTHRLMlNkZndJb2ozc1RseGp5VFFhaE1ZR2J0SGVw?=
 =?utf-8?B?V2t5em1qSU5uSzFpYmw0R2kzYVR6cTN0U1hOUDlsZk9UdXhUWkxMV1FBNldp?=
 =?utf-8?B?UDFnT1EzZG4wL2dOSzhCSk9uVFFoQ0JRL3Y2T2Z6TFNOaUFrVkVuSFdkVmUr?=
 =?utf-8?B?Z1l5ajdhQ3F0anVuUSsrTVVxemlBV0tWWFVlS0xoWmpzeUJSZnAxUGZLVU5Q?=
 =?utf-8?B?QTkyc1VEVTlGL2ZhL3gzYzNSeng0WmUyM2hOUjdZU1QyMmNZbFptMy9rYVNu?=
 =?utf-8?B?OHRKWk9LbmxBVzVZNlRrMkR2OFdzR3grMEdEaThyaWZSNDhHeW93MTZBK3hK?=
 =?utf-8?B?c05kZ2o2czhuZWN4KzZlMFRqenRSREdsR0syR2Q4WHhYdHpwTUcxSjRKdk9y?=
 =?utf-8?B?MTlUREJ4U2dTa1VLZlFjOTFYRktZRncyUHRjUEE1ZkFMc3RNWFNncXEyY1o3?=
 =?utf-8?B?K3kwaDlxd2s4UVJTVmRBb1Jkb2gxSUZxdExta2xwQ2Z4OXE5KzljeVFQMlQr?=
 =?utf-8?B?UHRJQklyKzFFbTRwWmI3Wnh2bDZPdi9QRE9VQVNHUWx4Qmp0TlhMWTRkRTBv?=
 =?utf-8?B?Wkp6VWFnWWluVlhFbFU4c0dITldQRG9EaEIzdTZLSy9NazhwcXd5MjBDck96?=
 =?utf-8?B?dTk4SkFaM0cwWHhRSnJaSXc3UUZ4S0dKbW5mWmJ5R1o3M0plR1dwdGpLM0VJ?=
 =?utf-8?B?OGNGR1NCVC81cTUxTjMxaEpJODRBYjkwMWlpWVR3Q3N2a1VweFF6a2hXOGY3?=
 =?utf-8?B?cEUwYlcvQkN5UWt3ZXRRUU5QWjFRU0xzcFpXYzlZSHY5TEFyWVBjVVA1eE54?=
 =?utf-8?B?Q0VmUFdDWmZ6MlRsSEhMaThZMWVSdHhLMWdSdU03Q2FQOE0weTUwMnViWGZO?=
 =?utf-8?B?Ymw4ZlhCNGFFWGxoSkY2V014UEgvcHJTbENzSzZOYTgrb1p6QUV2TDFKbHJU?=
 =?utf-8?Q?1bKLgScR4+Btmsx4j2VztGa10VIjflq4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWt2TGVQa3ArOFhXU0Y3UjZ0NytVdXhWaUVSSHpnOVlQY216NW9jc3M4aUxH?=
 =?utf-8?B?bmREYXpESU90c3NaeVJ2YldyQUZhTTY0cGIvb3ZCNG5yR2hUcEFqcXBnVHBO?=
 =?utf-8?B?aWFBRCtQb1pGYWlFUWxnaTk1ZXlpSDVwK2F1VTdwUXAzWERvMTMrV25ra0ZE?=
 =?utf-8?B?akY3SFpHT1dSY051N2grS2k1SHBhcnB3a3hBZFlMYmVTc1J2UFZTZExXYmZI?=
 =?utf-8?B?dDJtWDlDMWhKUVR2akNRb2MxaS9uczJTM1Fra1d2UG1ON241RmwvenhiVDZo?=
 =?utf-8?B?akJRaENJajRFMFhSR2tFLytCQ3k2VExWOTRkWSsxclNSU1lhSi9PTnNiY3hW?=
 =?utf-8?B?QkZJdVhJWFZscHVqd3VMZTY5MWN1a3ZUR0tVNzh4RGlXQnQ2YW56ZGExVGhZ?=
 =?utf-8?B?azhDdy85UExyT1hYZFFXM1k2Qkc4clRzamorV1RyVG0wUjl1QjUzSVNDMk9L?=
 =?utf-8?B?ZlhPLzY4QWFiem84TlhaekhlY0NIZkVFUDNjbjNPTmlCRTl3WEVoQlZuTWgy?=
 =?utf-8?B?eG1yRXl1RGhsbm4wSzl5QXU1bkJMQ2Zab29oU1prMURpNENFVThjQUk1K2Vk?=
 =?utf-8?B?VjRXMHVJTHdxSmwybitpZVJMbzlzZG4yUFljazd5ak93cXc3VjJjTmxnTEZt?=
 =?utf-8?B?SUtINk9jVVVwcjAxY2hmOTQzTlpOLzlGMHRsK09heHNhakh4aFpzL3hpcEd3?=
 =?utf-8?B?WnhBaURHZXY5bkZXejg4OEJLcGhlUnR0VkVEbitHOEFMOS9DaGl5cnZKekc1?=
 =?utf-8?B?OGdoM3pWT3NDMzlwb245Kzc2TEx6K1VWK0tXRnA1L1FhV3FHaFcyUG1ab0oy?=
 =?utf-8?B?WmVDMTIzMHZiaDdQNlRFbjhkSUkySmNNOTh5ZVdKZmhEWjhGZGVIQmhPTEZE?=
 =?utf-8?B?RzlidlhmOTVwaGh4cktiZjM4Vm4yb1Y2blM0ZkIvOHNYeWphbVZRZzBWcjZ3?=
 =?utf-8?B?UFNaMHdvcG4yVEM2cDVpOGd1N2JmVVhTbmVLNDFoUHJSMGNocUx6YWRwTUVp?=
 =?utf-8?B?Nm5KTU9QNzV3TUFYNmkvekFaNG84eVdMbjdsWEs2d0lMQ1dQWU5lQ25lT1BJ?=
 =?utf-8?B?K1VINkozVFR3Si8zUHRLM0dnKzltUDlia1ZDVzhKekVkTXc3YzhwcmNkNHZS?=
 =?utf-8?B?Q1JTRXBWYXpZWngzdDhxOGRVSU84eUxMdUQxWVpiT0RRbTdZTHgzSVBDN2ww?=
 =?utf-8?B?VmpGTmw4TXRTSU5jSExlb0JsTHpLbkhMbERXRUZYK3hhRC9EQm1tdUZ0czB4?=
 =?utf-8?B?elpZd3ErdS9xY2h4YmdEQ09QZU1jUm1GOURiZnlET2VFTXN2TGJEeUVkV2FM?=
 =?utf-8?B?NmJHMGM0S2dxa25Uby9ybGNadTY2V1hLWC83enp2cUhRdm83K1BRK292VkVX?=
 =?utf-8?B?NlQyN3VWa1JNYitSdGNsZHVLMzU4VDdjSnJ6bmlqZnNyaEdOZ0lmMWRWdVo1?=
 =?utf-8?B?c0dJc0JIZlpVYWwvcU9TQnpuOFhhR3luL1lNTUVDL0tVT1ZQampvbSt4WHNE?=
 =?utf-8?B?ZXAwTG9YTnBvWDJ6SU1DTmR4bUE3T1Y1Y2l1b0ZFQ3pZOXJLWTBkbzhtbC8x?=
 =?utf-8?B?aWQ5QWd5Ujk0UVg4S2xuVVkvS1NBMUhXWVo0OVBhY1huYUNhRGxBREg5c3Bw?=
 =?utf-8?B?ZEhPOWNxMjNpdU4zNG9EU1cydFo4RTZVODYrd1JSTFFIcUJRUjg2eUwyaHNp?=
 =?utf-8?B?a21vUFNCWFhJQTFLeUk4UVN4V2JQQ0RTeTJremMyd3NrdDlyd3dvTlNhRDRV?=
 =?utf-8?B?eHB4WHp5K3BZbjYxdGxZNk1ydWRLSW5sY3I1NDBoejh6d0JsMS9oRkw0ZStk?=
 =?utf-8?B?RDRZT25mbFR6WTkwd1BjN1hiditVdEh5NzRNRFpBV2V0YS9hRHhlM2M0ZFhu?=
 =?utf-8?B?NEp1K0NJYnk3YkxneW5wT0tKa3hSbnJIQ0txV3VnTXRBR3pteC9lZXk4RFdx?=
 =?utf-8?B?Z3NLNzljeVhIWTQ5MDBqRVlFR1VzWnVLNUpkUDRrWTdLbFJ2b29GZEFSb2h6?=
 =?utf-8?B?YUd0cy92dFNIVHpaNlBIcXlDSk9BcVBqQW45ZzJCbDVxc2dYQVdKd3dJOEhv?=
 =?utf-8?B?WFZQa2puSW5VcVMxSlBaVkFydm1XSTdqa2hvcWlsU1JLWlk4N0k5aTEwaXFJ?=
 =?utf-8?B?a3lBaHR5Mk12T1VUVEhiYXhaL3dnOXVoM3hLU0VMY1QxY2hMYjFpbzNtcHJY?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2f38a0-7fff-422e-67b8-08dd4f2d868a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 08:31:50.5226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6gv8IbHoZDYpnEKFG6bus3PpDqBaOEQnxjgMv+eQMqIYDO7g6NPoFLZbqAz+MNt+64pNCGopS00pzWDjw+wXg1YUkEiXqqMVHXpX8lsAZpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5064
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVjaWVsc2thLCBLYXRhcnp5
bmEgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJy
dWFyeSAxNCwgMjAyNSAxMjoyNiBQTQ0KPiBUbzogU2hhcm1hLCBTd2F0aTIgPHN3YXRpMi5zaGFy
bWFAaW50ZWwuY29tPjsgS2FtaWwgS29uaWVjem55DQo+IDxrYW1pbC5rb25pZWN6bnlAbGludXgu
aW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+IFRhaHZhbmFpbmVu
LCBKYXJpIDxqYXJpLnRhaHZhbmFpbmVuQGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRD
SCBpLWctdF0gdGVzdHMva21zOiBEcm9wICdGdW5jdGlvbmFsaXR5JyBhbmQgJ1Rlc3QgY2F0ZWdv
cnknDQo+IGZyb20gZG9jdW1lbnRhdGlvbg0KPiANCj4gDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGFybWEsIFN3YXRpMiA8c3dhdGkyLnNoYXJtYUBpbnRlbC5j
b20+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMTQsIDIwMjUgODozNyBBTQ0KPiBUbzogS2Ft
aWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPjsgaWd0LQ0KPiBk
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBUYWh2YW5haW5lbiwgSmFyaSA8amFyaS50YWh2YW5h
aW5lbkBpbnRlbC5jb20+Ow0KPiBQaWVjaWVsc2thLCBLYXRhcnp5bmEgPGthdGFyenluYS5waWVj
aWVsc2thQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdF0gdGVzdHMva21z
OiBEcm9wICdGdW5jdGlvbmFsaXR5JyBhbmQgJ1Rlc3QgY2F0ZWdvcnknDQo+IGZyb20gZG9jdW1l
bnRhdGlvbg0KPiANCj4gSGkgS2FtaWwNCj4gDQo+IE9uIDExLTAyLTIwMjUgMDI6NDEgcG0sIEth
bWlsIEtvbmllY3pueSB3cm90ZToNCj4gPiBIaSBTd2F0aSwNCj4gPiBPbiAyMDI1LTAyLTEwIGF0
IDE2OjI2OjQ2ICswNTMwLCBTd2F0aSBTaGFybWEgd3JvdGU6DQo+ID4+ICdGdW5jdGlvbmFsaXR5
JyBzb2xlbHkgZGVwZW5kcyB1cG9uIGRldmVsb3BlcidzIGludGVycHJldGF0aW9uIGFuZA0KPiA+
PiAnVGVzdCBjYXRlZ29yeScgaXMgbm90IHVzZWQuIExldCdzIHJlbW92ZSB0aGVtIGZyb20gdGhl
IGttcyB0ZXN0cw0KPiA+PiBkb2N1bWVudGF0aW9uIHNvIHRoYXQgZG9jdW1lbnRhdGlvbiBjYW4g
YmUgbWFkZSBwcmVjaXNlIHdoaWNoIGlzIGVhc3kNCj4gPj4gdG8gbWFpbnRhaW4uDQo+ID4+DQo+
ID4gK2NjIEphcmkgYW5kIEthdGFyenluYQ0KPiA+IENjOiBKYXJpIFRhaHZhbmFpbmVuIDxqYXJp
LnRhaHZhbmFpbmVuQGludGVsLmNvbT4NCj4gPiBDYzogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGth
dGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCj4gPg0KPiA+IE9uZSBtb3JlIHRoaW5nIGlz
IHRoYXQgc3VjaCBjaGFuZ2Ugc2hvdWxkIGFsc28gdXBkYXRlICpqc29uIGZvcg0KPiA+IGV4YW1w
bGU6DQo+ID4NCj4gPiBncmVwIEZ1bmN0aW9uYWxpdHkgdGVzdHMvaW50ZWwvKmpzb24NCj4gPg0K
PiA+IHRlc3RzL2ludGVsL2k5MTVfdGVzdF9jb25maWcuanNvbjogIkZ1bmN0aW9uYWxpdHkiOiB7
DQo+IENoYW5nZSBoYXMgYmVlbiBkb25lIG9ubHkgZm9yIEtNUyBkb2N1bWVudGF0aW9uLg0KPiA+
IHRlc3RzL2ludGVsL2ttc190ZXN0X2NvbmZpZy5qc29uOiAgIkZ1bmN0aW9uYWxpdHkiOiB7DQo+
IEZvciBLTVMsIHRoaXMgZmllbGQgaXMgbm90ICJtYW5kYXRvcnkiLiBTbywgbm8gY2hhbmdlIHJl
cXVpcmVkIHRoZXJlLg0KPiBJZiBuZWVkZWQsIEkgY2FuIHJlbW92ZS4NCj4gDQo+IChLYXNpYSkg
SSByZW1lbWJlciB0aGF0ICdGdW5jdGlvbmFsaXR5JyBmaWVsZCBpcyBub3QgbmVlZGVkLiBNYXli
ZSBpdCB3b3VsZCBiZQ0KPiBnb29kIHRvIHJlbW92ZSBpdCBmcm9tIGttcyBqc29uIGZpbGUuDQo+
IEhvd2V2ZXIsIEkgYW0gbm90IHN1cmUgaWYgdGhpcyB3aWxsIG5vdCBhZmZlY3QgYnVpbGRpbmcg
YWxsIGRvY3VtZW50YXRpb24uIEphcmkgLQ0KPiBjb3VsZCBZb3UgbG9vayBhdCB0aGlzIHByb3Bv
c2FsPw0KDQpBY2sgZm9yIHRoZSBjaGFuZ2UsIHN0aWxsIGhhdmluZyBhbiBvcGluaW9uIHRoYXQg
d2UgYXJlIGxvc2luZyBzb21lIGdyYW51bGFyaXR5IHRoYXQgd2UgbWlnaHQgd291bGQgbGlrZSB0
byBoYXZlIGF0IHNvbWUgcG9pbnQuIEJ1dCBJIGNhbiBsaXZlIHdpdGggdGhpcywgYW5kIHBlciBt
eSB1bmRlcnN0YW5kaW5nIGRvY3VtZW50YXRpb24gYW5kIG90aGVyIGFyZWFzIHVzaW5nIHRoZXNl
IGRvY3VtZW50YXRpb24gdGFncyB3aWxsIG5vdCBiZSBicm9rZW4gYnkgdGhpcyBjaGFuZ2UuIA0K
UGVyc29uYWxseSwgSSB3b3VsZCBrZWVwIEZ1bmN0aW9uYWxpdHkgYXMgcGFydCBvZiB0aGUganNv
biBmb3Igbm93IGJlaW5nIG9wdGlvbmFsLiBJZiBzbyBkZWNpZGVkIG9uZSBjYW4gY2xlYW4ga21z
IGpzb24sIGFuZCBJIGNhbiBsaXZlIHdpdGggdGhpcyB0b28uDQoNCkJyLCBKYXJpDQoNCj4gDQo+
IEthc2lhDQo+IA0KPiA+IHRlc3RzL2ludGVsL3hlX3Rlc3RfY29uZmlnLmpzb246ICAgIkZ1bmN0
aW9uYWxpdHkiOiB7DQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IEthbWlsDQo+ID4NCj4gPj4gU2ln
bmVkLW9mZi1ieTogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gPj4g
LS0tDQo+ID4+ICAgdGVzdHMvY2hhbWVsaXVtL2ttc19jaGFtZWxpdW1fYXVkaW8uYyAgIHwgICA1
IC0NCj4gPj4gICB0ZXN0cy9jaGFtZWxpdW0va21zX2NoYW1lbGl1bV9jb2xvci5jICAgfCAgIDIg
LQ0KPiA+PiAgIHRlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2VkaWQuYyAgICB8ICAxMSAt
LQ0KPiA+PiAgIHRlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2ZyYW1lcy5jICB8ICAxMSAt
LQ0KPiA+PiAgIHRlc3RzL2NoYW1lbGl1bS9rbXNfY2hhbWVsaXVtX2hwZC5jICAgICB8ICAyNiAt
LS0tLQ0KPiA+PiAgIHRlc3RzL2ZiZGV2LmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiAtDQo+ID4+ICAgdGVzdHMvaW50ZWwvaTkxNV9waXBlX3N0cmVzcy5jICAgICAgICAgIHwgICAz
IC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMgICAgICAgICAgICAgICAgfCAgMTEg
LS0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfYnVzeS5jICAgICAgICAgICAgICAgICAgfCAgIDMg
LQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19jY3MuYyAgICAgICAgICAgICAgICAgICB8ICAgNCAt
DQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX2NkY2xrLmMgICAgICAgICAgICAgICAgIHwgICAyIC0N
Cj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jICAgICAgICAgICAgICAgfCAgIDMgLQ0K
PiA+PiAgIHRlc3RzL2ludGVsL2ttc19kcF9saW5rdHJhaW5fZmFsbGJhY2suYyB8ICAgMiAtDQo+
ID4+ICAgdGVzdHMvaW50ZWwva21zX2RyYXdfY3JjLmMgICAgICAgICAgICAgIHwgICAyIC0NCj4g
Pj4gICB0ZXN0cy9pbnRlbC9rbXNfZHNjLmMgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+
PiAgIHRlc3RzL2ludGVsL2ttc19mYl9jb2hlcmVuY3kuYyAgICAgICAgICB8ICAgMiAtDQo+ID4+
ICAgdGVzdHMvaW50ZWwva21zX2ZiY29uX2ZidC5jICAgICAgICAgICAgIHwgICA1IC0NCj4gPj4g
ICB0ZXN0cy9pbnRlbC9rbXNfZmVuY2VfcGluX2xlYWsuYyAgICAgICAgfCAgIDIgLQ0KPiA+PiAg
IHRlc3RzL2ludGVsL2ttc19mbGlwX3NjYWxlZF9jcmMuYyAgICAgICB8ICAxMiAtLQ0KPiA+PiAg
IHRlc3RzL2ludGVsL2ttc19mbGlwX3RpbGluZy5jICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAg
dGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgIHwgMTQ3IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19qb2luZXIuYyAgICAgICAgICAg
ICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX2xlZ2FjeV9jb2xvcmtleS5jICAg
ICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfbW1hcF93cml0ZV9jcmMuYyAgICAg
ICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19waXBlX2JfY19pdmIuYyAgICAgICAg
ICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3BtX2JhY2tsaWdodC5jICAgICAgICAg
IHwgICA1IC0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyAgICAgICAgICAgICAgICAg
fCAgIDggLS0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcG1fbHBzcC5jICAgICAgICAgICAgICAg
fCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19wbV9ycG0uYyAgICAgICAgICAgICAgICB8
ICAxNSAtLS0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcHNyLmMgICAgICAgICAgICAgICAgICAg
fCAgMzMgLS0tLS0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21zX3BzcjJfc2YuYyAgICAgICAgICAg
ICAgIHwgIDI1IC0tLS0NCj4gPj4gICB0ZXN0cy9pbnRlbC9rbXNfcHNyX3N0cmVzc190ZXN0LmMg
ICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ludGVsL2ttc19wd3JpdGVfY3JjLmMgICAgICAg
ICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zXzNkLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNfYWRkZmJfYmFzaWMuYyAgICAgICAgICAgICAg
ICAgfCAgMTcgLS0tDQo+ID4+ICAgdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgICAgICAgICAgICAg
ICAgIHwgICA0IC0NCj4gPj4gICB0ZXN0cy9rbXNfYXRvbWljLmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDQgLQ0KPiA+PiAgIHRlc3RzL2ttc19hdG9taWNfaW50ZXJydXB0aWJsZS5jICAgICAg
ICB8ICAgNiAtDQo+ID4+ICAgdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uLmMgICAgICAgICAg
IHwgICA0IC0NCj4gPj4gICB0ZXN0cy9rbXNfYncuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ttc19jb2xvci5jICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zX2NvbmN1cnJlbnQuYyAgICAgICAgICAgICAgICAgIHwg
ICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgICAgICAgICAgfCAg
IDcgLS0NCj4gPj4gICB0ZXN0cy9rbXNfY3Vyc29yX2NyYy5jICAgICAgICAgICAgICAgICAgfCAg
IDUgLQ0KPiA+PiAgIHRlc3RzL2ttc19jdXJzb3JfZWRnZV93YWxrLmMgICAgICAgICAgICB8ICAg
MiAtDQo+ID4+ICAgdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyAgICAgICAgICAgICAgIHwgICAy
IC0NCj4gPj4gICB0ZXN0cy9rbXNfZGlzcGxheV9tb2Rlcy5jICAgICAgICAgICAgICAgfCAgIDMg
LQ0KPiA+PiAgIHRlc3RzL2ttc19kaXRoZXIuYyAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAt
DQo+ID4+ICAgdGVzdHMva21zX2RwX2F1eF9kZXYuYyAgICAgICAgICAgICAgICAgIHwgICAyIC0N
Cj4gPj4gICB0ZXN0cy9rbXNfZmVhdHVyZV9kaXNjb3ZlcnkuYyAgICAgICAgICAgfCAgIDcgLS0N
Cj4gPj4gICB0ZXN0cy9rbXNfZmxpcC5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTQgLS0t
DQo+ID4+ICAgdGVzdHMva21zX2ZsaXBfZXZlbnRfbGVhay5jICAgICAgICAgICAgIHwgICAyIC0N
Cj4gPj4gICB0ZXN0cy9rbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMgICAgICAgfCAgIDMgLQ0K
PiA+PiAgIHRlc3RzL2ttc19nZXRmYi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCAtDQo+
ID4+ICAgdGVzdHMva21zX2hkbWlfaW5qZWN0LmMgICAgICAgICAgICAgICAgIHwgICAzIC0NCj4g
Pj4gICB0ZXN0cy9rbXNfaGRyLmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTAgLS0NCj4g
Pj4gICB0ZXN0cy9rbXNfaW52YWxpZF9tb2RlLmMgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+
PiAgIHRlc3RzL2ttc19sZWFzZS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+
ICAgdGVzdHMva21zX211bHRpcGlwZV9tb2Rlc2V0LmMgICAgICAgICAgIHwgICAyIC0NCj4gPj4g
ICB0ZXN0cy9rbXNfcGFuZWxfZml0dGluZy5jICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAg
IHRlc3RzL2ttc19waXBlX2NyY19iYXNpYy5jICAgICAgICAgICAgICB8ICAgNSAtDQo+ID4+ICAg
dGVzdHMva21zX3BsYW5lLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICA3IC0tDQo+ID4+ICAg
dGVzdHMva21zX3BsYW5lX2FscGhhX2JsZW5kLmMgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0
ZXN0cy9rbXNfcGxhbmVfY3Vyc29yLmMgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRl
c3RzL2ttc19wbGFuZV9sb3dyZXMuYyAgICAgICAgICAgICAgICB8ICAgMyAtDQo+ID4+ICAgdGVz
dHMva21zX3BsYW5lX211bHRpcGxlLmMgICAgICAgICAgICAgIHwgICAzIC0NCj4gPj4gICB0ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jICAgICAgICAgICAgICAgfCAgIDYgLQ0KPiA+PiAgIHRlc3Rz
L2ttc19wcm9wX2Jsb2IuYyAgICAgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMv
a21zX3Byb3BlcnRpZXMuYyAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9r
bXNfcm90YXRpb25fY3JjLmMgICAgICAgICAgICAgICAgfCAgIDUgLQ0KPiA+PiAgIHRlc3RzL2tt
c19zY2FsaW5nX21vZGVzLmMgICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21z
X3NlbGZ0ZXN0LmMgICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNf
c2VxdWVuY2UuYyAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIHRlc3RzL2ttc19z
ZXRtb2RlLmMgICAgICAgICAgICAgICAgICAgICB8ICAgMyAtDQo+ID4+ICAgdGVzdHMva21zX3N5
c2ZzX2VkaWRfdGltaW5nLmMgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy9rbXNfdGls
ZWRfZGlzcGxheS5jICAgICAgICAgICAgICAgfCAgIDMgLQ0KPiA+PiAgIHRlc3RzL2ttc190dl9s
b2FkX2RldGVjdC5jICAgICAgICAgICAgICB8ICAgMiAtDQo+ID4+ICAgdGVzdHMva21zX3ZibGFu
ay5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEwIC0tDQo+ID4+ICAgdGVzdHMva21zX3Zyci5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5IC0tDQo+ID4+ICAgdGVzdHMva21zX3dyaXRl
YmFjay5jICAgICAgICAgICAgICAgICAgIHwgICAyIC0NCj4gPj4gICB0ZXN0cy90ZXN0ZGlzcGxh
eS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KPiA+PiAgIDgxIGZpbGVzIGNoYW5nZWQs
IDU1MiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPiAuLi5jdXQuLi4NCj4gPg0KDQo=
