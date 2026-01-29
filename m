Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC648D61033
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 17:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F0688130;
	Thu, 29 Jan 2026 17:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZ5ULcag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E86B88130
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769706621; x=1801242621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u9/d3HmIpYFbyWzlw4CQrkE43rJuMwJdfHmJxzs2lm8=;
 b=FZ5ULcagQD1kaasVZGuwEJqGQNNHwNXF1SpY0D9AVlyvNX4vW9oWJOFz
 AMuUCytEDMd00KG3UyREctj+9Ysnlavwlq645WZei90n437q7Ga633DjV
 fODNWFq6RwtRaJ/Obzq7DmUjn6Lb/EfbYAkYaE52B9uSNLwjgxrFPUPTa
 z3CPqSxopylHo2LwImK7RSgIPVL8f8H/y9kD7cPMmS6r+Q9SBt7/fdHaD
 MpNmuM1xpWnstZB15w2drbsxVlmSoQwBUcyztz+WOyiDoSw0y8s0GY0MG
 8+p45/2zAKiZ3BnjUspRnlrFGmRqdddqeCG8+RWCHUK6HQV2VPmhX2KIG Q==;
X-CSE-ConnectionGUID: pIrzRS1VTI2WiNjsHSXaOg==
X-CSE-MsgGUID: PkiuiXE0QS2uydm/p3o74A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="70152169"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70152169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:10:18 -0800
X-CSE-ConnectionGUID: QlweMfS3S5Kcb1FVkeKQxA==
X-CSE-MsgGUID: YybyOUqlQqOLxUX/u29DIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="207869260"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 09:10:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:10:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 09:10:17 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 09:10:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbc9uhQSdYjF/X2m5YxVtN+ch3RY2eLzyirKk5cKe9k5mD9PCNCl5uu8VSGyi6TqGqKjJ7XvefyDRSpeIOUV0Sua3SaXmjI8z2mooiNi+6e53NU1dozRlYXO3ykmQDbVhlrNRjxpL3SBmKlX+bvCoMMuoABAB/sc0OPhqCgli7cQiXy0kNr4Pi+SVZ+IYbYc4vj4iXftJZcfMhjfYGhMAJ2PXOlYO/HHUs2sYDPAejuLbh5hYL+BvMX2SEiMJXqPbV3V7mUdn6ur4JzTP3yq1Ou8ipknXDdEleDsVMa3Pzy4/QknZFb4ezo2hflcFZAyqRiGJaZw5OqkYXIqs98/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9/d3HmIpYFbyWzlw4CQrkE43rJuMwJdfHmJxzs2lm8=;
 b=TfCTMfTW2AbqCsMVgKO53ZCcA03Cea/j8L4YRVjpjbnbHhqe4sewyX48whWChXN+FA6B3ZIQAozEf5gUPRoJ7nKWXPnUaZ0WaMgNf1m7Ez0VNybSTWTBuIy0y30LvVa3mKJ/aGmlc8EbaZBdsDRQ5QNWv6bsKhq23eTvMdHL4vPNg6l4mJNhH2HVSqwkDYCfpyagFqKBAlRiJ986ggxu3vdxxNiec5FOuIpEgvcYCTBMShmun5Roj8YI5lHKsn51GBJk3kU9PpBsIUWbhqHkqycqMs1OA3h6u2dyU0p6KR5TIIHr7wEIgzlYB8KpEPDagjJSwdWd3UxqJuIcoQ9lHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8040.namprd11.prod.outlook.com (2603:10b6:510:238::11)
 by IA3PR11MB9063.namprd11.prod.outlook.com (2603:10b6:208:57d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 29 Jan
 2026 17:10:14 +0000
Received: from PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5]) by PH8PR11MB8040.namprd11.prod.outlook.com
 ([fe80::89bf:2274:1371:50c5%7]) with mapi id 15.20.9564.007; Thu, 29 Jan 2026
 17:10:13 +0000
From: "Yao, Jia" <jia.yao@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Zuo, Alex" <alex.zuo@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH v2] tests/intel/xe_exec_system_allocator: Fix UC PAT index
 test timeout
