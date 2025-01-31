Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0EC0218A
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 01:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039510E116;
	Fri, 31 Jan 2025 01:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9F3NH27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221DF10E116
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 01:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738288090; x=1769824090;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=w2psPDz0m2vEp3z10rWiLQ4c+g55QrdOA38BJoalCec=;
 b=O9F3NH271Fb1GOQ1mtImlgJsCDtcxuvbtbvqfEZqGhQCuR7orihA7pkF
 +y3KT2p9f/nI+S/b6DIpyy5nWM1lgl9Q8LO1y+2+eXcyNCaMHRfEHMlQZ
 PE1L2rpxCCijvTEl69oRl1wEY/1NbdjI/8HNT9E9WHNzk0e8+VRtxcd9o
 8RqEHK9kq69ri3x1iYSkfFYu75wJGIL1cSAka569GbvLeqhM8ppqK88wZ
 9GUHQ3b7p5Tx/tW/OYWsVry5e2Nx4cpAX8F9s2DClEe5aL0J/o9+lzMtd
 R2uld/aExxLD7sP5Vp19d5cJxQVLv8yiC44EAD/DxwC0P4IVv3CXCcoLl A==;
X-CSE-ConnectionGUID: eD5eztjkQxqsdRMqiEgHlw==
X-CSE-MsgGUID: Ou4SP5udQbCGeP0alURQqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38999731"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="38999731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 17:48:10 -0800
X-CSE-ConnectionGUID: sRmwjt4XRuCRMU3fSJzt/A==
X-CSE-MsgGUID: 1u+HfMPpQjCgySle2IK0AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="114502692"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 17:48:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 17:48:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 17:48:08 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 17:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ut0HUMK5l/J2/pvyc2O5lFY7sD3cOXM7U4RkLI26Lpbr+PVnerbK1NO4n8XgrwUAbH77Dk+BOVenKepp6nUwVVo9KHhOoqZ8dwHI0BpTTd0tdrMyCqvVwHjl4GzbLeRI71LMdWn6XnsKkSVk0xzh7BGJxmGk9IPJeV+C40MYACYZYy81hpn+ViRoWj+YB5U0nY4RAyHFN3rNtd9/CfWFOKCVm5yejYdnH53GLlgA3DnHY8q6LO+wC8G0aiVBPj+AUBa5C8v1773sYe/s9fDqQDbS/FAjm8Lo/1u8c7vqQWqpT0GhcJbKNeYmsY5kUTSmBztydMzbvT6nZ/BenxIAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2psPDz0m2vEp3z10rWiLQ4c+g55QrdOA38BJoalCec=;
 b=lYJjJYpDgHSGHbDrJdQf9CbbxJMR8KZL1VbAy4cHdxQcAhHIc6NHJu98bbEA5YYECd/x+rPTA+R+HAY38+FKRjSvEn5/wdyz/f9VSdGb0jcmBiXnmBG1JmdR+lb5FuuiaO/4Lkd9+Q+0koZuhJdHPKSS431pkswpIs+MTdg7gu57gTrbOyOjDxrGlwYhdM6PdjmillQxn3E+925N4j0767dITsKERyFEGyumU9IX/WieXf5vefMsge8eUQiXU1LjEbtJaJJ4EVcvSLdUlQOXD6iCTxSdoLbgXVERvpotzg352WFnpp6epa0esL27hTMtoczxkLaw59Gu64a3PGn/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.21; Fri, 31 Jan 2025 01:47:23 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 01:47:23 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v2 9/9] tests/intel/xe_pxp: Test encrypted FBs
Thread-Topic: [PATCH i-g-t v2 9/9] tests/intel/xe_pxp: Test encrypted FBs
Thread-Index: AQHbZ6x/Rxu7ZKQfi0O9faR5jBDMtbMwNMmA
Date: Fri, 31 Jan 2025 01:47:23 +0000
Message-ID: <05f3087128a9840ee57dc3657910424755d46841.camel@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
 <20250116001951.4159243-10-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250116001951.4159243-10-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|PH7PR11MB8012:EE_
