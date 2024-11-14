Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBC0D68B18
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 13:37:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCF510E030;
	Thu, 14 Nov 2024 13:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2ZYNbMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3AC10E030
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731591419; x=1763127419;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=qH51T7GwsUCRI2jK/erIGL9Uy0/6v72yuXzb2kLXlFo=;
 b=R2ZYNbMmh/OOpRpZ8eRYe6XsqnDcKRKAtFUTFjzeILJG2M9lADbyqC48
 AaZd5JjpchP7G0BqHj2j/xopDEXM2323fVg8jV7WyV6BGAKMCHsEgz52m
 af+jvp4b+qJNlaBHZSsR96VZBbX6ZdP6VHcqVxCrug7tTItbsCkfBD4Ry
 1E4A9YOcTunQZXi6zIjmWitbwVHRuvufXINhQ5GSoOwVdnruCNTTPuBbY
 g3Fnb9WW5Vb0yt9ixEEScGm807RNELqvXEPNYzQRta88CkwX+cs7wPDYJ
 IVfiTXN9Nhtxkl7kDkzHjDlEj7Q+Zx/UwbwVU9gr4D2V3LBrzh/cgM0WR w==;
X-CSE-ConnectionGUID: /u5EAbRpRoOdUkm0aThnMg==
X-CSE-MsgGUID: HhRbnIcYQnqnCh46W44Z1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="56926558"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="56926558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 05:36:59 -0800
X-CSE-ConnectionGUID: EQ6AWPu4Q0u5eN9jN1DeVQ==
X-CSE-MsgGUID: 4aUlRPD8QzWZB4Xf3uRadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="93155293"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 05:36:59 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 05:36:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 05:36:58 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 05:36:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tq0c5UkhIp4C7QJ3QODK1uvrP+vm/zhTtXxPf9u0AVNXjCBe7NDc7H4tKh0rDHPQiWO/pYRwlsclLosf2pPvK5NJbh0k1TupzXP72nQ2Hom6y53i1Oy/w2w9lPOGMtvbRONqdpL6IKBA9SV2iFTlo8+J4A+5UjPTkw8c/f+lWXdi/Lfx/tO0hMYoK93H5xH9K4n3pWP/LVOf4sWBlFSKIHqRdKcsGeTuvjM3WyWdJZJ/qJlUAvgKF2Cb68cZiBq9R1XJTEc9XJNr5QiTU4Vp3k8798ZefTaKSmD3vi43kiUqWi0/3YeK1Qv3zDwy/h+c7DjSC/VyFkTmVuRYXli3Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH51T7GwsUCRI2jK/erIGL9Uy0/6v72yuXzb2kLXlFo=;
 b=L3l0E+jl2wH6TqDlb26cAIzd/08S+Zcl80iO0LfPqM29Wtu5j4HKTn/W6uuxFeLeLHH/Ot0k9O6VvoxO6mpxF93m73RJhWrZHE5hFZwpnUxIgtjoWwwz8PAVBB9CQUF2v1nX6XRLEGIzxHHLGX6IgtYGfH2PBmwYUogVKE7Q04ywOEJH8Ql8McB5Fn2PasxaWFXNSYm/Z90ZHTHrXc/6TfnAsdjx7aZZX71FSTrPiGg7KAuZXt6W6JEbmc8OXudSYUcx1gO/pmOl7wjTat8i6cavWkv+FCL9rdqatTiPjxfnlwSlupCxT7864s4MH7xaZFbFMBRgHqKoHnhg7EX4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SJ2PR11MB8449.namprd11.prod.outlook.com (2603:10b6:a03:56f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 13:36:55 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 13:36:55 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] tests/xe_gpgpu_fill: Add width/height/x/y
 command line args
Thread-Topic: [PATCH i-g-t 2/3] tests/xe_gpgpu_fill: Add width/height/x/y
 command line args
Thread-Index: AQHbNo2pCCCCJoQs2UOf+2utAaoKWbK2x2sA
Date: Thu, 14 Nov 2024 13:36:55 +0000
Message-ID: <0fd2b463db40d47c60b64661b3a9a328d04153ad.camel@intel.com>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
 <20241114120616.70229-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241114120616.70229-3-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SJ2PR11MB8449:EE_