Thread-Topic: [PATCH v2] tests/intel/xe_exec_system_allocator: Fix UC PAT
 index test timeout
Thread-Index: AQHcj+1ZrC1BavYst0iujlxCHpinZLVny+MAgAGYSdA=
Date: Thu, 29 Jan 2026 17:10:13 +0000
Message-ID: <PH8PR11MB80403F57029C44CFA11AF431F49EA@PH8PR11MB8040.namprd11.prod.outlook.com>
References: <20260127215102.19951-1-jia.yao@intel.com>
 <20260128003021.33204-1-jia.yao@intel.com>
 <ab8f36d7-e1ca-4702-b1cb-370510317652@intel.com>
In-Reply-To: <ab8f36d7-e1ca-4702-b1cb-370510317652@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: igt-dev@lists.freedesktop.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB8040:EE_|IA3PR11MB9063:EE_
x-ms-office365-filtering-correlation-id: f3a1b131-b1c3-4867-3327-08de5f59447e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?clRnL1pvdTIrR1lwb1o1QnQzQXNDZTU3K2M4K2I3MUhrS2xFVmc2OWtHMVcv?=
 =?utf-8?B?dGRRa1hyVUhJWU1oVmEzakhyMkVuUjZEay9rU000VVB3cDQweVBLLzJiRVgy?=
 =?utf-8?B?RmhjVFY1ckxRMEVoWUo4OC9HMnhZVUxCT3dBUUZSZkZ4dHhWRU16NE9WQ1R6?=
 =?utf-8?B?K3dIK3dEZzZnTk4yc05DUHVmOU16dmNBRE9BaDk2YUxkV0xPUDV5a2QybHRT?=
 =?utf-8?B?ekVjUy8wWnJmQ0RaY2QrRDdNSHcxK0tnbXQ1QitIU1U1Rkw3a2dnaGdxSERV?=
 =?utf-8?B?Z0RYM0tXK1VXUjZqc1dxall3MVFpWElJM0NuZllRbVdhTWlDMDd4Rk1uNW5z?=
 =?utf-8?B?WFl4QmZITEpBeXAvejNrem15a1Vtdm0vOTBzL0lucWdLWTdVckdRbGE0YVN6?=
 =?utf-8?B?UFkwM21BZURzT0pUUDU1WmhhY0xsMW90Qy9EUGRnUko2WlpDVG5XM2JUMG1i?=
 =?utf-8?B?SmszY3EvR1dLdkNHOXJFVm9aRy9heXZLdXQ2TTdTSkNXV1dvWkdhaU5uNFFy?=
 =?utf-8?B?T0ZJWkNlTC9xNDYyVm5VeVB3Smo5NWxSVm53VFV1NmY0SUw1ZVFLM0MwbEcv?=
 =?utf-8?B?dUdOU2FXTG9hVFIwTWQySmVFb05uOHd3bE5IS3JaK3BnSlNPN2dadUtFcFNu?=
 =?utf-8?B?VWptd2w3Y1kvVFJmWWtXYnd0NGZ6L0JrY2dtbDZ3ZFJRUEZrNzJSTXFDeUgy?=
 =?utf-8?B?clJhUm5WYm9Fbk5TVXVpclJXUTFxZlBNN0RpYUExeVMyZGxDRndQSm9QVFY1?=
 =?utf-8?B?c2wrK2dsa2hhWW5qOXB2d0pMaDdsNHh2NjdZVkxwWkI4WW9SK29ncDhBU0lm?=
 =?utf-8?B?VklXZCtHRHNuTi9wSEVVZi9GZFo3eCtOM0Jvb3AxNW5uVEQwNTNGanN4NUY0?=
 =?utf-8?B?cHd5eWFjMTk5Vzd2dFNKVFExdHEwYjBFSjRJVWlrSVFiMnNneDZjVVNqUE5a?=
 =?utf-8?B?dTlncTNTWXJWYWlLYThHdE03ZGdkeVhGMGo1ZE9hTnNQZnNXMTZic0U2WWN1?=
 =?utf-8?B?YTBsbThoTExuLzhHNkFRN2ZaT1JIU0NQTGpWQk1XOXlVRnhxMVNhL2FZdkFZ?=
 =?utf-8?B?SVVldTNBNit3b2VhYmJzZUlsb1VraytWcE9WVUkrd3BLRG5IRmRnbzRIT3BN?=
 =?utf-8?B?VHBMRmc4eWxvLzJGajdFR0g0NEFBbjFoTnhDQ2FJS0ZyUmRERm5FMEFsejV1?=
 =?utf-8?B?RWdGVWZkNlhBYlcwMVdLblVaYlpJWEZpRURWZEtnUGFRYjV3RXlMd1ViOVZn?=
 =?utf-8?B?WkFOcEZoQ2c0bUk0YjNZczBHMGNLcjhySXFLR3lHWGFjTnlxdHpPaTVGQ0Nq?=
 =?utf-8?B?cGRIUnM2YUxrT0lZZVprMnFKMVZUanJDNFU3YkU1d21IalY3dEVXM0xaVEZW?=
 =?utf-8?B?dHRKQ3dpRk45MWU3Q3NYQ1BmVi9VNHNnaGNvQ1FQRHVKWkt0ZitVWGFvaExy?=
 =?utf-8?B?TnV6UXhMYUZJLzhiTW9oTnVtK0ZTYm1uUEFqWWRlZGFzcU1VY3J4bkU2SU5o?=
 =?utf-8?B?bHZqVWZUcm1XU3NTdmpBVmU3VGtDTkdEVkRIQm1LNWErckp5RHdWdGhDWnJO?=
 =?utf-8?B?NSszWWhnc2tsdUR3c0xYTURuTk1obHhzYmFHRm4xanY0YjlQS0h2OElaVFBE?=
 =?utf-8?B?RFd4S2NWc3FHajVjdjlyb3RzODlwR0YyWEdrQmdIMEFnT0hiWkJjbXArRDNB?=
 =?utf-8?B?N2tIcWZvdWNSSStkVy90ZGNDektmWUFKYjV2QnNWQ1pCWmxudWE1Wittc0Zs?=
 =?utf-8?B?S2h4QzRoZ1lRbVJPNUJoYWUxZG1oZ0I4YUl1Um9NOUJuZlc0NTFsMHJiSjBa?=
 =?utf-8?B?WEZNdFIvalZleE52YzhNQWFvT0VadTN4TjExZFBwU3E2TkRRbFU5c0hqQXVC?=
 =?utf-8?B?YzNPYSt2NHh2ZlZNN2NGRnB0eFZjbDRSbVBGaWJFcnQrTHhWbkl6cTV4YWNK?=
 =?utf-8?B?MEZoR2ZxanVLKzZyRFdOMDIzdFQ0V0JrcUkwS0dHZFpDVzlBb3FFdDMzeFZu?=
 =?utf-8?B?MnV5WXNlQ3FseVR0anhRRWZ0Y2F6MEQzcGVNZVB2Sk51bjlCQkxGdGlwa2li?=
 =?utf-8?B?WEFYLzNoMlVVbkViaHNXc2FUejh5MVpSVnlRRlVCOVV3MjFjSmlFZlVCWDJL?=
 =?utf-8?B?NU5EN0g1YXZQeWVJYWFMZUZUY05vclFrekpRRDF2WFg3WS9CNmE3UGppNm5l?=
 =?utf-8?Q?Ay9SE6aRDfgzHG4LXxsimPI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8040.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHIrZTF5MURoVjREZ0dOZTBzUW9panA0Wi9kMWxuYjZLZW5xczlDV0pmQ1pR?=
 =?utf-8?B?NVU3ckJPSkdDdm91YjJnNkFkSlJTMG5zUnd4VURLbWVmRUVTZTIzc3kxV01w?=
 =?utf-8?B?VGhkclovUWxzcWNpZ2prK0FldXJIbDV6d25HYWlqQ3ViakFvM1VicjVUN2gr?=
 =?utf-8?B?Wml3NXJkR3l2LzJ5ZlE0WUJNZmc3Um0yK1FQZ3YzaVBiVE1VSVNYY0xtSjE5?=
 =?utf-8?B?UEtSTE9qQUhrckxhdk8wV2RUcUFzejgvL21DK1RNc21RdVVMSGNQTXNpV3pM?=
 =?utf-8?B?MmlkWGk4YUxyYVdENnNkWEI0aGhHRm9EdXBiNUFzdSsrQ29hZUJheUlsQjdN?=
 =?utf-8?B?eTVxTkthckdqWGRkTXhsMFlERmJraW9TdE96Rk9rSVVKSWpDSlRrMXBXYi9o?=
 =?utf-8?B?U3d6V0x6d0ZTa2tSK3ZKWHBoN2pqbnIrMlNZcUlYQzBKaENTUXZGaDVlUDlr?=
 =?utf-8?B?TmRJSE9FK3VlYStJdmNOWmZTeGFUY3gxMmJZWFUyaUd5VTRHVmFxdzh3NERL?=
 =?utf-8?B?cjBUd3ZjR2hiYXErUjEreVpDekVRY0gweXlmdmR1Y0hsT0R3WWhrYjhVVCt5?=
 =?utf-8?B?QXlNWGlRMTA5QXJ4Ny80SWRMTUp4YUZoWFJkM0wwRkU2TFVEVDNKU3lwMGlp?=
 =?utf-8?B?dmxnVXcwd0Z5MlpFVVJQazF2VkFoWDZBVkR5N1BnRG5rVTQ0ZFlvSkVRZ3lD?=
 =?utf-8?B?dzZESVh6TTZBZS8wQzZaSDZIZmsyNW5ZZ0JzNnNiMzVMTjlIZEg2Y1d3ZE1H?=
 =?utf-8?B?S0FhMytuYlNjWVNvdFl5VzBHdGtlODVTdjl3djluY285VkFrYkRYWnFkS0hM?=
 =?utf-8?B?QW90OW5RYW42a0hMT2dhMTdXa3F1dnJESjdFN3V4dmx5S04yWGpBc3RML0ZO?=
 =?utf-8?B?dzVJVlltMGZSM1M1UjV3bFRQUDFFWkNYdEt3OUhnazBnQUJGSmlvYW0vQmVW?=
 =?utf-8?B?Qk9TN0FLWjJET01qamVQYzFoeWhlWFRmR2tYK0hJckRtVzVPbFgxbStyTThy?=
 =?utf-8?B?K3kxbks1S1Q1UGJld09BWEZQTlRmVjdwYUUzbXQ0VlRJUXJqQUR6cUdwaGds?=
 =?utf-8?B?UEFubVVqZEFSQmh2eXNoZTUvcUNhSEJmazhZTFhzbmJpa25jVkFLNjJIaVNs?=
 =?utf-8?B?a3p2N1ZRY0Q0Z2xXQ3lRbU1YVnhyOW9WYytYdkZiZmkxZkhIZjdTWGZ3djF4?=
 =?utf-8?B?OUVsRUJqRjEzeE51Y2JqVWhMN2VpMlNSdWlTc09qOUpJVDFzcCtrbXdOUW9Q?=
 =?utf-8?B?QW10T2Z2Q2JkUnBxMXQ0UzRxcFI1OE9ZVWJJd2N2SXArb2R0cnppK1d0bUll?=
 =?utf-8?B?UkRRbHY0bnBHS3Y3VnBieHN0L3BNRTN6ek9MSllmYTJZZDNIT2NNYjJYdHpn?=
 =?utf-8?B?NndUQ2g2WHdaT1RRU1gxbHB0M3RxQ0tKK2JHNHNPQWd0Uk95bU1maTZwNjMx?=
 =?utf-8?B?QXRrNGxhSVUzZkNmY0I0T25Vckx4T1NwalAyVWxqbUpsOEpLcFc5MDhFVUtE?=
 =?utf-8?B?VmFnS3NwYnZHWnJJck5nYUxWbTV5U0c0MTFnMUJLbHlvd0NEOGE5USthNzN5?=
 =?utf-8?B?ZFJrTGRLRUlURWRIK3VwWDc2MExHOWhQSUEzZFl4QWxIVG1JSWtnTEw0QVVy?=
 =?utf-8?B?VFpYdGhVRnNVL0pudkRFdUtYWHVydjVvMXl2MWVjWXFxbGtvKzVVc2l1bUFo?=
 =?utf-8?B?b2F4MUhXMHJKVjVWSEZRWllUeW1LS29palRUYXovUGs5MnRMSmJTb01MV1hX?=
 =?utf-8?B?bnRiZ2xvcGlFRDhDbjNXSzMyQ3VBNEw2WnRCdllOczZZeWpmQXUvcTVyUWZJ?=
 =?utf-8?B?bFFCbWtNV0xYem9Db05kWk40bEhaTG4zcU5ZYVdzNCtFMUdvSDdlQVplZjUx?=
 =?utf-8?B?dFdhNlk2c2h3QzFDc2RDV1Y1QitycncvWlJ1K0libXVRdTZKeTdsalRpU0VJ?=
 =?utf-8?B?VzgzU3BiMDQrc1RpM1NLR3VmZW5NV0pHYXEvWElkK3hqblFjMyttYnJTYkl0?=
 =?utf-8?B?WG5XL1RPSGdRM1lURHdOa0JZYjBOSmYwV2crR0pIeEdkTnNhaHJ6Ymx0Ykhj?=
 =?utf-8?B?Ynp4Sjdra1JnRkxJNDI4UjlEQ0RlVDQyL2NoQXhyTStCWW01VU80WHlaUzVK?=
 =?utf-8?B?dEdld2oyRmFjSUw5cVkxZUhSbzNJZ0xqbUNmVnFRN1FxNFp0bTdCYW9OS05F?=
 =?utf-8?B?Q3ZqYWxJSHdnUDlOdTJQMlR6RzNTWmZxQ3VPU1gvY2JKT1dJUExveGhtVnVT?=
 =?utf-8?B?MzM1bEtHZmx3RGk0VUlKMG90T3JsR1lnM3phdmp6UjlwcGtZVzFEczg3TElT?=
 =?utf-8?Q?NGxDzaOPrjjZwB34en?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8040.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a1b131-b1c3-4867-3327-08de5f59447e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 17:10:13.8631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJmWayRzG6k1jy4VXMCC9DYXF1UU5KpbM3pnoIS/28T2iEp/7FDUQsUT4dnMCJB3ryxSAiCAiUDAc3XLZcSCWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9063
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