x-ms-office365-filtering-correlation-id: 38e8a23a-19f6-4217-c699-08dd41993525
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UTVMTCtLZWt5cTRSVGVaZDlZU1V6Z0J1QmNjNmxYU1RZM0t6S3p1NU4ySWVl?=
 =?utf-8?B?cENxc2hVYlBkcVVhZWpPL1Fma1ZIQ1BWaWlTVENJS3lJVlAyQUNmTVUvSDNR?=
 =?utf-8?B?TUcwYTVGdXhQazI1c0Z0dlZuQUlyT1pLMk5ZM1l4MXpEV3ZTZGlDSkMvNEpO?=
 =?utf-8?B?TEh0bnU5cVdLVzdkYlFIK3pqem9Ec05ZcHlpeG9rYVhNdmkxbFNCdWFYTlQ1?=
 =?utf-8?B?am5LdkpxMU8reXNZSk9zaS9vS2tadG1acGxQN2FsM2dMV2lxYVR3NUs1Ritn?=
 =?utf-8?B?SXVYTkZNdjF5Q1BKcDBNdzd4YzFINTNVUGZ2eHIra0RsMWF3ZERwZzN6aFZy?=
 =?utf-8?B?UlhUMUM3Um9VMGxsMHhYaW96b2lXc2djOWViSGZYTzNPNXlTQkxMNW5wSncx?=
 =?utf-8?B?OGNUemgrbWVBb1pTWkpJWU9YL1NET2dyZ2ZSWlZoSlUxM0hmWTROOEFNSTkr?=
 =?utf-8?B?bzI2YnZmOFhwNGp6VEJic2o4RjYyc0w4ckl4dHE4NUhhOTlId0xtSFczU2Ur?=
 =?utf-8?B?alV2dTYyalNvVlE1M2V2a3NEYThPN2RIUTVQSnI2eVdMY1dUOEx1UmVwWW04?=
 =?utf-8?B?TTczaWdWNmYrTEJuK3QvRGVaUFU2d0UyelR0S3c3TVQvZCtCS3o0dkFqcjNX?=
 =?utf-8?B?b1ZRU3MrcWRsOTI0L3JuOFJSQTJnN1NXVk9NNndaNTUvSVBzVlJBTGp6dU9k?=
 =?utf-8?B?ejFlRjd0TVlicUdGc2xjSmREeEhGUTY2N2tjb0NhQ1d3OUI2YWVKOHNsV0V5?=
 =?utf-8?B?UEJyMEdzTDZ3cUtNV3dCMkVOVnd1bzdzZ2RJSG8vM1RWcGtXOXRBTitJSVdH?=
 =?utf-8?B?M1JYeUVBR0dQUXZWYllvbmNpWmxxWHlVUXRubGRwbE8zTEhFOUN6ZmdjL2U3?=
 =?utf-8?B?eG5kYjU5bnBzKzVSY1BKSmpRZFFiQ1RJTTZhaHpzblduUUZVSlRZbnJMdE5t?=
 =?utf-8?B?R1dkVkthY1I3YTBTY2JSWHkweE9jeXJlNTVvSnZaM2RoM3JLNzd5ZE1vSC9P?=
 =?utf-8?B?NlI4Mkc5RERnZktJNksyTFlNandYMDAyOVZYK0ZsZnJUMjJISE1pY3FRVmJp?=
 =?utf-8?B?d3hCSzhQTGp1bnZsWlMzYlJiREY1ZU45Y1BmWENyYzdQaDZQUWpnOXd1U3M4?=
 =?utf-8?B?VGtob011aGR2cXpyM1B2ZVErdjdCNlE4NSt3NUhieStDd00zWTRBR1RtZlJs?=
 =?utf-8?B?Wld6VEtOMXdpaTB4c2drR0hpdWd6SjdWYWF5MnhOQzloSHltZjdlT0ZBN2FG?=
 =?utf-8?B?SEwzVlRVeXE2aDYxTGJxQXlHQnJRVmltU2JYcDlnZXVvLzFyNjVRbENmamF6?=
 =?utf-8?B?K0JGUmRsVVBkWkE4eHdONzUweGd2WVZoemltVTdtMzlNOFV0L09PMWltVlNU?=
 =?utf-8?B?YXdFc21uSmtqN0hveW94Ymp4RXpqcWhLUGgrTk5oVDJISHM1NXhDb0FDWHlY?=
 =?utf-8?B?NU9WTjRwNXNtZU5hM2JUa0Y0MGR5eTRIc21mODE0VHd2Q3ZVWXc2ajdGWkNG?=
 =?utf-8?B?UFR5TlhmU01kMnFBYkczaGdvMWxmQUpYSVZoUmI2dzdjRXg5UFpGcExLNmpU?=
 =?utf-8?B?Y1hZUDRuQ3B2Y21HREVLV0FDNVJzWEU1VlVSQ1lKaVRjSUQxbGhhU3J0VHNv?=
 =?utf-8?B?TWFYVWVaaWxTUnFUVUFjV1A1dFdJcUlHZkh5dDBQTXprdGlSMS9tdGlVZXlJ?=
 =?utf-8?B?dnk0RXFHTEkvaWttZW5WYXA4WndXQ1NVWVc1WU5zc2NTeEZReFZiK3NVUnRv?=
 =?utf-8?B?NmtnTWRSLzB1WGhZM1FXVHp6RnJiVjNnU0FpK1BaTXUvVmQ3aVRQTS9tSldC?=
 =?utf-8?B?Rm1zRTE2a2R3ZUxYWm0rOHYyWGYrRG05QTkwR3RZS081dFZ1K01oYm1jNExw?=
 =?utf-8?B?TU51OE1JRU9WK1doM1RobVNmbjRFalNua2hXZ01VTlZET1JQYmFIcnpuQktI?=
 =?utf-8?Q?NI9AmHhFBKweQ9xvwUnAmQoacZqfs1sa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amJaUVRzRGg5NWtNZTFheHhTTTc1SkFVZndmK2VIaFpTaldCc1VpTTlWVHRo?=
 =?utf-8?B?L2VGSmt6cmFNVEd1d3VBZDQvaTVYVlNkTDU3YzhjakFjSGs5dlM1WnovanJv?=
 =?utf-8?B?b1I5czY5WXUyVHpiTStmVlhnR0RmM1p6QTBmcll6b0w5MmpTUnJSaHpPYXA3?=
 =?utf-8?B?bFhWb0tJRURjd2JXVGtsb3ZFS3NTcExtWGVvaWVHR2xieUVpdFBuRVF3WVZN?=
 =?utf-8?B?Q3JzdnZTTVBYWjJBYmFCRWxBdjU2Q0lrWG5IYk5qNCtVeEw3T1lkRnFJRWJr?=
 =?utf-8?B?VlNKZzE5MUp3KzZaK1hvUzEwRkROL2V0UDRJUjM5RUw5WUo3d3UwRk9HQ01z?=
 =?utf-8?B?Y0hqRTZzcm1yZHNIbmxlM29vd3pXT05sbjAyVmc3dnJPemJwcDZvR21UTHg5?=
 =?utf-8?B?d09rVmZTKzFhV1krVFZSZS9KMEVpZVloQUl1bGdmK2lKUytwZWF1ZmJPTHlZ?=
 =?utf-8?B?QnhrV3UxSGpFaDhqWTNsNWRBcXUwMk1LUkY5YWNJZU5KQjM0V0l3U0EwTkVO?=
 =?utf-8?B?N1FsanJkUFZSTE9oZWdzem9JeXptenhJcDhEV0RWN1lHeFlsamJXR2xzRXlD?=
 =?utf-8?B?Skt1am96YnNvZkRQWjZRTStyRGVNMEZPOW10b2VweUhwVUZ2c0NOYXdZTkd3?=
 =?utf-8?B?Rm9ianBDU1JDbDdnRm15MDNtaXFDMm5VN3g2OURubmFjaFpWcWlYZFpmajAy?=
 =?utf-8?B?eWY5UnloZFBJOHc1bXZBaTFseHpRWGVMOTIvNFF2ZldXSEtycUZVVHc2RC84?=
 =?utf-8?B?QVdBRlJtWXhHb0cwcUFrajgyaGpJZmMyWXNheWEyUE5VZHQveFQvM1NDMHlI?=
 =?utf-8?B?ZUJnS2g3Vzk0V3NVZVJ3dXBzalhhYVZxbFVzaXpKV1NEcXdUZWRwYmt1bFVU?=
 =?utf-8?B?MnMzeURPeUtFK3JVUEpXZGMzb3lvTzU0djY0elVtcGFjdUtxZUYrM3kxQW14?=
 =?utf-8?B?N1RZZHBiT0lQZkNoQ3pMNkgzZGZvZlJkcmJ4V3JNSm9xZG9KM2NTVXRwdkNZ?=
 =?utf-8?B?S2VUck13QUJFU201eGRHMm9vTVFncWpzSkl6a240Z0tjUVZSRFFQZ1BleFpN?=
 =?utf-8?B?ek1XNkxiUjQ3VXRkOXAzRVRZWUxrbDRrcU1EckE1eGxZaFBmTE9ibVQ1enc5?=
 =?utf-8?B?WWh1OXlRUzFpSXBOZ3JyeEZBcDBzQXA5bUFCb2RJRm5nUmZ0Z3lUdnQxQVMv?=
 =?utf-8?B?S25CeXEvVE5ZMlNWSG9Gd1VqYkI0d2s0dUNoZm1kOVlsTFdpQi9oMkMvSEg0?=
 =?utf-8?B?R0pyRXNXaHZiaDJBdXFNY2tQTWJrSmVnRDQyQTNVYjRoeWlkMnYxaVJpQWhs?=
 =?utf-8?B?VDVaVk9CanltaVEyWTN5MzZkWVRXei9ZRUJjR0U0MFpjL3p2cFdtNW5VNlpK?=
 =?utf-8?B?bkVydnZWTk9LY1BQVzVYeGF3MExWMDB1b1NZTzArQjhDNEZzQWM2bUozMklN?=
 =?utf-8?B?a0JUMzhPNmNOR0VGT3Y3ZHJtdzVyTHQrRDZORExUQXVaVTZmaXhFbnBMd2Mx?=
 =?utf-8?B?ZFRqMEhta0RlUWVHSHBrWVo4dHNHaUhnM1Y3N0U2ekJjc0pKVjJtUXlmQnZl?=
 =?utf-8?B?ZUpwUWE3YzNYb01nellRSHNzVmNpcFdaZGk5Z092RXdKSWM3VlUxRi9YVFZ4?=
 =?utf-8?B?TjNyVjlKZTF5d2l0aldsOXlPMTFObHpqQVR4dWdRVStOWUN4U0wxYlUyeGVX?=
 =?utf-8?B?Wm9Oc0F4blNTcWU3RmZMVC85VUNIb0RkdmJFdUpXa0w3ZnVwdWQxd2dOa0Zy?=
 =?utf-8?B?aEo3UUtibzI4dEY5YktTUkgzTkFYOEllVDBoQ1dYb3ltRGgyaUkvTTRQZkpQ?=
 =?utf-8?B?SE5ialV5YkxXZExra1V4K200N2pNb0taZ0VtS1RMRzNiMGdQTkxpMm5ZZUFr?=
 =?utf-8?B?MmpUaGZPMktlR2xzZDRzYVhQSXcrTW1hLysrTmRFVFYrSENURjFha0w1RHdQ?=
 =?utf-8?B?WVhkREMrRklYdGVFcU0zNnMycHZ4V2YyeUlnWEQwb3l1endwaEd3UHkvaFMw?=
 =?utf-8?B?UWtBM3pLbXhPeTJIZWE2MEdaamYwS2w4NSs2Sys4S3dOWFIrRGdNUHUxa0Zl?=
 =?utf-8?B?MUZ5ZDBjc3FlVlhuU1ZhVUwyMlAzNlBCS0oyMEozQlgvQzUvQmtydyt1WHRm?=
 =?utf-8?B?ajdWNWd0Z255SVNVSFNKR0Z4TFAwb2hWSHFvS3dlTGNwVmhSWE45akkvaGp6?=
 =?utf-8?Q?WE7hSrD95JQS5d8CoTr3VAU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F42E00AEEF0E364E920E67BA176575BB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e8a23a-19f6-4217-c699-08dd41993525
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 01:47:23.3754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pn3Dm/LbvrpyzBCk2yOoEvHpQOnCy+YXVahzVPvdD1Yq3znwjPbpfEGAqNXA5vZ6OQxjZpAchxGubuEyK8bHh7bXA/GePzpV8Mhj3bJTS9gHc9xjraoza4q8li9Pv0l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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