x-ms-office365-filtering-correlation-id: 906d9914-c419-48b7-0cb1-08dd04b167d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0hWVTFWTWM2SVVZNkpkbktPaXJZWFhsWWxEMUxrNmxOVEY3SVBhamExMG0z?=
 =?utf-8?B?UGxZUGxHekRmaCthem5HT3hZS1lXT1pmT2gyRzQ5ckpPRTNXWm1EenkzTzNP?=
 =?utf-8?B?R1I1S2I4ckVIalAzVjRWWjljYkI2azg5b2QyZ1dic1Y5cWxaak9wUTFXZktl?=
 =?utf-8?B?bjhvbG9tOVJlcC8vdkJWL3VpL0RyUFpjeDVLUGF1S3RxTXUxOGJiN2REQWE1?=
 =?utf-8?B?MDZMd0F5aXFQb1pWUEVJRWlJWXc4bmdWT1NyRUtlY05pZnFNNW5WTFQ4T01i?=
 =?utf-8?B?OGpvTXBsWDJleG5kZ1MzeG9WTHpkcW1MaEtCOEkxVmRjdEhzN280WkdlOFhG?=
 =?utf-8?B?R0VnR2h5c1FSMWxxdGJOSDZXLys1Q3gvblJzZjRzdkNhVWV6cTFzVWthNnhl?=
 =?utf-8?B?T3NnREpUQWx2WlZ4TndvcGdqeEp1ZzFvVXMyRlYrb0k3QXlHUnRwdXlMR1ZP?=
 =?utf-8?B?cDc1d2xaaFNRSWNHbWdxS25hSkdoeUZSS0ZsNmRDMFNvWVpnc0RhSXpjclZU?=
 =?utf-8?B?V1cyRG1UclZHSVVxbGF1Vk9qck5ySFF5OFBwcktTbWFJeUZvdUdMVU5qeWVo?=
 =?utf-8?B?L09lUmJSN3E5b1BJbDhzRlVWQzFsdE84V0xVQTlISlAyZldvV1k4cXJZbzZC?=
 =?utf-8?B?U2szdjZvWGNsVHFnU1dVTVliWi9MVHRHbWZCQTUxV3lISG9lbFB4Wms2TVVW?=
 =?utf-8?B?N0Z5ZE5xK3hDelJZZVNzZnhZY25RazIvZzU3WjRuVEV0aUhwV0VOTnhPSWVk?=
 =?utf-8?B?WGxBSWJobFkyOCtKRW5pNWxVeGpuV3Y3QkhGQzlKZkxEYmptSVVYSjNYdThM?=
 =?utf-8?B?SEw3a3V5MG5qVm8zZDVsNWE5RUYwdGtEOXRDWGc5Z0lVWHJrTnpBZzgzbTlN?=
 =?utf-8?B?VC92cGRRTmVHSVdUK090cFcrelpFU2ZUbk81a0FVMVFsN2JIb1pLanhuMVVB?=
 =?utf-8?B?Y1pqYjZ6SkVndDE2bS9IY1R4VEhQY3VydjhXOTQwOVg4dXBUZm1pK3doRjJW?=
 =?utf-8?B?QTJydTB2YVV4MTN6OWUxTkdsMUhRUCt4UjJnRTlqTCsydGFGaTZsZlJSMFM1?=
 =?utf-8?B?MkJ5VGhrRDVsZXhpdWwwN0hIOExwTVl2MXQxNUVCZHhvdEw4K3pkb3QxQUZ3?=
 =?utf-8?B?VkxSOHd1NFJzSERiQ2M4MzQwSVpzRW9lV2RidktPc2tCekp0Z3l5OEVLVG1V?=
 =?utf-8?B?b09aTlJoMEVTSUc5dlVORWJRaEcyVDRPSFlBeU9reUl5eEF4elE0Mm9vMDdI?=
 =?utf-8?B?QUduanp1aG9tZXc3MFNJN280dG1UbVI3STl5NTRmOHZYRFVjeXdad3BNYmc1?=
 =?utf-8?B?eitzWEd5ZW1uMTRkbVNmdHZ3L1JSbVZJZi9IZXVIUUtrbHoyak5yRG4vcTlP?=
 =?utf-8?B?QWUyeFl3TmVGVFVpT0VOTHh3aTAzWklldHVObmZ4d204K0dLdkFUeWZPbGRa?=
 =?utf-8?B?MWJpRTJjemhJeG0yV3ZYRTJWNjN3TlVRS0x2VWZkdnI5TEQybFg3MngvS0Rr?=
 =?utf-8?B?MkFZaGxiQS8xbmNjV3pFS2ZtMisrUHE1UWE4aFI2L2hLVHhFbFlBVXVBSnFS?=
 =?utf-8?B?YjV3NjcwclIyQU0rd3VzSEpKRWRzN3J5THN2Y2phemdDb2VtVTdUVE5zNmRP?=
 =?utf-8?B?dk5YWXJzVTkxT2dDZ1BFVVp4eTVsR3FXbjZaRXlUYm5xcTRPL3haRkdyK3Ry?=
 =?utf-8?B?Nm9wZDVURzVHbDFmODhtU3cxN1hjaHNvTDE0WU85UE9CbkxhWEVZZEVQaUhK?=
 =?utf-8?B?anhDNWJhUndXZmxYd0pLb09UNVcraEdQeTJCY1NnUTExdkNOQ3kzaDJ4TnND?=
 =?utf-8?Q?IP+3cwDpu7CAmH2wIzSlBUvC29gfSItqOL/Xk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WllJdnpGQUZFS1ZSWFZRd3pRN2t6NkFodU5sdzZkUE9RZ2hpZGJNWEs3L25a?=
 =?utf-8?B?eUJ3VERqNEFldFExRm9aNHdjL2h2azg1aVhlM3NvT0Q1dnl5ajNFRU5Hb0N6?=
 =?utf-8?B?TVBYK044MEVvUUxKWU4yd1JHZ2szWEVSUmVicVJ5aDZwdm14aHphVjVab3dI?=
 =?utf-8?B?KzlSeTRLemh5b3dVRS94NFVFdFFueFJPOTVjNW5qNkZkR096VW1DTTB4U3NI?=
 =?utf-8?B?SWNxS25ZM1VXU2VLTlkxQW1XVDFRdTNINnBpdGQ4eitvbVVsSG9jMUhtNEN6?=
 =?utf-8?B?YjFlNVZUZjZxWVY4SzVkVDFKc3g4UFMxRkc3TUJMSm8vMEppd09vbm5jazVW?=
 =?utf-8?B?UjB6RTlzN2d4emx6WUw0cmhMbDA4MW03dTdMOEhaUkVUaXc2YzBuS1dnOFVy?=
 =?utf-8?B?Unc0SS8xTVkrUmlTVC92MUVtK0Q3YXB1RXpIK0RVbWpSVFp5cXQ2bW5vWXgx?=
 =?utf-8?B?YlhyV0ZDWXdORXc2QnZESXRpdjI3SXVhMUk5eHAwZUdTUGwwSEhxbTROVXMr?=
 =?utf-8?B?azJvMDZIeVBzdkQ1eEhpWU92VkZnVnZZb0ZHSVJpallybjAyTThNcWJIY3ZJ?=
 =?utf-8?B?bHdiSHlZTHJWL0dsWjhoWEVCQ0VjdTFWLytyb3JaR1dMcytLMXVoWmFzM09j?=
 =?utf-8?B?SEx4cmYvK20yTVo1NmpSSkZ0ZHJnYkJlQXAxakNlSW5nY0p2T1hSd3FnR21M?=
 =?utf-8?B?UHl5YTlXZXU3c0UxOEI0ZWhLZUIrUU5pajdrU2p0Z2N2N3ZEOXN5UVg1OVlD?=
 =?utf-8?B?T2duT0hiTGdZQ3R3M0JTVVJXTENTTHg1cmFIVmtlbGkyL01jb1diYkxyNTd0?=
 =?utf-8?B?YVUwNHBKM285LzR2RVdSNmJjdisyWmdiWUVMWUpIdzJDODVPZ004eGliTXdT?=
 =?utf-8?B?UGprSC9MSjNDRHFZai9uZzZidkR2RU5CQzVGZ0hUR1hqbDJVVkxsTzlEb211?=
 =?utf-8?B?cktQZnFtaUFiSnhCTDZ6ZUZvbWVhekl1bnM4cCtKS2dxUExCbHp6ZVVkUzZ3?=
 =?utf-8?B?RzREemdlRWJWOUtkZjFMWVAxcU1vb0lkcGNPd1dXanBLZFNyMVhqazJ0KytR?=
 =?utf-8?B?bFBrUTFqQ3FsZ0dRVUI1aWlrejkraHZFT01naWw1TVpncGlGem83TE55OHFC?=
 =?utf-8?B?ODljelB5Mm9tSkxsemxrQTYrWGUwbHhmbERYQ2J5cE5KRnJZakdHaFk0Z3Fk?=
 =?utf-8?B?bHBoOWFJZWVyMkVwbVpGSCtqZ2VIYWtEU1VnTzBkSmdCUmI4OXAwMjNOOXhO?=
 =?utf-8?B?aVNQMkRiS0hSNllJbXIzK0ROMUV3TVVTdXdMMldsbkhLNU1ndktGTzB3d0FW?=
 =?utf-8?B?dUY1TnE1R0NjVmZ3Qm9iNDRVc1FFcTlUY2p3bTdxVVA0SEkwVndYdmJ4ZW8y?=
 =?utf-8?B?UXkrYzVoQnB3QStacnBockU0aHlYOVdXbUFpQWUwVjRxSGxYaTZaVkp6WVhP?=
 =?utf-8?B?bmYzY3ozU3ZFcENycE5QQ0czekpJWnVwN3hCUTdwWXlHZG5FRHQrMVdjR2dG?=
 =?utf-8?B?ZW00MHlGM1c4WDQ1WkhmQ242Z2k0MlBGaWk5K3NoUkJhWVBXZVpiUURvbHRq?=
 =?utf-8?B?RzFwcDllVWVJYXBETXYxaTZ4S3hLbm9WUFFsbGgrc251YkRpcThZeEQwWGRL?=
 =?utf-8?B?UW1RZzFqZWcyVHF2RC9wbmdGVzhGTmVDLzdQU2t6eDdVTVVzclpYOW81cjE3?=
 =?utf-8?B?OXhUbDZZN21kUXAremZKLzVRcENjSmc1UHExcTVuWHZUUXFtakcvWVZnUlYx?=
 =?utf-8?B?cFBYclBDZCtsdEhNa3pHclNNdll5bVk0OVhSV0JncGpnak5WUGladzlGNlM4?=
 =?utf-8?B?Nkx5Ympobm1vVGJrRHVhM3E4Y0UwOG1xTkgvUEUxQmZXV2ZaMjVRZnU1R28v?=
 =?utf-8?B?YTVaRVNrcm1xSDlKOVdGaEV4UW0wY1RUNjNTM0VaMXpZb1VoYkxxRjJjOXll?=
 =?utf-8?B?d3hjaUhzaW0wNE5ROHFmMXlkTUtDN2FVZ0RQMnN0ZGJsbEdYUCtDZCtSWThm?=
 =?utf-8?B?Y0gxOWp6cEhneldGNllVa3NIRVNPN3pIelJxOHc2YmV4cnFhYlAyd3BEdXUr?=
 =?utf-8?B?WUpoL1NCWFo5ejNJTnNuRFlQZjQxQUJ4YnFadGFkRXhmK21oOTVZZmVwUGx1?=
 =?utf-8?B?MmlOcFpJZFBObXFHVk93NnpaZG51dWl3RmdnNGxhc3hvWlBzL25EM3p1OXpG?=
 =?utf-8?Q?jGLQyCB9a8461WVmQy6EI6o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C00CCBCC3351E4FA405A2E369F4E584@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906d9914-c419-48b7-0cb1-08dd04b167d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 13:36:55.3839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /arKAPMR2OfpnnE608bjnK4hIOnWGF3H1uvWtrW++eD8UHbjte9j1BE+g5JHr90A0Sv/XleXSeMSqIqiyt8+a2sNDEgMsqUohjnxZrq82Jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8449
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