VGhhbmtzIE1hdHRoZXcuDQoNCkBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KUGxlYXNl
IGRyb3AgdGhpcyBwYXRjaC4gSSBoYXZlIHN3aXRjaGVkIHRvIGEgZGlmZmVyZW50IGltcGxlbWVu
dGF0aW9uLg0KQSBuZXcgdmVyc2lvbiB3aWxsIGJlIHNlbnQgbGF0ZXIuDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwu
Y29tPiANClNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyOCwgMjAyNiA4OjQ4IEFNDQpUbzogWWFv
LCBKaWEgPGppYS55YW9AaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
CkNjOiBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IExpbiwgU2h1aWNoZW5nIDxzaHVp
Y2hlbmcubGluQGludGVsLmNvbT47IFdhbmcsIFggPHgud2FuZ0BpbnRlbC5jb20+DQpTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3I6IEZp
eCBVQyBQQVQgaW5kZXggdGVzdCB0aW1lb3V0DQoNCk9uIDI4LzAxLzIwMjYgMDA6MzAsIEppYSBZ
YW8gd3JvdGU6DQo+IFRoZSBwYXQtaW5kZXgtbWFkdmlzZS1wYXQtaWR4LXVjLXNpbmdsZS12bWEg
c3VidGVzdCB3YXMgaW50ZXJtaXR0ZW50bHkgDQo+IGZhaWxpbmcgd2l0aCAnVGltZXIgZXhwaXJl
ZCcgZXJyb3Igd2hlbiB3YWl0aW5nIGZvciB1c2VyIGZlbmNlLg0KPiANCj4gUm9vdCBjYXVzZToN
Cj4gV2hlbiB0aGUgUEFUIGluZGV4IGlzIHNldCB0byBVQyAoVW5jYWNoZWQpLCB0aGUgYmF0Y2gg
YnVmZmVyIHdyaXR0ZW4NCg0KVW5jYWNoZWQgb24gdGhlIEdQVSBpcyBub3QgbmVjZXNzYXJpbHkg
YW4gaXNzdWUsIHNpbmNlIGl0IGNhbiBiZSBjb2hlcmVudCwgZGVwZW5kaW5nIG9uIHRoZSBleGFj
dCBQQVQgaW5kZXguICBJIGFzc3VtZSB5b3UgbWVhbiB0aGUgY29oX21vZGUgaGVyZSwgd2hpY2gg
aXMgY29oX25vbmU/DQoNCj4gYnkgQ1BVIG1heSBub3QgYmUgdmlzaWJsZSB0byBHUFUgZHVlIHRv
IENQVSBjYWNoZSBub3QgYmVpbmcgZmx1c2hlZCB0byANCj4gbWVtb3J5LiBUaGUgR1BVIHdvdWxk
IHRoZW4gcmVhZCBzdGFsZSBvciBjb3JydXB0ZWQgYmF0Y2ggY29tbWFuZHMsIA0KPiBjYXVzaW5n
IHRoZSBleGVjdXRpb24gdG8gaGFuZyBhbmQgdGhlIHVzZXIgZmVuY2UgdG8gbmV2ZXIgYmUgc2ln
bmFsZWQuDQoNCkF0IGEgZ2xhbmNlIHRoYXQgc291bmRzIG1vcmUgbGlrZSBLTUQgYnVnIGFuZCBw
b3RlbnRpYWwgc2VjdXJpdHkgaXNzdWUuIA0KRm9yIG5vcm1hbCBidWZmZXJzIHdlIGRpc2FsbG93
IENQVSBjYWNoZWQgbWVtb3J5IGFuZCBpbmNvaGVyZW50IEdQVSBhY2Nlc3MgdmlhIHRoZSBLTUQu
IE90aGVyd2lzZSB0aGUgdXNlciBjYW4gcG90ZW50aWFsbHkgYnlwYXNzIHNlbnNpdGl2ZSBDUFUg
cGFnZSB6ZXJvaW5nIChwb3RlbnRpYWxseSBjYWNoZSBkaXJ0eSBvbiBDUFUpIGFzIGRvbmUgYnkg
Y29yZSBrZXJuZWwgd2hlbiB5b3UgYXNrIGZvciBHRlBfWkVSTywgZm9yIGV4YW1wbGUuDQoNCkFs
c28gSSBhc3N1bWUgdGhpcyBpc3N1ZSBpcyBmb3IgSUdQVT8gRG8geW91IGhhdmUgc29tZSBtb3Jl
IGluZm8/DQoNCj4gDQo+IEZpeDoNCj4gLSBVc2UgaWd0X2NsZmx1c2hfcmFuZ2UoKSB0byBleHBs
aWNpdGx5IGZsdXNoIHRoZSBiYXRjaCBidWZmZXIgZnJvbQ0KPiAgICBDUFUgY2FjaGUgdG8gbWVt
b3J5IGJlZm9yZSBHUFUgZXhlY3V0aW9uDQo+IC0gSW5pdGlhbGl6ZSBjbGZsdXNoIHN1cHBvcnQg
aW4gaWd0X2ZpeHR1cmUgd2l0aCBpZ3Rfc2V0dXBfY2xmbHVzaCgpDQo+IA0KPiB2MiAoWGluIFdh
bmcpOg0KPiAtIE1vdmUgaWd0X3NldHVwX2NsZmx1c2goKSBmcm9tIGlndF9maXh0dXJlIHRvIGp1
c3QgYmVmb3JlDQo+ICAgIHhlX2Zvcl9lYWNoX2VuZ2luZSBsb29wIGZvciBVQyBQQVQgaW5kZXgg
c3VidGVzdHMuIFRoaXMgZW5zdXJlcw0KPiAgICBjbGZsdXNoIGlzIG9ubHkgaW5pdGlhbGl6ZWQg
d2hlbiBhY3R1YWxseSBuZWVkZWQsIGFuZCBhbGxvd3MNCj4gICAgcHJvcGVyIHNraXAgaWYgY2xm
bHVzaCBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoZSBwbGF0Zm9ybS4NCj4gDQo+IFRoaXMgZW5zdXJl
cyB0aGF0IHdoZW4gdXNpbmcgVUMgUEFUIGluZGV4LCB0aGUgR1BVIGNhbiByZWFkIHRoZSANCj4g
Y29ycmVjdCBiYXRjaCBidWZmZXIgZGF0YSBmcm9tIG1lbW9yeS4NCj4gDQo+IENjOiBBbGV4IFp1
byA8YWxleC56dW9AaW50ZWwuY29tPg0KPiBDYzogU2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxp
bkBpbnRlbC5jb20+DQo+IENjOiBYaW4gV2FuZyA8eC53YW5nQGludGVsLmNvbT4NCj4gU2lnbmVk
LW9mZi1ieTogSmlhIFlhbyA8amlhLnlhb0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgIHRlc3RzL2lu
dGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jIHwgOSArKysrKysrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
eGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMgDQo+IGIvdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0
ZW1fYWxsb2NhdG9yLmMNCj4gaW5kZXggNDEyYWQwMzg0Li42OTcwYjgyMDEgMTAwNjQ0DQo+IC0t
LSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+ICsrKyBiL3Rlc3Rz
L2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+IEBAIC0xNjkyLDYgKzE2OTIsMTAg
QEAgdGVzdF9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
KmVjaSwNCj4gICAJCQlwcmVmZXRjaF9ucyArPSAoZW5kIC0gc3RhcnQpOw0KPiAgIAkJfQ0KPiAg
IA0KPiArCQlpZiAocGF0X3ZhbHVlID09IGludGVsX2dldF9wYXRfaWR4X3VjIHx8DQo+ICsJCQlw
YXRfdmFsdWUgPT0gaW50ZWxfZ2V0X3BhdF9pZHhfdWNfY29tcCkNCj4gKwkJCWlndF9jbGZsdXNo
X3JhbmdlKGRhdGFbaWR4XS5iYXRjaCwgc2l6ZW9mKGRhdGFbaWR4XS5iYXRjaCkpOw0KPiArDQo+
ICAgCQlzeW5jWzBdLmFkZHIgPSBleGVjX3VmZW5jZSA/IHRvX3VzZXJfcG9pbnRlcihleGVjX3Vm
ZW5jZSkgOg0KPiAgIAkJCWFkZHIgKyAoY2hhciAqKSZkYXRhW2lkeF0uZXhlY19zeW5jIC0gKGNo
YXIgKilkYXRhOw0KPiAgIA0KPiBAQCAtMjYzMyw2ICsyNjM3LDExIEBAIGludCBpZ3RfbWFpbigp
DQo+ICAgCQkJICAgICAheGVfaGFzX3ZyYW0oZmQpKSB7DQo+ICAgCQkJCWlndF9za2lwKCJTa2lw
cGluZyBjb21wcmVzc2lvbi1yZWxhdGVkIFBBVCBpbmRleFxuIik7DQo+ICAgCQkJfQ0KPiArCQkJ
aWYgKHN0cnN0cihzLT5uYW1lLCAibWFkdmlzZS1wYXQtaWR4LXVjLSIpKSB7DQo+ICsJCQkJaWd0
X3JlcXVpcmVfZihpZ3Rfc2V0dXBfY2xmbHVzaCgpLA0KPiArCQkJCQkJCSAgIkNMRkxVU0ggc3Vw
cG9ydCByZXF1aXJlZCBmb3IgVUMgUEFUIGluZGV4IHRlc3RcbiIpOw0KPiArCQkJfQ0KPiArDQo+
ICAgCQkJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpDQo+ICAgCQkJCXRlc3RfZXhlYyhmZCwg
aHdlLCAxLCAxLCBTWl80TSwgMCwgMCwgTlVMTCwgTlVMTCwgcy0+ZmxhZ3MsIHMtPmZuKTsNCj4g
ICAJCX0NCg0K