TEdUTSAtIHNpbWlsaWFyIGZsb3cgdG8gdGhlIGk5MTUncyB2ZXJzaW9uICh3aGljaCBpcyBleHBl
Y3RlZCBzaW5jZSBpOTE1IGFuZCBYZQpib3RoIGFyZSBLTVMgYmFzZWQgaW1wbGVtZW50YXRpb25z
IG9uIHRoZSBkaXNwbGF5IHNpZGUgb2YgdGhpbmdzKS4KCkFwcHJlY2lhdGUgdGhlIHJlbmRlci1j
b3B5IHRha2luZyBzcmMgZnJvbSB0aGUgcmVmZXJlbmNlIEZCIChhcyBvcHBvc2VkIHRvIGEgdGVt
cApidWZmZXIgdGhhdCBqdXN0IGhhcHBlbnMgdG8gYmUgaW5pdGlhbGl6ZWQgdG8gdGhlIHNhbWUg
Y29sb3IgdW5saWtlIHRoZSBpOTE1IHdheSkuCgpJIGhhdmUgb25lIGZlZWRiYWNrIG9uIGFic3Ry
YWN0aW5nIHNvbWUgcmVwZWF0aW5nIHNlcXVlbmNlIGludG8gYSBoZWxwZXIsCmJ1dCBnaXZlbiBp
dHMgbWluaW1hbCB2YWx1ZSwgSSBjb25zaWRlciB0aGF0IGEgbml0LiBUaHVzOgoKUmV2aWV3ZWQt
Ynk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4aXNAaW50ZWwuY29tPgoKT24g
V2VkLCAyMDI1LTAxLTE1IGF0IDE2OjE5IC0wODAwLCBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIHdy
b3RlOgo+IFBYUCBhbGxvd3MgYSB1c2VyIHRvIHNlbmQgYW4gZW5jcnlwdGVkIEJPIHRvIHRoZSBk
aXNwbGF5IEhXIHdpdGhvdXQKPiBoYXZpbmcgdG8gZGVjb2RlIGl0LiBUaGUgZHJpdmVyIG5lZWRz
IGhvd2V2ZXIgdG8gdGVsbCB0aGUgSFcgdGhhdCB0aGUKPiBCTyBpcyBlbmNyeXB0ZWQsIG90aGVy
d2lzZSBpdCB3b24ndCBiZSBkaXNwbGF5ZWQgY29ycmVjdGx5LiBGdXJ0aGVybW9yZSwKPiBpZiBQ
WFAgaXMgdGVybWluYXRlZCBiZWZvcmUgdGhlIEZCIGlzIGRpc3BsYXllZCwgd2UgZXhwZWN0IHRv
IHNlZSBhIGJsYWNrCj4gc2NyZWVuIGluc3RlYWQgb2Ygd2hhdCdzIGluIHRoZSBCTy4KPiAKPiAK
YWxhbjpzbmlwCgo+ICtzdGF0aWMgdm9pZCB0ZXN0X2Rpc3BsYXlfcHhwX2ZiKGludCBmZCwgaWd0
X2Rpc3BsYXlfdCAqZGlzcGxheSkKPiArewo+ICvCoMKgwqDCoMKgwqDCoGlndF9vdXRwdXRfdCAq
b3V0cHV0Owo+ICvCoMKgwqDCoMKgwqDCoGRybU1vZGVNb2RlSW5mbyAqbW9kZTsKPiArwqDCoMKg
wqDCoMKgwqBpZ3RfZmJfdCByZWZfZmIsIHB4cF9mYjsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfcGxh
bmVfdCAqcGxhbmU7Cj4gK8KgwqDCoMKgwqDCoMKgaWd0X3BpcGVfdCAqcGlwZTsKPiArwqDCoMKg
wqDCoMKgwqBpbnQgd2lkdGggPSAwLCBoZWlnaHQgPSAwLCBpID0gMDsKPiArwqDCoMKgwqDCoMKg
wqB1aW50MzJfdCBxOwo+ICvCoMKgwqDCoMKgwqDCoHVpbnQzMl90IHZtOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7Cj4gK8KgwqDCoMKgwqDCoMKgcSA9
IGNyZWF0ZV9weHBfcmNzX3F1ZXVlKGZkLCB2bSk7IC8qIHN0YXJ0IHRoZSBQWFAgc2Vzc2lvbiAq
Lwo+ICsKPiArwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KGRpc3BsYXks
IG91dHB1dCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtb2RlID0gaWd0X291
dHB1dF9nZXRfbW9kZShvdXRwdXQpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgd2lkdGggPSBtYXhfdChpbnQsIHdpZHRoLCBtb2RlLT5oZGlzcGxheSk7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGhlaWdodCA9IG1heF90KGludCwgaGVpZ2h0LCBtb2RlLT52
ZGlzcGxheSk7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfY3Jl
YXRlX2NvbG9yX2ZiKGZkLCB3aWR0aCwgaGVpZ2h0LCBEUk1fRk9STUFUX1hSR0I4ODg4LCBEUk1f
Rk9STUFUX01PRF9MSU5FQVIsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMCwgMSwgMCwgJnJlZl9mYik7Cj4gKwo+ICvCoMKgwqDCoMKgwqDC
oC8qIERvIGEgbW9kZXNldCBvbiBhbGwgb3V0cHV0cyAqLwo+ICvCoMKgwqDCoMKgwqDCoGZvcl9l
YWNoX2Nvbm5lY3RlZF9vdXRwdXQoZGlzcGxheSwgb3V0cHV0KSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG1vZGUgPSBpZ3Rfb3V0cHV0X2dldF9tb2RlKG91dHB1dCk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBpcGUgPSAmZGlzcGxheS0+cGlwZXNbaV07Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBsYW5lID0gaWd0X3BpcGVfZ2V0X3BsYW5l
X3R5cGUocGlwZSwgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlndF9yZXF1aXJlKGlndF9waXBlX2Nvbm5lY3Rvcl92YWxpZChpLCBvdXRw
dXQpKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X291dHB1dF9zZXRfcGlw
ZShvdXRwdXQsIGkpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3Bs
YW5lX3NldF9mYihwbGFuZSwgJnJlZl9mYik7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlndF9mYl9zZXRfc2l6ZSgmcmVmX2ZiLCBwbGFuZSwgbW9kZS0+aGRpc3BsYXksIG1vZGUt
PnZkaXNwbGF5KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3BsYW5lX3Nl
dF9zaXplKHBsYW5lLCBtb2RlLT5oZGlzcGxheSwgbW9kZS0+dmRpc3BsYXkpOwo+ICsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBD
T01NSVRfQVRPTUlDKTsKYWxhbjogbml0OiBJIHNlZSBhbiBvcHBvcnR1bml0eSBmb3Igb3B0aW1p
emF0aW9uIGJ5IGFkZGluZyBhIGxvY2FsIGhlbHBlciBmb3IgdGhlIGZvbGxvd2luZyBzZXF1ZW5j
ZSBvZiBLTVMgY2FsbHMgdGhhdApzZWVtcyB0byBiZSByZXBsaWNhdGVkIDMgdGltZXMgZm9yIHRo
aXMgdGVzdDoKCQlpZ3RfcGxhbmVfc2V0X2ZiKHBsYW5lLCBmYik7CgkJaWd0X2ZiX3NldF9zaXpl
KGZiLCBwbGFuZSwgaGVpZ2h0LCB3aWR0aCk7CgkJaWd0X3BsYW5lX3NldF9zaXplKHBsYW5lLCBo
ZWlnaHQsIHdpZHRoKTsKCQlpZ3RfZGlzcGxheV9jb21taXQyKGRpc3BsYXksIENPTU1JVF9BVE9N
SUMpOwoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaSsrOwo+ICvCoMKgwqDCoMKg
wqDCoH0KPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogQ3JlYXRlIGFuIGVuY3J5cHRlZCBGQiB3aXRo
IHRoZSBzYW1lIGNvbnRlbnRzIGFzIHJlZl9mYiAqLwo+ICvCoMKgwqDCoMKgwqDCoHNldHVwX3By
b3RlY3RlZF9mYl9mcm9tX3JlZihmZCwgJnJlZl9mYiwgJnB4cF9mYiwgcSwgdm0pOwo+ICsKPiAr
wqDCoMKgwqDCoMKgwqAvKiBGbGlwIGJvdGggRkJzIGFuZCBtYWtlIHN1cmUgdGhlIENSQ3MgbWF0
Y2ggKi8KPiArwqDCoMKgwqDCoMKgwqBjb21wYXJlX2NyY3MoZmQsIGRpc3BsYXksICZyZWZfZmIs
ICZweHBfZmIpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfcmVtb3ZlX2ZiKGZkLCAmcmVmX2Zi
KTsKPiArwqDCoMKgwqDCoMKgwqBpZ3RfcmVtb3ZlX2ZiKGZkLCAmcHhwX2ZiKTsKPiArwqDCoMKg
wqDCoMKgwqB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIHEpOwo+ICvCoMKgwqDCoMKgwqDCoHhl
X3ZtX2Rlc3Ryb3koZmQsIHZtKTsKPiArfQo+ICsKPiArLyoqCj4gKyAqIFNVQlRFU1Q6IGRpc3Bs
YXktYmxhY2stcHhwLWZiCj4gKyAqIERlc2NyaXB0aW9uOiBUZXN0IHRoYXQgYW4gaW52YWxpZCBl
bmNyeXB0ZWQgZmIgaXMgY29ycmVjdGx5IGNvbnZlcnRlZCB0byBhCj4gKyAqwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgYmxhY2sgc2NyZWVuIGJ5IGNvbXBhcmluZyBpdHMgQ1JDcyB3aXRoIHRo
ZSBvbmVzIGdlbmVyYXRlZCBieSBhCj4gKyAqwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9u
LWVuY3J5cHRlZCBGQiBmaWxsZWQgd2l0aCBibGFjawo+ICsgKi8KPiArCj4gK3N0YXRpYyB2b2lk
IHRlc3RfZGlzcGxheV9ibGFja19weHBfZmIoaW50IGZkLCBpZ3RfZGlzcGxheV90ICpkaXNwbGF5
KQoKYWxhbjpzbmlwCg==