T24gVGh1LCAyMDI0LTExLTE0IGF0IDEzOjA2ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IEkndmUgbm90aWNlZCBzaGFkZXJzL3BpcGVsaW5lcyBoYXZlIGxpbWl0YXRpb24g
dG8gd29yayBvbiAxNkINCj4gYm91bmRhcmllcyAoZHVlIHRvIFNJTUQxNikuIFNvIHRvIHBsYXkg
d2l0aCBkaWZmZXJlbnQgc3VyZmFjZSBzaXplcw0KPiBhbmQgb2Zmc2V0cyBhZGQgVy9IL1gvWSBz
d2l0Y2hlcy4NCj4gDQo+IFRoZXJlJ3Mgbm8gcHJvYmxlbSBhdCBhbGwgbm90IGFsbCBzaXplcy9v
ZmZzZXRzIGFyZSBzdXBwb3J0ZWQgYXMgd2UNCj4gd291bGQgbGlrZSB0byBoYXZlLCB3ZSB1c2Ug
Z3BncHUgZmlsbCB0byB2ZXJpZnkgY29tcHV0ZSB3b3JrbG9hZCBzbw0KPiBpZiB3ZSB3b24ndCBu
b3RpY2UgZ3B1IGhhbmcgdGhhdCdzIGZpbmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmll
dyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IERv
bWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4NCg0KQWdhaW4g
aXQgbWlnaHQgYmUgdXNlZnVsIGZvciB0ZXN0aW5nIGFueSBmdXR1cmUgZ3BncHVfZmlsbCBpbXBs
ZW1lbnRhdGlvbnMuDQoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZ3BncHVfZmls
bC5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVsL3hlX2dwZ3B1X2ZpbGwuYyBiL3Rlc3RzL2ludGVsL3hlX2dwZ3B1
X2ZpbGwuYw0KPiBpbmRleCA0ZTE3ODU0MzJiLi44MjYyNWJiN2MwIDEwMDY0NA0KPiAtLS0gYS90
ZXN0cy9pbnRlbC94ZV9ncGdwdV9maWxsLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZ3BncHVf
ZmlsbC5jDQo+IEBAIC00MCw2ICs0MCwxMCBAQA0KPiAgI2RlZmluZSBDT0xPUl80QwkweDRjDQo+
ICANCj4gIHN0YXRpYyBib29sIGR1bXBfc3VyZmFjZTsNCj4gK3N0YXRpYyB1aW50MzJfdCBzdXJm
d2lkdGggPSBXSURUSDsNCj4gK3N0YXRpYyB1aW50MzJfdCBzdXJmaGVpZ2h0ID0gSEVJR0hUOw0K
PiArc3RhdGljIHVpbnQzMl90IHN0YXJ0X3g7DQo+ICtzdGF0aWMgdWludDMyX3Qgc3RhcnRfeTsN
Cj4gIA0KPiAgdHlwZWRlZiBzdHJ1Y3Qgew0KPiAgCWludCBkcm1fZmQ7DQo+IEBAIC03MCwxMSAr
NzQsMTEgQEAgY3JlYXRlX2J1ZihkYXRhX3QgKmRhdGEsIGludCB3aWR0aCwgaW50IGhlaWdodCwg
dWludDhfdCBjb2xvciwgdWludDY0X3QgcmVnaW9uKQ0KPiAgCXJldHVybiBidWY7DQo+ICB9DQo+
ICANCj4gLXN0YXRpYyB2b2lkIGJ1Zl9jaGVjayh1aW50OF90ICpwdHIsIGludCB4LCBpbnQgeSwg
dWludDhfdCBjb2xvcikNCj4gK3N0YXRpYyB2b2lkIGJ1Zl9jaGVjayh1aW50OF90ICpwdHIsIGlu
dCB3aWR0aCwgaW50IHgsIGludCB5LCB1aW50OF90IGNvbG9yKQ0KPiAgew0KPiAgCXVpbnQ4X3Qg
dmFsOw0KPiAgDQo+IC0JdmFsID0gcHRyW3kgKiBXSURUSCArIHhdOw0KPiArCXZhbCA9IHB0clt5
ICogd2lkdGggKyB4XTsNCj4gIAlpZ3RfYXNzZXJ0X2YodmFsID09IGNvbG9yLA0KPiAgCQkgICAg
ICJFeHBlY3RlZCAweCUwMngsIGZvdW5kIDB4JTAyeCBhdCAoJWQsJWQpXG4iLA0KPiAgCQkgICAg
IGNvbG9yLCB2YWwsIHgsIHkpOw0KPiBAQCAtODUsMjYgKzg5LDI5IEBAIHN0YXRpYyB2b2lkIGJ1
Zl9jaGVjayh1aW50OF90ICpwdHIsIGludCB4LCBpbnQgeSwgdWludDhfdCBjb2xvcikNCj4gICAq
IERlc2NyaXB0aW9uOiBydW4gZ3BncHUgZmlsbA0KPiAgICovDQo+ICANCj4gLXN0YXRpYyB2b2lk
IGdwZ3B1X2ZpbGwoZGF0YV90ICpkYXRhLCBpZ3RfZmlsbGZ1bmNfdCBmaWxsLCB1aW50MzJfdCBy
ZWdpb24pDQo+ICtzdGF0aWMgdm9pZCBncGdwdV9maWxsKGRhdGFfdCAqZGF0YSwgaWd0X2ZpbGxm
dW5jX3QgZmlsbCwgdWludDMyX3QgcmVnaW9uLA0KPiArCQkgICAgICAgdWludDMyX3Qgc3VyZl93
aWR0aCwgdWludDMyX3Qgc3VyZl9oZWlnaHQsDQo+ICsJCSAgICAgICB1aW50MzJfdCB4LCB1aW50
MzJfdCB5LA0KPiArCQkgICAgICAgdWludDMyX3Qgd2lkdGgsIHVpbnQzMl90IGhlaWdodCkNCj4g
IHsNCj4gIAlzdHJ1Y3QgaW50ZWxfYnVmICpidWY7DQo+ICAJdWludDhfdCAqcHRyOw0KPiAgCWlu
dCBpLCBqOw0KPiAgDQo+IC0JYnVmID0gY3JlYXRlX2J1ZihkYXRhLCBXSURUSCwgSEVJR0hULCBD
T0xPUl84OCwgcmVnaW9uKTsNCj4gKwlidWYgPSBjcmVhdGVfYnVmKGRhdGEsIHN1cmZfd2lkdGgs
IHN1cmZfaGVpZ2h0LCBDT0xPUl84OCwgcmVnaW9uKTsNCj4gIAlwdHIgPSB4ZV9ib19tYXAoZGF0
YS0+ZHJtX2ZkLCBidWYtPmhhbmRsZSwgYnVmLT5zdXJmYWNlWzBdLnNpemUpOw0KPiAgDQo+IC0J
Zm9yIChpID0gMDsgaSA8IFdJRFRIOyBpKyspDQo+IC0JCWZvciAoaiA9IDA7IGogPCBIRUlHSFQ7
IGorKykNCj4gLQkJCWJ1Zl9jaGVjayhwdHIsIGksIGosIENPTE9SXzg4KTsNCj4gKwlmb3IgKGkg
PSAwOyBpIDwgc3VyZl93aWR0aDsgaSsrKQ0KPiArCQlmb3IgKGogPSAwOyBqIDwgc3VyZl9oZWln
aHQ7IGorKykNCj4gKwkJCWJ1Zl9jaGVjayhwdHIsIHN1cmZfd2lkdGgsIGksIGosIENPTE9SXzg4
KTsNCj4gIA0KPiAtCWZpbGwoZGF0YS0+ZHJtX2ZkLCBidWYsIDAsIDAsIFdJRFRIIC8gMiwgSEVJ
R0hUIC8gMiwgQ09MT1JfNEMpOw0KPiArCWZpbGwoZGF0YS0+ZHJtX2ZkLCBidWYsIHgsIHksIHdp
ZHRoLCBoZWlnaHQsIENPTE9SXzRDKTsNCj4gIA0KPiAgCWlmIChkdW1wX3N1cmZhY2UpIHsNCj4g
LQkJZm9yIChqID0gMDsgaiA8IEhFSUdIVDsgaisrKSB7DQo+ICsJCWZvciAoaiA9IDA7IGogPCBz
dXJmX2hlaWdodDsgaisrKSB7DQo+ICAJCQlpZ3RfaW5mbygiWyUwNHhdICIsIGopOw0KPiAtCQkJ
Zm9yIChpID0gMDsgaSA8IFdJRFRIOyBpKyspIHsNCj4gLQkJCQlpZ3RfaW5mbygiJTAyeCIsIHB0
cltqICogSEVJR0hUICsgaV0pOw0KPiArCQkJZm9yIChpID0gMDsgaSA8IHN1cmZfd2lkdGg7IGkr
Kykgew0KPiArCQkJCWlndF9pbmZvKCIlMDJ4IiwgcHRyW2ogKiBzdXJmX2hlaWdodCArIGldKTsN
Cj4gIAkJCQlpZiAoaSAlIDQgPT0gMykNCj4gIAkJCQkJaWd0X2luZm8oIiAiKTsNCj4gIAkJCX0N
Cj4gQEAgLTExMiwxMiArMTE5LDEzIEBAIHN0YXRpYyB2b2lkIGdwZ3B1X2ZpbGwoZGF0YV90ICpk
YXRhLCBpZ3RfZmlsbGZ1bmNfdCBmaWxsLCB1aW50MzJfdCByZWdpb24pDQo+ICAJCX0NCj4gIAl9
DQo+ICANCj4gLQlmb3IgKGkgPSAwOyBpIDwgV0lEVEg7IGkrKykNCj4gLQkJZm9yIChqID0gMDsg
aiA8IEhFSUdIVDsgaisrKQ0KPiAtCQkJaWYgKGkgPCBXSURUSCAvIDIgJiYgaiA8IEhFSUdIVCAv
IDIpDQo+IC0JCQkJYnVmX2NoZWNrKHB0ciwgaSwgaiwgQ09MT1JfNEMpOw0KPiArCWZvciAoaSA9
IDA7IGkgPCBzdXJmX3dpZHRoOyBpKyspDQo+ICsJCWZvciAoaiA9IDA7IGogPCBzdXJmX2hlaWdo
dDsgaisrKQ0KPiArCQkJaWYgKGkgPj0geCAmJiBpIDwgd2lkdGggKyB4ICYmDQo+ICsJCQkgICAg
aiA+PSB5ICYmIGogPCBoZWlnaHQgKyB5KQ0KPiArCQkJCWJ1Zl9jaGVjayhwdHIsIHN1cmZfd2lk
dGgsIGksIGosIENPTE9SXzRDKTsNCj4gIAkJCWVsc2UNCj4gLQkJCQlidWZfY2hlY2socHRyLCBp
LCBqLCBDT0xPUl84OCk7DQo+ICsJCQkJYnVmX2NoZWNrKHB0ciwgc3VyZl9oZWlnaHQsIGksIGos
IENPTE9SXzg4KTsNCj4gIA0KPiAgCW11bm1hcChwdHIsIGJ1Zi0+c3VyZmFjZVswXS5zaXplKTsN
Cj4gIH0NCj4gQEAgLTEyOCw2ICsxMzYsMTggQEAgc3RhdGljIGludCBvcHRfaGFuZGxlcihpbnQg
b3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkICpkYXRhKQ0KPiAgCWNhc2UgJ2QnOg0KPiAgCQlkdW1w
X3N1cmZhY2UgPSB0cnVlOw0KPiAgCQlicmVhazsNCj4gKwljYXNlICdXJzoNCj4gKwkJc3VyZndp
ZHRoID0gYXRvaShvcHRhcmcpOw0KPiArCQlicmVhazsNCj4gKwljYXNlICdIJzoNCj4gKwkJc3Vy
ZmhlaWdodCA9IGF0b2kob3B0YXJnKTsNCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSAnWCc6DQo+ICsJ
CXN0YXJ0X3ggPSBhdG9pKG9wdGFyZyk7DQo+ICsJCWJyZWFrOw0KPiArCWNhc2UgJ1knOg0KPiAr
CQlzdGFydF95ID0gYXRvaShvcHRhcmcpOw0KPiArCQlicmVhazsNCj4gIAlkZWZhdWx0Og0KPiAg
CQlyZXR1cm4gSUdUX09QVF9IQU5ETEVSX0VSUk9SOw0KPiAgCX0NCj4gQEAgLTEzOCwxMCArMTU4
LDE0IEBAIHN0YXRpYyBpbnQgb3B0X2hhbmRsZXIoaW50IG9wdCwgaW50IG9wdF9pbmRleCwgdm9p
ZCAqZGF0YSkNCj4gIA0KPiAgY29uc3QgY2hhciAqaGVscF9zdHIgPQ0KPiAgCSIgIC1kXHREdW1w
IHN1cmZhY2VcbiINCj4gKwkiICAtV1x0V2lkdGggKGRlZmF1bHQgNjQpXG4iDQo+ICsJIiAgLUhc
dEhlaWdodCAoZGVmYXVsdCA2NClcbiINCj4gKwkiICAtWFx0WCBzdGFydCAoYWxpZ25lZCB0byA0
KVxuIg0KPiArCSIgIC1ZXHRZIHN0YXJ0IChhbGlnbmVkIHRvIDEpXG4iDQo+ICAJOw0KPiAgDQo+
ICANCj4gLWlndF9tYWluX2FyZ3MoImQiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsIE5V
TEwpDQo+ICtpZ3RfbWFpbl9hcmdzKCJkVzpIOlg6WToiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hh
bmRsZXIsIE5VTEwpDQo+ICB7DQo+ICAJZGF0YV90IGRhdGEgPSB7MCwgfTsNCj4gIAlpZ3RfZmls
bGZ1bmNfdCBmaWxsX2ZuID0gTlVMTDsNCj4gQEAgLTE1MywxMCArMTc3LDE2IEBAIGlndF9tYWlu
X2FyZ3MoImQiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsIE5VTEwpDQo+ICANCj4gIAkJ
ZmlsbF9mbiA9IGlndF9nZXRfZ3BncHVfZmlsbGZ1bmMoZGF0YS5kZXZpZCk7DQo+ICAJCWlndF9y
ZXF1aXJlX2YoZmlsbF9mbiwgIm5vIGdwZ3B1LWZpbGwgZnVuY3Rpb25cbiIpOw0KPiArDQo+ICsJ
CXN0YXJ0X3ggPSBBTElHTihzdGFydF94LCA0KTsNCj4gIAl9DQo+ICANCj4gIAlpZ3Rfc3VidGVz
dCgiYmFzaWMiKSB7DQo+IC0JCWdwZ3B1X2ZpbGwoJmRhdGEsIGZpbGxfZm4sIDApOw0KPiArCQln
cGdwdV9maWxsKCZkYXRhLCBmaWxsX2ZuLCAwLA0KPiArCQkJICAgc3VyZndpZHRoLCBzdXJmaGVp
Z2h0LA0KPiArCQkJICAgc3RhcnRfeCwgc3RhcnRfeSwNCj4gKwkJCSAgIHN1cmZ3aWR0aCAvIDIs
DQo+ICsJCQkgICBzdXJmaGVpZ2h0IC8gMik7DQo+ICAJfQ0KPiAgDQo+ICAJaWd0X2ZpeHR1cmUg
ew0KDQo=
