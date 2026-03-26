Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5572E10A3D89
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9010E95D;
	Thu, 26 Mar 2026 12:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aXmfPyJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB7710E0BB
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774527885; x=1806063885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z2gyyi2oSfpEoYlWcTerdy0/3Q1obvzuykcyG9/3SsE=;
 b=aXmfPyJonjprORbhmEcPwrZ8k5f8q6niBChcyJ3man0xzf7gt6BOGR96
 G93S5iFZNPjw1A2v7L2ZlTpOiT2SlurOKLTU0k5EevmVv87f5IwQ8f3DW
 gSBftPcZRLUSHzDByAQtrKKNEImRziP1icIRQOgGdKT/T/z/ecjNnwO2K
 COyRtMcyjmLgEaQHLqAs/l/c+SaMGz0EUo+W1VMYFd+7pJh4xFcyPMXnd
 xTkYwPLq3yfyZ8MVHhZRwrkpNQubNBoka4kUgMaJYDp5jljjLIQCEIzCi
 /GO6J9jejZZxAkWc0fBDo60ybLLbULgZYvdNqHgZE5DdBzfrym0JpryTa g==;
X-CSE-ConnectionGUID: WWiLHFxBQcqOCjo1QbOplQ==
X-CSE-MsgGUID: uZYCOc1IS2eBKimJnjDKvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75486777"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75486777"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:24:42 -0700
X-CSE-ConnectionGUID: PFNtsOSmRUqI3mqIab5SVA==
X-CSE-MsgGUID: xRbwvMlXQ1CF7waTUXukNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="224171208"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:24:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 05:24:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 05:24:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 05:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HluM3/JlO0+G0or6dZ72lq8KFn6k2t/oZpynz2kGGsQs8nTlS2yBde5asC5JMvUt5EYQvJAIOI4qxtYVN2kh5xbABcpf7a9JQ90dEe3s5P9wCFxKYbU/8KJt4b9NB1EnUgP1Gi3w+uxvCwV9fqO2gkgJCI+f5vRv1I70dLELbSWQ6Tecri9gnZvpG2Hkd++6J89ojaupy5gu2d0IkfWZ5toKtKkTkheVrVK204x09lzq3yTD5+OCUR+/qAlx0gRnHnkU9WEKWcZKiWqBdqFgKrmjDiZMyJrjkcVGkEPLasdTSLypzr5u5GjEHWO6PhW/3LgoXzpBJtUcxdgxv/X8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2gyyi2oSfpEoYlWcTerdy0/3Q1obvzuykcyG9/3SsE=;
 b=ZV+KR+TX/EUmTk0PLmsQzmn0s7O5UyowaKnC/jDmj752gLZXZrf96bTZyyhTTuR0i6OMW147yHRc7vNeIp/XQFqHqdn63JrbiGHVoON7YM8LZQYOYiaONrYRoF4qrYd4Ld4OnDhKCvWWEIDizilJpFJTMms9mn+bb8f/L37WLyzIpdZn6rUQkZFfElLaPHkfP+Q+Zda310p+G8jcSfmFW19Q+kRRHycFfXB45krrAKBUXNxFp0QjKKmboy6+slSxuFEWfm65npuhWSVt9gsTpKUFXJggO0JtjQmqsVydBgXxN4Lug80c0Q5MwYjiI2n0LcTL2ZLqa3fbjbSgr3/Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 26 Mar
 2026 12:24:37 +0000
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::c4a2:cae4:2ec5:260b]) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::c4a2:cae4:2ec5:260b%6]) with mapi id 15.20.9745.007; Thu, 26 Mar 2026
 12:24:37 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Thread-Topic: [PATCH v7 i-g-t 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync
Thread-Index: AQHcvB0yzpDnfjozKEulKdvqFU0PibW/McQAgAGMYTA=
Date: Thu, 26 Mar 2026 12:24:37 +0000
Message-ID: <DS4PPF07B018B9FF08D19A1F3CBE66A53389456A@DS4PPF07B018B9F.namprd11.prod.outlook.com>
References: <20260325060339.2499618-1-sobin.thomas@intel.com>
 <20260325060339.2499618-3-sobin.thomas@intel.com>
 <310501a7a46810ded3d6b88f50da975ca798f04b.camel@intel.com>
In-Reply-To: <310501a7a46810ded3d6b88f50da975ca798f04b.camel@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF07B018B9F:EE_|CH3PR11MB8315:EE_
x-ms-office365-filtering-correlation-id: 4ca1ac7d-aa03-4a51-2703-08de8b32a54e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: eI3ldN0s+OjbbBS9QwyHtx59y7GmbThjpC9LqN5eP9zy+8Mif8fjD2HMejDcZihrN4yuIxHNV9IuCauDNrLTD0F0guyo/Gq7D4yaA9T+E1ya18r5d4wFdOUake3I6RsA2Klo4ThhhcP/SIGj0XvxRgDRaDnrNkV6hT/duDBklM17+xAKeC5FLX8rp/JE98JZOw/+IibqDwZGfx4LYIrV/cMeNxzUma8a/7C3X7hdMY4a2zQeRgsxZWUcABVl+zGFxlj4t8Vtvp8y3t3uCaTz+jlFm2ObJWr1qbU6/IDZl/V372lPETtAb5t1IHedfR8sH3Wd8h0efNjF370cDTyA+ylK6RN8Kgrox70j9UGzx3sNkIje9PXr4I0Hq/bKeKB/AfDy6p0BhGEn2dSxT6c6ZL+H+8FwMh5OP5sB37rED8BZycbkiSVj0GKPKdRYekx9mvl7x9M7ynw2p6+rjh65U3sd3Y0fSvb0rcNV0Eb+8EiELtszZ70zMqZalX1RaWmTVTGuRf5X1+4glEx42rtcTOlc711VzK/eIMVWl45kDIGg51IZ26ROwzutFCAfsCM+CNyatmofics6QsE4EqR0Un0fGccVf2uHBWxzlwnLf7XmXi4do6QXbGcsYrgPhMmA7sS22PvwEV146VMXMzeSMsskdE41VNeTfkqXiA8sBcRCyaq0CB/tOaUNzX1+ZkEuFewO1yQIx2Q64Bjbf2SXVg/KwQSV3g2DjWswv1WiiJ08hbd18AgKyCPnHP/+Osjp1MfsB30mwMgXUeK2d27RA1t8jZyPbZhI/2uTIFZ1G0g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF07B018B9F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(18002099003)(56012099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFJLUU1TamJvdjhzdEF6cE5SQlpwL2VVMzFaa0NUMDBuQm5uMDhZbUphMEpn?=
 =?utf-8?B?QklaZCtRTmdYUHFFVWw3OHhhai9zajVCaWNaTE1MekVLdkNvcitreW1RNmk1?=
 =?utf-8?B?bDQrSXJnQzcvVDlWMDBQbkFjeW8waGsxMDRkbjNsRVhSOGNwSU9obVRiaHFq?=
 =?utf-8?B?cTUwa2VJck1TNFpWb0pBYllSUERkbnlOQ1BWQU1qWkQxc2ZDOVdkK1M3ZnFE?=
 =?utf-8?B?bUNoWDNvVDhVZ1JwcFlhaXJHSElVbjZod1B2QWhQM0VVNFRRVi9GbENWK3c3?=
 =?utf-8?B?bWREeGhlWk9kY0VKZTY3RlB5M1FoMnJpMTVVU1BYOG53bysrd282UDY5djZj?=
 =?utf-8?B?OExRcFZzbFF3SWFIRWpQdUp4bk9abW9DdG4wUkdTUmd0YytpYWN0TmNVUFQ2?=
 =?utf-8?B?bkpsVmJGbktsOHFOaGI0dGkyNFJGMnhaajBRSjd2SnZjRDhjMHo4TU9JU1NV?=
 =?utf-8?B?LzJFNVlMdEp1L05pSnNsWWI1aU9tWmxXMzMxSlpOR0dsYURJK3J1TDRma2o4?=
 =?utf-8?B?bm5tTnN3cFRyWlpYTTNtR1QxNkN3cGtVYkVKeG1TUHFoK0lxMnBtZG1Vbnly?=
 =?utf-8?B?Wm83Qzk2U2ZJUGVKOVlSdC9ZMmU4MzN0N1U5WEIyU3IxR0kxUHc5T3dPNmFo?=
 =?utf-8?B?U2VXMU1aSXNRc0psekRpOUE0NWhKRzB6Um13dzVsdnhocTRPWG81ZlhtOTJN?=
 =?utf-8?B?NUxRclppSEZHNU8zWjRvOEhzRCtmS0dHS2paVk1MbnJ6aXgxNFdOTWN4SHFr?=
 =?utf-8?B?TjNYQWNOOW15VU9xZFNDd0tONWt0U3lkeW1IaFhEOFZRM0FQcS9MYys4TFBF?=
 =?utf-8?B?QlBYT0UwZkxNMXZhWWhldkxzTE9GNktNRTFkdzBJOGxHRGF5UGpVS3JQT2dt?=
 =?utf-8?B?QUo3OFZTYzV6ZW1VVldhaTE4czZjLy9HbncydVE3SFNtcDZmZWxEcFNnUzhN?=
 =?utf-8?B?eDRRR256bmZ0R3BCbUdDeFBBNFdBcnhtekxRRjhQc243aWtHdFc4Wm15d0sw?=
 =?utf-8?B?OGpGYzJwN04wM1U0REd6QXdyb2VYUFQxdHpVTTgxQk41eGF3aG03MjY1NUUw?=
 =?utf-8?B?bXNvaDJEQWpEbEdOYkIxbEFudVIvVXBvZmtsVm9QQzlGdU53R0Vrb2wzQ3Az?=
 =?utf-8?B?dFNqN0NVRWI4ZWN4YndoYnBSTWZWcjE5SG9XU05BS3NNZ2g4STA4clRxWGJC?=
 =?utf-8?B?T3FKSG5DL1VOK0JjZCs1Snd4N2dEdStsVnpJMGwvT0tBQjU3VmQ4OWNpUHJo?=
 =?utf-8?B?c1lRWllsNnUvTklTZnUza25qOUY4TWl2YTNkaVNoNG9rMFJxRG9KUFJkZ2tL?=
 =?utf-8?B?UEZuTkdUWnhMZlFKUVZDN0U4ekllVUxJL1RvSmMydHhjaXowelc0N2ZxQXVj?=
 =?utf-8?B?UUdjT2t1RzQwaHIxcktlWlhJaysxNWVEVjNudFRYdzVkWXcxZTRTRHl6amx3?=
 =?utf-8?B?OTlxUVhHcE5pUzJwTjNPUGxJQ2VNbTFoTjErZ0dmdXhrWnNXYWptVFZScm90?=
 =?utf-8?B?NTY1cGlVRWFyMWtjdWh3azJaTGh4Zmp6a3c4b0VjUW9QT2lGVXF2T2ZBaklV?=
 =?utf-8?B?ZGtBRmdXUno2UHc0dUl6ak5lQ1Z4R0twUkhGcTRlNFRPbmRMRVJWNEdQTlV2?=
 =?utf-8?B?MkJERVVxOWRGdjlUcTUvUjFoUUtiZHIvbEY3Wm11UlBqeC85WWZSN0UvdFNF?=
 =?utf-8?B?MUw4RnhWQUYyNExrdEtvVlVzQTM2RHliNjFlczBscWlBMjRpQ3gyTkU0Z1RL?=
 =?utf-8?B?djE2OExDQW93VWRzb3FLT0NCUTI4bFZJdkFCVWI3ZUpjbkZScTJUcEVJQTI0?=
 =?utf-8?B?c0pCdUJwZ1RLaGVMTU1RdXlta2dMYVh4UldadEttOVNsL1lxbVp5MFliNXdN?=
 =?utf-8?B?NitnQy9mZ1IwZzlXc1dpTU5HS241ZWhSbXBMd2ZzUTZ1b1MydjdGcEYxZzFl?=
 =?utf-8?B?VkQ3TmdPdmJMQjlxY1FQZDEyekpEM09ESnhqcWJlRk5vREkvRHY5UTd1VlY4?=
 =?utf-8?B?Yjd5RThGeDRVekRhdStBSCtMNzFta011Njh6U05zYUVQS3BsREpLYmRNVFpL?=
 =?utf-8?B?SDRCSFFPUklSNktINWtvd0cyY21BVmlKSU1LRTU0Q25XNmlDTTQ4WnArR2lz?=
 =?utf-8?B?cjZZcHIxK1l3U0FyQUM5bG5pdmZYY1YxSDdxUTVYUkJJMUtITjlzQ2NEemVT?=
 =?utf-8?B?OXlVa2ZjSlFENW8wTUJlUXpWcUVFdUlUZkQyNHVNbjlka2tXamdEaW5YdEk2?=
 =?utf-8?B?aVkvQ05ZWThHUFN3VXdWdERMTUNyQi84UmtzU01hVXBTVFFhN1BmTW9LTFJk?=
 =?utf-8?B?dXRSOEVpY2VPT0YrTFlieUNuajJKTVFOYWt1UHBBSURBNnhhZTFtSFlqdGlJ?=
 =?utf-8?Q?Q9tcQIU5oY1EFoTBtD2tj5hJtlZrExKn14FqFnfJtSXNg?=
x-ms-exchange-antispam-messagedata-1: 4zMTNl2uCgBVeQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eNnhdKC+vWIvTCEgL1Z5F7sm1lIqn3pqlRkDszSe0Kz38rFDCuNxLWQH99NComnImGXgfpCMmSXB3n1fr6yC+p4l32T3CCtx3YarK7gTTBlR4LOL7VvYzp0aliwPWT94jtPNRMl5mtBwx+tGcvFfXj9SIElFrnngjMNYfNNJSIZgmb98pX0p60tgh0hFj+BGud3Q0QRrohni6KVjt3utqQqiUcJqfNOIAZAIfbHkS5SIrDq6JYBd9NR1Dlw+ZO9k4awTP9zqHFjNi1QDgow1R44mA5HC3WS99Xi2tdm6dPYxWHP5EoD6EoLOHtH1S9Uo0sx7bQmHGVuxLjyVYLFXsA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF07B018B9F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca1ac7d-aa03-4a51-2703-08de8b32a54e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 12:24:37.1133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GcaZf/8ia0TvPWFoOPnZcjbM5oGWRO9cq31JYvx2PZZGQEWN7SNSuYVDg1Sd54rdporShAkvUmt2OqUGzpbhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
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

SGkgVGhvbWFzLA0KDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nLCBXaWxsIGJlIHNlbmRpbmcgdGhl
IGNoYW5nZXMgaW4gbmV4dCBwYXRjaC4NCg0KVHlwaWNhbGx5IGZvciB2ZXJzaW9ucyBvZiBhIGZ1
bmN0aW9uIHRoYXQgY2FuIGZhaWwsIHdlJ3JlIHVzaW5nIF9fZnVuY3Rpb25fbmFtZSgpLg0KDQpM
aWtlIF9feGVfdm1fYmluZF9scl9zeW5jKCkuICBBST8NCg0KQWdyZWVkLCB3aWxsIGNhbGwgX194
ZV92bV9iaW5kX2xyX3N5bmMoKSBmcm9tIHhlX3ZtX2JpbmRfbHJfc3luYy4NClRoYW5rcyBmb3Ig
cG9pbnRpbmcgb3V0Lg0KDQo+ICt7DQo+ICsJdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9
IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikpOw0KDQpIZXJlIHdlIHNob3VsZCBhY3R1YWxseSB1
c2UgdWludDY0X3Qgd2l0aG91dCB0aGUgdm9sYXRpbGUgYW5kIHVzZQ0KUkVBRF9PTkNFKCkgd2hl
biByZWFkaW5nIHRoZSB2YWx1ZSBwb2ludGVkIHRvIGluc3RlYWQuIEkga25vdyB0aGUgb3JpZ2lu
YWwgY29kZSBoYXMgdm9sYXRpbGUgYXMgd2VsbCwgYnV0IHRoZSBSRUFEX09OQ0UgaXMgdGhlIGJl
dHRlciBjaG9pY2UuDQoNCj0+IEFncmVlZCwNCg0KPiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5j
ID0gezB9Ow0KPiArCWludCByZXQgPSAwOw0KPiArCWludDY0X3QgdGltZW91dCA9IE5TRUNfUEVS
X1NFQyAqIDEwOw0KDQpXZSdyZSB0eXBpY2FsbHkgdXNpbmcgImNoaXN0bWFzIHRyZWUiIGxheW91
dCBpbiB0aGUgZGVjbGFyYXRpb24gaWYgcG9zc2libGUuIExvbmdlciBsaW5lcyBvbiB0b3AuDQoN
CiA9PiBBZ3JlZWQuDQoNCj4gKw0KPiArCWlmICghc3luY19hZGRyKQ0KPiArCQlyZXR1cm4gLUVO
T01FTTsNCj4gKw0KPiArCSpzeW5jX2FkZHIgPSAwOw0KDQpXUklURV9PTkNFKCkgd2hlbiB0aGUg
dm9sYXRpbGUgaXMgZ29uZS4NCg0KPiArDQo+ICsJc3luYy5mbGFncyA9IERSTV9YRV9TWU5DX0ZM
QUdfU0lHTkFMOw0KPiArCXN5bmMudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfVVNFUl9GRU5DRTsN
Cj4gKwlzeW5jLmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90ICopc3luY19hZGRyKTsN
Cg0KVHlwZS1jYXN0IGNhbiBiZSByZW1vdmVkIGlmIHdlIGRpdGNoICJ2b2xhdGlsZSItDQoNCj4g
KwlzeW5jLnRpbWVsaW5lX3ZhbHVlID0gQklORF9TWU5DX1ZBTDsNCg0KVXNlIGFuIGluaXRpYWxp
emVyIGxpa2UgaW4gdGhlIG9yaWdpbmFsLg0KPT4gQWdyZWVkIA0KPiArDQo+ICsJcmV0ID0gX194
ZV92bV9iaW5kKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIHNpemUsDQo+IERSTV9YRV9WTV9CSU5E
X09QX01BUCwgZmxhZ3MsDQo+ICsJCQkgICAmc3luYywgMSwgMCwgIERFRkFVTFRfUEFUX0lOREVY
LCAwKTsNCj4gKw0KPiArCWlmIChyZXQpDQo+ICsJCWdvdG8gb3V0Ow0KPiArDQo+ICsJaWYgKCpz
eW5jX2FkZHIgIT0gQklORF9TWU5DX1ZBTCkgew0KDQpSRUFEX09OQ0UoKQ0KDQo+ICsJCXJldCA9
IF9feGVfd2FpdF91ZmVuY2UoZmQsICh1aW50NjRfdCAqKXN5bmNfYWRkciwNCg0KRHJvcCB0eXBl
LWNhc3QuDQoNCj4gIEJJTkRfU1lOQ19WQUwsDQo+ICsJCQkJICAgICAgIDAsICZ0aW1lb3V0KTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIG91dDsNCg0KSW5kZW50YXRpb24gbG9va3Mgb2ZmLCBi
dXQgdGhpcyBpZi1zdGF0ZW1lbnQgZG9lc24ndCBhY3R1YWxseSBkbyBhbnl0aGluZywgcmlnaHQ/
IEJvdGggYnJhbmNoZXMgZW5kIHVwIGF0IHRoZSBzYW1lIHBsYWNlPw0KDQo+ICsJfQ0KPiArDQo+
ICtvdXQ6DQo+ICsJZnJlZSgodm9pZCAqKXN5bmNfYWRkcik7DQoNCkRyb3AgdHlwZS1jYXN0Lg0K
DQpUaGlzIHNob3VsZCAqb25seSogYmUgZnJlZWQgaWYgdGhlIHdhaXQgZGlkbid0IHN1Y2NlZWQu
IElmIHdlIHRpbWVkIG91dCBhbmQgZnJlZSBoZXJlLCB0aGVuIEtNRCBjYW4gc3RpbGwgd3JpdGUg
dG8gc3luY19hZGRyIGFuZCBjb3JydXB0IHRoZSBoZWFwLCBzbyBpdCdzIGJldHRlciB0byBpbnRl
bnRpb25hbGx5IGxlYWsgbWVtb3J5IG9uIGZhaWx1cmUgaGVyZS4NCi0+IEFncmVlZCwgd2lsbCBr
ZWVwIHhlX3dhaXRfdWZlbmNlIGFuIGFzc2VydCBvbiBmYWlsdXJlLg0KDQpUaGlzIGZ1bmN0aW9u
IHNob3VsZCBiZSBjYWxsaW5nIHRoZSBuZXcgZnVuY3Rpb24gYW5kIGFzc2VydCB0aGF0IHRoZSBy
ZXR1cm4gdmFsdWUgaXMgMC4gUG90ZW50aWFsIHRvIHJlbW92ZSBzb21lIGNvZGUuIEFJPw0KDQot
PiBBZ3JlZWQsICBXaWxsIGJlIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiBmcm9tIHhlX3ZtX2JpbmRf
bHJfc3luYyBhbmQgd2lsbCBhc3NlcnQgaW4gY2FzZSB0aGlzIGZ1bmN0aW9uIHJldHVybnMgbm9u
LXplcm8uDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhlbGxzdHJvbSwg
VGhvbWFzIDx0aG9tYXMuaGVsbHN0cm9tQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1h
cmNoIDI1LCAyMDI2IDY6MTQgUE0NClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
VGhvbWFzLCBTb2JpbiA8c29iaW4udGhvbWFzQGludGVsLmNvbT4NCkNjOiBTaGFybWEsIE5pc2hp
dCA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHY3IGktZy10
IDIvM10gbGliL3hlOiBBZGQgZmFpbGFibGUgdmFyaWFudCBvZiB4ZV92bV9iaW5kX2xyX3N5bmMN
Cg0KSGkhDQoNClBhdGNoIGxvb2tzIG1vc3RseSBjb3JyZWN0LCBidXQgc29tZSBxdWVzdGlvbnMg
LyBjb21tZW50cyBiZWxvdy4NCg0KT24gV2VkLCAyMDI2LTAzLTI1IGF0IDA2OjAzICswMDAwLCBT
b2JpbiBUaG9tYXMgd3JvdGU6DQo+IEludHJvZHVjZSBhIG5ldyBmYWlsYWJsZSB2YXJpYW50IHRo
YXQgcmV0dXJucyBlcnJvciBjb2RlcyBpbnN0ZWFkIG9mIA0KPiBhc3NlcnRpbmcsIGFsbG93aW5n
IGNhbGxlcnMgdG8gaGFuZGxlIGVycm9ycyBleHBsaWNpdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU29iaW4gVGhvbWFzIDxzb2Jpbi50aG9tYXNAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIv
eGUveGVfaW9jdGwuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiDCoGxpYi94ZS94ZV9pb2N0bC5oIHzCoCAyICsrDQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzOCBp
bnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmMgYi9saWIv
eGUveGVfaW9jdGwuYyBpbmRleCANCj4gMTZhYWUwNWM5Li4zMGM4YTE1ZjYgMTAwNjQ0DQo+IC0t
LSBhL2xpYi94ZS94ZV9pb2N0bC5jDQo+ICsrKyBiL2xpYi94ZS94ZV9pb2N0bC5jDQo+IEBAIC03
OTUsNiArNzk1LDQyIEBAIHZvaWQgeGVfdm1fYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qg
dm0sIA0KPiB1aW50MzJfdCBibywgdWludDY0X3Qgb2Zmc2V0LA0KPiDCoAlmcmVlKCh2b2lkICop
c3luY19hZGRyKTsNCj4gwqB9DQo+IMKgDQo+ICtpbnQgeGVfdm1fYmluZF9scl9mYWlsYWJsZShp
bnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBleGVjX3F1ZXVlLA0KPiB1aW50MzJfdCBibywg
dWludDY0X3Qgb2Zmc2V0LA0KPiArCQkJwqDCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXpl
LCB1aW50MzJfdA0KPiBmbGFncykNCg0KVHlwaWNhbGx5IGZvciB2ZXJzaW9ucyBvZiBhIGZ1bmN0
aW9uIHRoYXQgY2FuIGZhaWwsIHdlJ3JlIHVzaW5nIF9fZnVuY3Rpb25fbmFtZSgpLg0KDQpMaWtl
IF9feGVfdm1fYmluZF9scl9zeW5jKCkuICBBST8NCg0KDQo+ICt7DQo+ICsJdm9sYXRpbGUgdWlu
dDY0X3QgKnN5bmNfYWRkciA9IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikpOw0KDQpIZXJlIHdl
IHNob3VsZCBhY3R1YWxseSB1c2UgdWludDY0X3Qgd2l0aG91dCB0aGUgdm9sYXRpbGUgYW5kIHVz
ZQ0KUkVBRF9PTkNFKCkgd2hlbiByZWFkaW5nIHRoZSB2YWx1ZSBwb2ludGVkIHRvIGluc3RlYWQu
IEkga25vdyB0aGUgb3JpZ2luYWwgY29kZSBoYXMgdm9sYXRpbGUgYXMgd2VsbCwgYnV0IHRoZSBS
RUFEX09OQ0UgaXMgdGhlIGJldHRlciBjaG9pY2UuDQoNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMg
c3luYyA9IHswfTsNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKwlpbnQ2NF90IHRpbWVvdXQgPSBOU0VD
X1BFUl9TRUMgKiAxMDsNCg0KV2UncmUgdHlwaWNhbGx5IHVzaW5nICJjaGlzdG1hcyB0cmVlIiBs
YXlvdXQgaW4gdGhlIGRlY2xhcmF0aW9uIGlmIHBvc3NpYmxlLiBMb25nZXIgbGluZXMgb24gdG9w
Lg0KDQoNCj4gKw0KPiArCWlmICghc3luY19hZGRyKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4g
Kw0KPiArCSpzeW5jX2FkZHIgPSAwOw0KDQpXUklURV9PTkNFKCkgd2hlbiB0aGUgdm9sYXRpbGUg
aXMgZ29uZS4NCg0KPiArDQo+ICsJc3luYy5mbGFncyA9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFM
Ow0KPiArCXN5bmMudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfVVNFUl9GRU5DRTsNCj4gKwlzeW5j
LmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90ICopc3luY19hZGRyKTsNCg0KVHlwZS1j
YXN0IGNhbiBiZSByZW1vdmVkIGlmIHdlIGRpdGNoICJ2b2xhdGlsZSItDQoNCj4gKwlzeW5jLnRp
bWVsaW5lX3ZhbHVlID0gQklORF9TWU5DX1ZBTDsNCg0KVXNlIGFuIGluaXRpYWxpemVyIGxpa2Ug
aW4gdGhlIG9yaWdpbmFsLg0KDQo+ICsNCj4gKwlyZXQgPSBfX3hlX3ZtX2JpbmQoZmQsIHZtLCAw
LCBibywgMCwgYWRkciwgc2l6ZSwNCj4gRFJNX1hFX1ZNX0JJTkRfT1BfTUFQLCBmbGFncywNCj4g
KwkJCcKgwqAgJnN5bmMsIDEsIDAswqAgREVGQVVMVF9QQVRfSU5ERVgsIDApOw0KPiArDQo+ICsJ
aWYgKHJldCkNCj4gKwkJZ290byBvdXQ7DQo+ICsNCj4gKwlpZiAoKnN5bmNfYWRkciAhPSBCSU5E
X1NZTkNfVkFMKSB7DQoNClJFQURfT05DRSgpDQoNCj4gKwkJcmV0ID0gX194ZV93YWl0X3VmZW5j
ZShmZCwgKHVpbnQ2NF90ICopc3luY19hZGRyLA0KDQpEcm9wIHR5cGUtY2FzdC4NCg0KPiAgQklO
RF9TWU5DX1ZBTCwNCj4gKwkJCQnCoMKgwqDCoMKgwqAgMCwgJnRpbWVvdXQpOw0KPiArCWlmIChy
ZXQpDQo+ICsJCWdvdG8gb3V0Ow0KDQpJbmRlbnRhdGlvbiBsb29rcyBvZmYsIGJ1dCB0aGlzIGlm
LXN0YXRlbWVudCBkb2Vzbid0IGFjdHVhbGx5IGRvIGFueXRoaW5nLCByaWdodD8gQm90aCBicmFu
Y2hlcyBlbmQgdXAgYXQgdGhlIHNhbWUgcGxhY2U/DQoNCj4gKwl9DQo+ICsNCj4gK291dDoNCj4g
KwlmcmVlKCh2b2lkICopc3luY19hZGRyKTsNCg0KRHJvcCB0eXBlLWNhc3QuDQoNClRoaXMgc2hv
dWxkICpvbmx5KiBiZSBmcmVlZCBpZiB0aGUgd2FpdCBkaWRuJ3Qgc3VjY2VlZC4gSWYgd2UgdGlt
ZWQgb3V0IGFuZCBmcmVlIGhlcmUsIHRoZW4gS01EIGNhbiBzdGlsbCB3cml0ZSB0byBzeW5jX2Fk
ZHIgYW5kIGNvcnJ1cHQgdGhlIGhlYXAsIHNvIGl0J3MgYmV0dGVyIHRvIGludGVudGlvbmFsbHkg
bGVhayBtZW1vcnkgb24gZmFpbHVyZSBoZXJlLg0KDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4g
Kw0KPiDCoHZvaWQgeGVfdm1fdW5iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWlu
dDY0X3Qgb2Zmc2V0LA0KPiDCoAkJCcKgIHVpbnQ2NF90IGFkZHIsIHVpbnQ2NF90IHNpemUpDQo+
IMKgew0KDQpUaGlzIGZ1bmN0aW9uIHNob3VsZCBiZSBjYWxsaW5nIHRoZSBuZXcgZnVuY3Rpb24g
YW5kIGFzc2VydCB0aGF0IHRoZSByZXR1cm4gdmFsdWUgaXMgMC4gUG90ZW50aWFsIHRvIHJlbW92
ZSBzb21lIGNvZGUuIEFJPw0KDQpUaGFua3MsDQpUaG9tYXMNCg0KDQo+IGRpZmYgLS1naXQgYS9s
aWIveGUveGVfaW9jdGwuaCBiL2xpYi94ZS94ZV9pb2N0bC5oIGluZGV4IA0KPiAzZWE2NTEwNjMu
LmViYTEwYmQzNCAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmgNCj4gKysrIGIvbGli
L3hlL3hlX2lvY3RsLmgNCj4gQEAgLTExNiw2ICsxMTYsOCBAQCBzdHJ1Y3QgZHJtX3hlX21lbV9y
YW5nZV9hdHRyDQo+IMKgdm9pZCB4ZV92bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2
bSwgdWludDMyX3QgYm8sDQo+IMKgCQkJdWludDY0X3Qgb2Zmc2V0LCB1aW50NjRfdCBhZGRyLA0K
PiDCoAkJCXVpbnQ2NF90IHNpemUsIHVpbnQzMl90IGZsYWdzKTsNCj4gK2ludCB4ZV92bV9iaW5k
X2xyX2ZhaWxhYmxlKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGV4ZWNfcXVldWUsDQo+
IHVpbnQzMl90IGJvLCB1aW50NjRfdCBvZmZzZXQsDQo+ICsJCQnCoMKgIHVpbnQ2NF90IGFkZHIs
IHVpbnQ2NF90IHNpemUsIHVpbnQzMl90DQo+IGZsYWdzKTsNCj4gwqB2b2lkIHhlX3ZtX3VuYmlu
ZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4gwqAJCQnC
oCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplKTsNCj4gwqAjZW5kaWYgLyogWEVfSU9DVExf
SCAqLw0K
