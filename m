Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3071CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 06:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4B610E0F4;
	Wed,  1 Oct 2025 06:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNCv/kB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B96910E0F4
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 06:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759301413; x=1790837413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n6pSxtjsU/xqa4QJfK1Rudad41KYmRVUYcqNQRriBTQ=;
 b=NNCv/kB4oIYCedVgmy0eV7eDwrPTLtM4KTiKuHF3BvrZa022Ia8bGaua
 tlOwEEMp7lBWr9ovOdah3R6KE9u8qv4xd+epzHNpNHunw6BxYh9WkLsse
 U5aM0VAuw2mcFFLvkq9Viq8yFij06Ibv9axAkJ6rLMlKri/lpDrnGmt4A
 XAMpZ2V07EvYr6Pdm3uhuZHuvceblnCnmMQQAPZwcygN9ARJsNMJEkQcW
 X8m2jGtinQfiXZgwnhtzZa1ReSfUENr+Tl5+W3x6hK4LlCZYlpgybp/uW
 T7/HnBAIgaaLCyFmInTXcIIZ3/B6aYEnJjz/2y/IvMLCFc6gtQAOgeAQq Q==;
X-CSE-ConnectionGUID: x0aejc+zS2SYLiqRwmU77A==
X-CSE-MsgGUID: 8bvYB2oNQO26rLZ09LMQQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64186215"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="64186215"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:50:13 -0700
X-CSE-ConnectionGUID: AENU/vthTeSpjOn1IGcPhw==
X-CSE-MsgGUID: AEoYtmX3Swyf7qt9pO9/xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="182999606"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:50:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:50:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 23:50:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 23:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YCUSyOOXDDgZCAdURrtA7sDuCaKZ4HYmroghgDHyGfzzsZhNHqoL/tFmLI/5GbzFpGDg9AAgRxDjsocmRdqOTK8pXBCerYw3qlaClR/vNums0hPbF2udhwzXOlnYTh8PJ7Y8KBpFTxK8fR44QM69aEy7Mg5iaJ6atzdOmxUmxlA+3BnxSp0Yh+AVa2ur2wv3YUka5pPBak9tCXmekdhqLkCEkcCDB1ZW7Wy854MM2gtV1fOO3aTqy7l2veU7PscX9qTqAwLCNgegD7VomRNrSn4OAAh447uZMlNKG8s3QrCJgJ3pZgoDDjPqfb+P1235Zmaoo3xcIWUjJLpVe/Ut8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6pSxtjsU/xqa4QJfK1Rudad41KYmRVUYcqNQRriBTQ=;
 b=nKWid7tmTZT5YOleBN39m2WF33lQMbBLaxwas7coom+jGbWG7eONTm7UE6dSi1+Fdl7JuSo9wr/Qfx0zZbj+Vb6hPjfWvc2uRDIyGpFEd3x0Dbn2ogmgO3BjGDOKyaPCY+gc30mA2NCx3p3PC2SrSMLS9Exm4vC6HtFE0PMr02/xiDxTX6U3P8kblGRd97Hx30afoqOne+SvIMHIT+zmlM0BiwMzAmlk899EQcJc+zDHj9BkGN2UslcjQmtBRCRV2dALh1QEA2TQUydSLNUYd+k8Tq0dIjP1Dp2EKyX5queZu3UasG+eCpnapxJdnilZSYbt0CWufOhogE6sIDXzsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14)
 by CY5PR11MB6281.namprd11.prod.outlook.com (2603:10b6:930:23::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 06:50:03 +0000
Received: from SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48]) by SN7PR11MB7489.namprd11.prod.outlook.com
 ([fe80::7a00:833c:79b:5e48%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:50:03 +0000
From: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH i-g-t 1/2] lib/xe_util: Add xe fast-copy helper
Thread-Topic: [PATCH i-g-t 1/2] lib/xe_util: Add xe fast-copy helper
Thread-Index: AQHcMhb51avWG9qqQEeStP7xrh07uLSszXdw
Date: Wed, 1 Oct 2025 06:50:03 +0000
Message-ID: <SN7PR11MB74897EA7DCD702B4AF4D6BB185E6A@SN7PR11MB7489.namprd11.prod.outlook.com>
References: <20250930143130.186193-4-zbigniew.kempczynski@intel.com>
 <20250930143130.186193-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20250930143130.186193-5-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7489:EE_|CY5PR11MB6281:EE_
x-ms-office365-filtering-correlation-id: c02bae90-8770-4a4f-8598-08de00b6bfd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QWRTL3MyaVRDdG13NGxUbEE1K0lXemtkQklYc3lRL2s2WVZTak9DVjMyTXp4?=
 =?utf-8?B?bXpYZTRpV0lRRmxCZ1doU2NNQVFYOHNjVVpWUGhsbWVZc3RWRDRyMHYrZ1h5?=
 =?utf-8?B?aEN1ZEZ0N25xMDcrdVhrSDlPbFBnRThsTk04b080L3YwQks5WVU5ZVg0dmw0?=
 =?utf-8?B?YXljTnRQN3hiTDJwS0N1TFhwclBYUkNxN2dGUE5kdDBacXZ4UFNoaXdTYkRE?=
 =?utf-8?B?VHVyaGt4TUljUzlLSVRJNUx0R0RKQkxtVGt1ZTJ3Z01jeldUc1BUeHhzMHdv?=
 =?utf-8?B?VkQweWl4K2N2RzZwMGRtY0NKUitXQ3Z0MnVGZ0pKcWFEQWVPc0dlV2pma1JQ?=
 =?utf-8?B?V1pEb2xlS2NyL2M3T0E0VU0zQWJ5dHBkN29ZbU5tdW5EeHdLZDg2alNNbzRr?=
 =?utf-8?B?c2tSSXFaQjJVc0s0L21VNG1PcExUTjVEOWtVVTFBYXRjVzllTEtUcUJTWmRV?=
 =?utf-8?B?NER5MUV0OVF4SVBIYnV4SitnTFFzYkRvdmlaYnhMSHp2YTNVUXlyUzI3Umls?=
 =?utf-8?B?NUNFRHkrMzR1ZitjL2IvWUxuYU8yc1BDTWVSbittc1FSM0NLdm9scjJlSjdW?=
 =?utf-8?B?ZUVSNGtxM3h4MTJlS1BoR0wzbExDQmYzN01uLzBvSEVJUkRLUE5EUnIvU0VE?=
 =?utf-8?B?L0w0NnVrcVFsMDdldWt6QkVjLyt0dFd5dVgydTNVRm1DbGUxRnJnQURsdXpw?=
 =?utf-8?B?KzRYNHVaVGJkYmtDUDNrbTc3SFNjYjlwSXhPMThkOW5yRmh2QVkvT2NtTDAx?=
 =?utf-8?B?TFRGZ1JJZXJFa0IrZHdzRXdHQUJFQWdteUFWZkRUL1ZCdVZxVEVFMVd5QlVl?=
 =?utf-8?B?OUxKOHZrMWx3c1V6bVNQRmdaeUx6OW1DSHVxaFlJem5lQUhOR05ocjh4VUdj?=
 =?utf-8?B?LzFCYUJOOUFqb3duOGxWa3M1TXhUM3RTTDhHWW05SlpWcmpWN21keHZGRXJj?=
 =?utf-8?B?aEdrNmRheTJZZFdIQUpNV3BYVlVpNHdEM1h1aldTbk5FU01wRWFJU2xWMWRa?=
 =?utf-8?B?cjROVHRWclhLc1IyYko5UnFNOHJiNzVjaFRGTGw4ZjNPYWpVd09Ha2hCVXlR?=
 =?utf-8?B?YkkyeTlJSW11TW5Bc0NOUlRxdDZzNFJPam9jb0FmbGFzWml0RFV2L1VHMWZo?=
 =?utf-8?B?OEg2YzIzZmxHUnlVUGVRRmZCQlNtaGFsYnIwNDVDNUpVQSs5c0t0dmZuMTV1?=
 =?utf-8?B?SDlkM2cwL1FZekhBUXJ5R0pCMndSRFMvQ1VxYk1jM2dDWjVnTCsyMTdJUU93?=
 =?utf-8?B?b3dpZlhlYkYrZjE2ZGRVdmdEaFpQbkRWd01lVk84aXNrVWNjRldYSVZqRDlJ?=
 =?utf-8?B?bytqbDNQZUYreGpsVWRWYWt3WlRMdEdrUTJVaENZbDZlRnZCV3JSN3oxRUlK?=
 =?utf-8?B?OUlvbDEvQ2YwMFhNbFFPZGlFeWNDdk9QVUFIRWNHd1l6RytZc1VBQ0h2S1Jh?=
 =?utf-8?B?YUVFNnM2SFN1b1d4VWJSV0l5OVRRM09VbGVLckIxYlJuMi9PWlJDQlRoTGxN?=
 =?utf-8?B?TWtGZGpjL0R5ZWtNRlY4Tkh1cXh6d1VNZWcxTTF1ZzlIS25mZGJPdHROZDVJ?=
 =?utf-8?B?QzhadFBuYVp1K0hlY0tQU2psVzNjMFNWMUluai9hS2ZNeU5qR0NKazVGZ1ly?=
 =?utf-8?B?TXBPc2QrdHVDcmlPSnlqT1pUT2s4Ni9ocGIwQ0VZWTFZcGttVUxLTUZSN1FC?=
 =?utf-8?B?VXNnZnAwZnhYNkVjL0dmNDFPc3drbFZNUllDMW16U1p0VjU1SmNHK3YzWWNW?=
 =?utf-8?B?OWptTFk5WGNDZmZ2SEgzZC9USFFEU1VyNzNPRC9hbkkzQ2VwUjhPTERoQ3Fl?=
 =?utf-8?B?YUs3TXlOOG1JZmc5MnFhWUg5bzNOK256TmgrRFpVYjNsakEzS0V6cWIrbWFn?=
 =?utf-8?B?ZWdpc3oyK3M0bi9VeFZlMW5leGF1ZUxEVVVNZVZhZHFNbkJrM1BrMUFVZUcv?=
 =?utf-8?B?SjJQdFFrVXFoZFBVRXd4bG9IcktFd3BPMFNtdjh6Tk0wVkp1cGNadVh2Z0pJ?=
 =?utf-8?B?MHZDVkd0RHU2YUpYTFlFN2ZsMzA5WDZRcUwyNTlQQklUclpGcVQydDFMVllm?=
 =?utf-8?Q?wVzloD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7489.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlFkOW9aN3JIRCtnRjBDNGZKREtiY2F6bVNKc3VjaVREdGdiL2F6NzdtQWx5?=
 =?utf-8?B?czFzU3dSSit0VFJJenFKTjJZUHJ3VWMrVHg1WTRVSDlpYnlRUVRGczNWdHpw?=
 =?utf-8?B?UmZONFU4eTk1NENiRmdKMnpSV3R1aFMxMy9QWWZqZDREN0RtTEVhQTE2ZTZw?=
 =?utf-8?B?ZHNza2pLanpXZkplQzNsby91QXQrZ2ltNW9aREdvVEFEVzNscjJ3Y2prekZX?=
 =?utf-8?B?aEMxSEo5OVNPY0t2S2ZjOXZTZUpQaTQ4bC9oektSQTJSM1c5b3d0VzBYY3g1?=
 =?utf-8?B?ZHdjODlLdGZHZVFkb1VyNEdDeG5naGJuSlM5SDFPTUptTUlKT05vNC9QcVFE?=
 =?utf-8?B?QnpMTTZzeWNVTnBWK2RCK2g2VFVENkluZTJlYnNaQ1hyYWE0aGJMS29MQ2Z3?=
 =?utf-8?B?aEM0WmFhZE85MEJXRWFGOUs2a2xpZWUvNm5aQTBuUWVmWFBTRkFySi9rbXpl?=
 =?utf-8?B?cnU0NE9pUXA3UjhEbHNDd1hDZThnVXZPcVI3YUU2VWI0WWUxUHp1bGpIYU9a?=
 =?utf-8?B?VUhuSEl1TWxFYytEVDl1blBPclhYL3hjdU9zMmNpc21sSFZ1R2hmQWgzSGNL?=
 =?utf-8?B?R1VjYmQ2aFRySkhlZm5hQmc5eks4RTlhN2NHRnFneUp1aktVV3NzN3dxS3Mr?=
 =?utf-8?B?YzV3ZjZTeTVEMml6KzBJUFVnRi9VTFpTWHpETzJaeGVkSGwwOExmZWhCNXJT?=
 =?utf-8?B?b3RPdldNRC9KUUlSSVZoTFB6Ryt0WTkwOTNRR1E3M3ZMV2dsVzV4ZGIwb3Yy?=
 =?utf-8?B?VitIZnBDNTgxa3NsWms2SC9SZnhYOW9LbmJscUV4VVgvZzVQTW8zNmUzSGRG?=
 =?utf-8?B?RzM2YUFqN0phMS9hcE5pYklQbkYvcEEwTndOcVVWaEhCY0p3bVZzUmFZc0h0?=
 =?utf-8?B?SGZJMlZtVWFHaGJIZ3pRNFFWbUd5UlNVQVh1YzRTUzJFRlMvMDRlbGlhYkNa?=
 =?utf-8?B?VnlkRHh0TlJwMSs2MTBJQ2JEcjFCOVZDcGVmOXdaUnN3Zy9qMHYyWm10K3BC?=
 =?utf-8?B?SjViOUxPcjFoZUdxOHFqNmp4dkdJcG1mSFVSRmZkV1NlOTc5RjBjN0pjeGVQ?=
 =?utf-8?B?QTR2VkVjbkI3VmhZbDhOQS9DNjJQVzZvTTROVUl5OHE3UW5HV1VlMDg1cS9E?=
 =?utf-8?B?VHFNdE1BbVBWdktBeTYwVWoyZWpFVjhFQzNmM2lieXJ3N21sSENCT1hVc3Mx?=
 =?utf-8?B?VXdlQ1owbVNZdzJ6Y2V4YkdNTWRORVduRmh2V2swTTV0bzEwb1ZVTTU0aW1u?=
 =?utf-8?B?bGpLeWxoTHUwWlZkQy9Xb28wSkltWE94UktRQURoazhxc3BLdkt6VXp4czgw?=
 =?utf-8?B?ZHcwdk81bUxxVzlRZ2NkYWVocUpRbjl2L2NXTmNoL29zN21WWCtRakdHdk1E?=
 =?utf-8?B?bml1ZEdwT2NsMTdob0s5YU9wK1d3WEd6Z3VKZWNOMngzbm5nRU5wdll6YldJ?=
 =?utf-8?B?ZVlmcG5SRVJvZi82cXVKb3Y1NkNCSVJOSzVwV041Nm9DMW1PWGJvanZxajl4?=
 =?utf-8?B?TTc0TGxuRHRrRlhuWU9sdHBQL3Z5cXkvRk9CcVZwd1ZDbmduMXl4MTdiSTZV?=
 =?utf-8?B?NERXWldTZlFZYXE5UWkwT0RJdzNrdElCNnFJblNhbndKcE5Mb1dYS3BWam4r?=
 =?utf-8?B?SmZ0MWI2elhKMzgzRGFLcDJHam1UUDJMZzQ1cEN3OGV4MWQwanM1K2VrdGYz?=
 =?utf-8?B?RU13Y2o4NEoxRUt3SW9XWGN6SlJnUVFUOS9OUmN5S3BkOVdNOWtUaVYrL0Ur?=
 =?utf-8?B?aG9tRmhCaHVmL2dzenlOQ0llc1RoWWxydFg3UGtNZzlqTlMwZUcyajVpSUZS?=
 =?utf-8?B?VktJM1ZUQkVsTUdYOVB0TWVVUUx5U2VIdU5WbFVSTmRkVkZvYXpwTDNqUGow?=
 =?utf-8?B?SVA3T0s2QWxGYVdIT1c3cDZXRXJWL2krcWVkamlDWndNQ1ZvSGtIUWpqRDB4?=
 =?utf-8?B?cER1dktxZU1FTkZWYkdncU1IOWVvUmU0b1YvYTlhTjg1Wll5L2cyQ2NsVmxT?=
 =?utf-8?B?eGducERZVU90RmFqUUZQT1FxYzg4SkVoT1Uzb2M1d1VneDZSdS9WQnlDQW1u?=
 =?utf-8?B?T2RFSG1iOExZK01VU2xLZE95UzcyOG9Ha1QraVBla2pnb2pMNmJ0d3dNTzYz?=
 =?utf-8?B?SzBPa050dHZEWUN6K2g0Nm1WNndzOVZLNDdja1NGMmtIVlJ5M0kvNFZTdlpr?=
 =?utf-8?Q?w8sj0vG9yQY+y2lGFj+mOVeDqOUHfbZup/y2YgzoIRy4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7489.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02bae90-8770-4a4f-8598-08de00b6bfd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 06:50:03.5648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqCqsED1Z/70FjKluNguB6Tcvktjnan5JXX67ndYbysA0dTDoaPx0vwT1LEbgbhm1Y8xuSSCQWuxWq2Xbq4kpDhFOuddki/hLGc5yd5S974=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6281
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEtlbXBjenluc2tpLCBaYmln
bmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBTZW50OiAzMCBTZXB0ZW1i
ZXIgMjAyNSAyMDowMg0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsg
QXVsZCwNCj4gTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT47IEdveWFsLCBOYWtzaHRy
YQ0KPiA8bmFrc2h0cmEuZ295YWxAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQg
MS8yXSBsaWIveGVfdXRpbDogQWRkIHhlIGZhc3QtY29weSBoZWxwZXINCj4gDQo+IEluIFhlMiBh
bmQgYmV5b25kIGZhc3QtY29weSBiZXR3ZWVuIG9iamVjdHMgd2l0aCBkaWZmZXJlbnQgcGF0IGlu
ZGljZXMgaXMNCj4gcXVpdGUgY29tbW9uIG9wZXJhdGlvbi4gQWRkIGZhc3QtY29weSBoZWxwZXIg
d2hpY2ggcmVxdWlyZXMgb25seSBzcmMvZHN0IGJvDQo+IGhhbmRsZSwgcmVnaW9uLCBwYXQgaW5k
ZXggYW5kIHNpemUgb2Ygb3BlcmF0aW9uLg0KPiBJdCBpcyBob3dldmVyIGxpbWl0ZWQgdG8gc2l6
ZSBiZWluZyBtdWx0aXBsZSBvZiA0S2lCIGFuZCBsZXNzZXIgb3IgZXF1YWwgMTZNaUINCj4gYnV0
IHRoaXMgbGltaXRhdGlvbiBtYXkgcmVtb3ZlZCBpZiB0aGVyZSB3aWxsIGJlIHVzZXIgb2YgdGhp
cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcu
a2VtcGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRA
aW50ZWwuY29tPg0KPiBDYzogTmFrc2h0cmEgR295YWwgPG5ha3NodHJhLmdveWFsQGludGVsLmNv
bT4NCj4gLS0tDQo+ICBsaWIveGUveGVfdXRpbC5jIHwgODANCj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICBsaWIveGUveGVfdXRpbC5oIHwgIDUg
KysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg1IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9saWIveGUveGVfdXRpbC5jIGIvbGliL3hlL3hlX3V0aWwuYyBpbmRleCA5NjI4NzQyM2Zm
Li42MjQ2ODQxZTYxDQo+IDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfdXRpbC5jDQo+ICsrKyBi
L2xpYi94ZS94ZV91dGlsLmMNCj4gQEAgLTcsNiArNyw4IEBADQo+ICAjaW5jbHVkZSAiaWd0X2Nv
cmUuaCINCj4gICNpbmNsdWRlICJpZ3Rfc3luY29iai5oIg0KPiAgI2luY2x1ZGUgImlndF9zeXNm
cy5oIg0KPiArI2luY2x1ZGUgImludGVsX2JsdC5oIg0KPiArI2luY2x1ZGUgImludGVsX21vY3Mu
aCINCj4gICNpbmNsdWRlICJpbnRlbF9wYXQuaCINCj4gDQo+ICAjaW5jbHVkZSAieGUveGVfaW9j
dGwuaCINCj4gQEAgLTI4MCwzICsyODIsODEgQEAgdWludDMyX3QgeGVfbnNlY190b190aWNrcyhp
bnQgZmQsIGludCBndF9pZCwgdWludDY0X3QNCj4gbnNlYykNCj4gDQo+ICAJcmV0dXJuIGRpdjY0
X3U2NF9yb3VuZF91cChuc2VjICogcmVmY2xvY2ssIE5TRUNfUEVSX1NFQyk7ICB9DQo+ICsNCj4g
Ky8qKg0KPiArICogeGVfZmFzdF9jb3B5OiBzaW1wbGlmeSBmYXN0LWNvcHkgZnJvbSBzcmMgdG8g
ZHN0IGJvDQo+ICsgKiBAZmQ6IG9wZW5lZCBkZXZpY2UNCj4gKyAqIEBzcmNfYm86IHNyYyBibyBo
YW5kbGUNCj4gKyAqIEBzcmNfcmVnaW9uOiBzcmMgcmVnaW9uDQo+ICsgKiBAc3JjX3BhdF9pbmRl
eDogc3JjIHBhdCBpbmRleA0KPiArICogQGRzdF9ibzogZHN0IGJvIGhhbmRsZQ0KPiArICogQGRz
dF9yZWdpb246IGRzdCByZWdpb24NCj4gKyAqIEBkc3RfcGF0X2luZGV4OiBkc3QgcGF0IGluZGV4
DQo+ICsgKiBAc2l6ZTogc2l6ZSBpbiBieXRlcyBmb3IgY29weS4gQ3VycmVudGx5IGhhcyBsaW1p
dGF0aW9uIHRoYXQgaXQNCj4gK3JlcXVpcmVzDQo+ICsgKiBzaXplIGFsaWduZWQgdG8gNEtpQiBh
bmQgbXVzdCBiZSA8PSAxNk1pQi4NCj4gKyAqDQo+ICsgKiBTaW1wbGlmeSBjb21tb24gZmFzdC1j
b3B5IGZyb20gb25lIGJvIHRvIGFub3RoZXIuIFNlZSBAc2l6ZQ0KPiArcmVnYXJkaW5nDQo+ICsg
KiBvcGVyYXRpb24gbGltaXRhdGlvbi4NCj4gKyAqLw0KPiArdm9pZCB4ZV9mYXN0X2NvcHkoaW50
IGZkLA0KPiArCQkgIHVpbnQzMl90IHNyY19ibywgdWludDMyX3Qgc3JjX3JlZ2lvbiwgdWludDhf
dCBzcmNfcGF0X2luZGV4LA0KPiArCQkgIHVpbnQzMl90IGRzdF9ibywgdWludDMyX3QgZHN0X3Jl
Z2lvbiwgdWludDhfdCBkc3RfcGF0X2luZGV4LA0KPiArCQkgIHVpbnQ2NF90IHNpemUpDQo+ICt7
DQo+ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgaW5zdCA9IHsNCj4gKwkJ
LmVuZ2luZV9jbGFzcyA9IERSTV9YRV9FTkdJTkVfQ0xBU1NfQ09QWSwNCj4gKwl9Ow0KPiArCXN0
cnVjdCBibHRfY29weV9kYXRhIGJsdCA9IHt9Ow0KPiArCXN0cnVjdCBibHRfY29weV9vYmplY3Qg
c3JjID0ge307DQo+ICsJc3RydWN0IGJsdF9jb3B5X29iamVjdCBkc3QgPSB7fTsNCj4gKwlpbnRl
bF9jdHhfdCAqY3R4Ow0KPiArCXVpbnQ2NF90IGJiX3NpemUsIHN0cmlkZSwgd2lkdGgsIGhlaWdo
dDsNCj4gKwl1aW50MzJfdCB2bSwgZXhlY19xdWV1ZSwgYmI7DQo+ICsJdWludDMyX3QgYWxpZ25t
ZW50ID0geGVfZ2V0X2RlZmF1bHRfYWxpZ25tZW50KGZkKTsNCj4gKwl1aW50NjRfdCBhaG5kOw0K
PiArCWludCBjcHAgPSA0Ow0KPiArDQo+ICsJaWd0X3JlcXVpcmUoc2l6ZSAlIFNaXzRLID09IDAp
Ow0KPiArCWlndF9yZXF1aXJlKHNpemUgPD0gU1pfMTZNKTsNCj4gKwlpZ3RfcmVxdWlyZShibHRf
aGFzX2Zhc3RfY29weShmZCkpOw0KPiArDQo+ICsJd2lkdGggPSBzaXplID49IFNaXzE2SyA/IFNa
XzRLIDogU1pfNEsgLyBjcHA7DQo+ICsJaGVpZ2h0ID0gc2l6ZSAvIHdpZHRoIC8gY3BwOw0KPiAr
CXN0cmlkZSA9IHdpZHRoICogY3BwOw0KPiArDQo+ICsJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAs
IDApOw0KPiArCWV4ZWNfcXVldWUgPSB4ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sICZpbnN0
LCAwKTsNCj4gKwljdHggPSBpbnRlbF9jdHhfeGUoZmQsIHZtLCBleGVjX3F1ZXVlLCAwLCAwLCAw
KTsNCj4gKwlhaG5kID0gaW50ZWxfYWxsb2NhdG9yX29wZW5fZnVsbChmZCwgY3R4LT52bSwgMCwg
MCwNCj4gKwkJCQkJIElOVEVMX0FMTE9DQVRPUl9TSU1QTEUsDQo+ICsJCQkJCSBBTExPQ19TVFJB
VEVHWV9MT1dfVE9fSElHSCwNCj4gKwkJCQkJIGFsaWdubWVudCk7DQo+ICsNCj4gKwlibHRfY29w
eV9pbml0KGZkLCAmYmx0KTsNCj4gKwlibHQuY29sb3JfZGVwdGggPSBDRF8zMmJpdDsNCj4gKw0K
PiArCWJiX3NpemUgPSB4ZV9iYl9zaXplKGZkLCBTWl80Syk7DQo+ICsJYmIgPSB4ZV9ib19jcmVh
dGUoZmQsIDAsIGJiX3NpemUsIHN5c3RlbV9tZW1vcnkoZmQpLCAwKTsNCj4gKw0KPiArCWJsdF9z
ZXRfb2JqZWN0KCZzcmMsIHNyY19ibywgc2l6ZSwgc3JjX3JlZ2lvbiwNCj4gaW50ZWxfZ2V0X3Vj
X21vY3NfaW5kZXgoZmQpLA0KPiArCQkgICAgICAgc3JjX3BhdF9pbmRleCwgVF9MSU5FQVIsDQo+
ICsJCSAgICAgICBDT01QUkVTU0lPTl9ESVNBQkxFRCwgQ09NUFJFU1NJT05fVFlQRV8zRCk7DQo+
ICsJYmx0X3NldF9nZW9tKCZzcmMsIHN0cmlkZSwgMCwgMCwgd2lkdGgsIGhlaWdodCwgMCwgMCk7
DQo+ICsNCj4gKwlibHRfc2V0X29iamVjdCgmZHN0LCBkc3RfYm8sIHNpemUsIGRzdF9yZWdpb24s
DQo+IGludGVsX2dldF91Y19tb2NzX2luZGV4KGZkKSwNCj4gKwkJICAgICAgIGRzdF9wYXRfaW5k
ZXgsIFRfTElORUFSLA0KPiArCQkgICAgICAgQ09NUFJFU1NJT05fRElTQUJMRUQsIENPTVBSRVNT
SU9OX1RZUEVfM0QpOw0KPiArCWJsdF9zZXRfZ2VvbSgmZHN0LCBzdHJpZGUsIDAsIDAsIHdpZHRo
LCBoZWlnaHQsIDAsIDApOw0KPiArDQo+ICsJYmx0X3NldF9jb3B5X29iamVjdCgmYmx0LnNyYywg
JnNyYyk7DQo+ICsJYmx0X3NldF9jb3B5X29iamVjdCgmYmx0LmRzdCwgJmRzdCk7DQo+ICsJYmx0
X3NldF9iYXRjaCgmYmx0LmJiLCBiYiwgYmJfc2l6ZSwgc3lzdGVtX21lbW9yeShmZCkpOw0KPiAr
DQo+ICsJYmx0X2Zhc3RfY29weShmZCwgY3R4LCBOVUxMLCBhaG5kLCAmYmx0KTsNCj4gKw0KPiAr
CWdlbV9jbG9zZShmZCwgYmIpOw0KPiArCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19x
dWV1ZSk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiArCXB1dF9haG5kKGFobmQpOw0K
PiArCWludGVsX2N0eF9kZXN0cm95KGZkLCBjdHgpOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEvbGli
L3hlL3hlX3V0aWwuaCBiL2xpYi94ZS94ZV91dGlsLmggaW5kZXggMDZlYmQzYzJhZi4uYTIyNTcy
ZjM1Yw0KPiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX3V0aWwuaA0KPiArKysgYi9saWIveGUv
eGVfdXRpbC5oDQo+IEBAIC00OSw0ICs0OSw5IEBAIHZvaWQgeGVfYmluZF91bmJpbmRfYXN5bmMo
aW50IGZkLCB1aW50MzJfdCB2bSwgdWludDMyX3QNCj4gYmluZF9lbmdpbmUsDQo+IA0KPiAgdWlu
dDMyX3QgeGVfbnNlY190b190aWNrcyhpbnQgZmQsIGludCBndF9pZCwgdWludDY0X3QgbnMpOw0K
PiANCj4gK3ZvaWQgeGVfZmFzdF9jb3B5KGludCBmZCwNCj4gKwkJICB1aW50MzJfdCBzcmNfYm8s
IHVpbnQzMl90IHNyY19yZWdpb24sIHVpbnQ4X3Qgc3JjX3BhdF9pbmRleCwNCj4gKwkJICB1aW50
MzJfdCBkc3RfYm8sIHVpbnQzMl90IGRzdF9yZWdpb24sIHVpbnQ4X3QgZHN0X3BhdF9pbmRleCwN
Cj4gKwkJICB1aW50NjRfdCBzaXplKTsNCj4gKw0KTEdUTQ0KVGVzdGVkLWJ5OiBOYWtzaHRyYSBH
b3lhbCA8bmFrc2h0cmEuZ295YWxAaW50ZWwuY29tPg0KUmV2aWV3ZWQtYnk6IE5ha3NodHJhIEdv
eWFsIDxuYWtzaHRyYS5nb3lhbEBpbnRlbC5jb20+DQo+ICAjZW5kaWYgLyogWEVfVVRJTF9IICov
DQo+IC0tDQo+IDIuNDMuMA0KDQo=
