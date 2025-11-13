Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F44CCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 07:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9643310E0C0;
	Thu, 13 Nov 2025 07:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaIL8P3H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25F210E0C0;
 Thu, 13 Nov 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763019985; x=1794555985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bCLJ7/fKuDzhcEKNsoO1C0Mq+q/RUqjyjXEWntkUaPY=;
 b=XaIL8P3Hx8cg/huzlgMQjixYDdanSxi01VQDSUjpkxBOC50sLfFOftLX
 6WfqDMBPF24zsxMa9tqPHuKNnHD5/5hUQwTLg9kIuh3L1biE0TLcSp7Os
 xiB+s17WlAhi1jE7HnAlH6iJKvgxe77R3Fm0wMqY2Psv1PplHQ8bSi/cH
 jr/mt/KLGw2ydATz8fZlHEg38zlr3MD3/G5HJS3P73506xXOKexVl55oq
 nO+xZ77YQB4/1UV6UYqzSKo8PUnDTG3Uun/nMi4/Ynk5eIxnzS38ePrMd
 X28K9ljCZGr0v/M+EEf6xKOe8qFeFM/fcFETlLOr1Ahb3cP3+yV/Ms8KE w==;
X-CSE-ConnectionGUID: vzy4tWq+RG2jP31iMY88qw==
X-CSE-MsgGUID: dbh5eLxCT+2hMCRSB3afzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64800987"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64800987"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:46:25 -0800
X-CSE-ConnectionGUID: ZLyzhSTuRJO8Xpov4WZcXA==
X-CSE-MsgGUID: MBK6FBazRp+2Z/U9jAOyHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220090170"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 23:46:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 23:46:25 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 23:46:25 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.21)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 23:46:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVeY058EpfKqUoo3jo+4NLOYINqk6EOBB1z9RIEqrTgKodSUIAp7lMIRNPbkLCwjew6HLDWvLKC9vgd1gHxCovqADhGccauaQtXUyMoTjzqze4Kqx/lQBi0D62ZZlbnSkHhFuGmCGBZBTxsGAI7pb/0FvnIxmnER6KGU8t5SS01ie3xN7uL+1qQalWq3b7cm+cmHRT0ldiNOTUE+9NdCg+/lYXylU6dE+q/VuNDzCGagmF1SByI+WyFKlKI+VRlLi8EqCC6a65PhR5Fv+Xm4egJnllxSFdNefiXFou//OhsNKVki3Vu81pfqoaqw/Vg1JPr8iOw+/nk8uo0OQQo8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCLJ7/fKuDzhcEKNsoO1C0Mq+q/RUqjyjXEWntkUaPY=;
 b=dKWpVxyQpXwwFrXOnt0mnN0SGpy9qN1xeigloofcUh/MZnhDmvUDiuZY4dtNlh7+6Up3QhhHHNtfCDIQKJrauCf9sjn4NinZKrecKhGWHJDXhc0/h3oVJJwW/XSYTnTUQUsDtD0tUpTaAH4vXdGkLM02wBtgitk8ecUDqs50KVT1lxvL7cdDzydJoCXK0mpnKaqtXA6XxHjk2UZ22YC8a6AfG5cBjxqw1Fcz/EVq+DBLa36J3zJAr9fH2MPE/j3O08F7wAMcr9QuGumLHkQCCrz+yXvbHeu3biVUpIMtZnN7brhc5oM7W4Ci0BvvWDG/nd4ZHxrMQ08CNm8IBJuVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 07:46:23 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:46:23 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2RtYWJ1?=
 =?utf-8?Q?f:_Avoid_soft_lockups_on_slow_platforms_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvZG1hYnVmOiBB?=
 =?utf-8?Q?void_soft_lockups_on_slow_platforms_(rev2)?=
Thread-Index: AQHcU7635Luw3aqbtES+9csIIUfwg7TwM0aw
Date: Thu, 13 Nov 2025 07:46:22 +0000
Message-ID: <CH0PR11MB5491FD5BCE198C43C21CC3B9EFCDA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
 <176264564673.33229.10496747398313496958@10055242dc62>
 <1969470.eGJsNajkDb@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <1969470.eGJsNajkDb@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SJ2PR11MB7427:EE_
x-ms-office365-filtering-correlation-id: 9f3c7cf1-99fe-479a-8f48-08de2288be18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|13003099007|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?UHgrbE5IbE5EaTBmdWFkQTMzQ1EyK0hGSzAvbkUyTnBTc2pVVmtMT29penp6?=
 =?utf-8?B?R0ZwSGlHV1pLekhGYkNiQUV5MUJDQ3EzN2hmRFRnYklGMmtDaTZQMzRyTDN4?=
 =?utf-8?B?a3I1WEU0R1lpYzMrdmpRU2RnWGVBZ2FHMGJYam1hRjlubFdzN08zdTV1VTYv?=
 =?utf-8?B?bjdlQStZTEFqVGVaVmo1OTdzNVZDSUNrL3MwUm4wT09PQzZPSXR6ZHNqRDk2?=
 =?utf-8?B?c3I2M1h4cWFhbTlOZGplYUY3K1FlQXVRaG93QnRra3RnODNMcERPODA0cUVR?=
 =?utf-8?B?bnM1Z25WeWVwNUk4b0tHYUYvQ2lCWi9QRTl0ZkNwb1c3amVuUHlQL2hKM0h0?=
 =?utf-8?B?T3pZYVNPUjR0WXVPMWNPV2hNaVRVMnRPbXM4SlJGTXFyUXRyRmdHK3kzeFI3?=
 =?utf-8?B?bDdTRHZhSzNzMFJtTC9jMElHL2pKTTNlZ3lKeWRLdzdERGorZFBkNnZqNkVr?=
 =?utf-8?B?UDFzTDhzL1ZBMTl2eTdIcTE4S2xSTHhYREE0SEkxdVlDNUFrV1FvcnEvWHlM?=
 =?utf-8?B?Tnc4Qk1mbVNJSWhwbHdPdytYL0RDUnB3bW5sQkZobEpzaFJ1TDdqaVIxWXRB?=
 =?utf-8?B?ZFQzNDJ3ZHdPb0NNYVdKTVZnbXROdmcrUlUwTlVCd2ZMRmswdlZNTGNTRkJr?=
 =?utf-8?B?R1VWUkZEY2dYV296andlZCtpUnBBTlRKQ3VXU2g4c0p4VVprOE16M3IydUhu?=
 =?utf-8?B?TURWQ3ZsREozZS8vUlJoc3VRbjJkU0RhTGZ2bzhIQUhLdWNkQ3h1WlB5K2Fz?=
 =?utf-8?B?dmFUYjJkUkFiUjlpUEEyejloWi8vczdYWE92b0FSUm40d2dReVJDQUtZeitq?=
 =?utf-8?B?eWM3SCsyWXBSb1NHT0o2d3ByWkF1Ri9KV01NVWJzSi9XMWtMdWFGNC8vcWVO?=
 =?utf-8?B?M3paUWdGQWZtYjVrWWJZcGY4TitNSmpndDI2TUd0SVFYczBKM0t4bk91Yith?=
 =?utf-8?B?T3FXaUFqUkhnYTg1M0JMMjRycVR1eEpCdDc1ZFp3L29ZeEcwb20yRnBVTTRU?=
 =?utf-8?B?WE5xQzNzdWNMNGhwc3o5U2t1bjNpamRCaFZDSzlyMitKZURKZGFJMTBlTm91?=
 =?utf-8?B?VVR0SUhIaUtheFNBeVZ0d0FPMWoyUytaVnFpajRkUmluUUNBNHZGZ2ZzbE1M?=
 =?utf-8?B?NGFoUEZYYXdMWFZjTWhNT0dnZ3RYcHhZanRDajB6eGMzVFh2RnB1YlZwMy9z?=
 =?utf-8?B?NzRoMDR0NDJTcU9xcDQ4UnZQMExrZEIydFl0aXdqd1R4Q3dYcS9wUDViVmlQ?=
 =?utf-8?B?NENFUzBuOFZ2Ylc4NDMxYnpVZ0trdldLM0pWOXdoZDVvZXdPcERWS0RoMlFz?=
 =?utf-8?B?TDVBOHF0cm84eG91RFdnbCtMeDRuVEVENzFtajE2UHBtcFpzY0haRmRWTXBK?=
 =?utf-8?B?eXdhTXdqenJuZE9zYzM0eDVGVEpJbElUK29QMjg4TUQ1VEEwT1hLUjhmQVll?=
 =?utf-8?B?c21RYkdzK1haaGxtWWJZZUN4VVcxM0FwTTF4L3ZTZCtrdkNXWFppUmRPVjZ5?=
 =?utf-8?B?T3NhZ3B3c3Y3MVhObHpIdW9tUjloazhoMm5ZZWZMSHVCV3JsNVdqVGlVT21m?=
 =?utf-8?B?R0NhWjE2UUtjTXM5T2duaDZrb29hby9qOXAxWnVsNlV6RUE4RkN5T1k5TlZP?=
 =?utf-8?B?QnV2eUFpY0xHWU16RnRTbTZEbFdrQ2J4ZmhzaFJzKzQrV3VOODRNRlpaakl0?=
 =?utf-8?B?RVpJamx1OUpvc1FWd0JvbEh5NGs3YnpkbERCbzk4am03U2g0ajBPOUJnZE95?=
 =?utf-8?B?eEZZWjQ1ZTNYaUIrb0FwcVpqSG9iSnMvZ2JMdm51UHBnTVh6U3lNU2wwenRZ?=
 =?utf-8?B?OTJOSG5sK0xaSGRGRjlPQjlnb0VqMXFtL1ZyNmJlZjhnbGpwb1NIK0h6a1Jp?=
 =?utf-8?B?NkRxZzZMbDlWbDliYUZEQTF3Y1NGZFBGZUFKTXBHaXlEOUpGRURlTEVnWFlL?=
 =?utf-8?B?ZWtUYWFuTXVDb0o4enFabXc2R0t0ckZKVTZRby9HTEJEaC9HWnFpVDJNMTMv?=
 =?utf-8?B?T1ptQ0pNc3RBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(13003099007)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aURObXNCWWlIc1pJN1FIOWJ1VmxrK2UvdVNmQXJCSEhsOGpwM3JDTXZ0Y3dT?=
 =?utf-8?B?YnpDeFFqeEc4VlpKZmxGTnpOdThFc25oQWJpbkk5U2pyMjRkdFRUSDhma01L?=
 =?utf-8?B?Y0QySFNBUjNEVU5GREwxK2l2ZGUzZUw4aElGYVZDc3dHUjM4aUhkWVA2WUpq?=
 =?utf-8?B?QnJYQ0hhTWlCbG5uTjFoU2VpK1ZJWW9WNGFITm1RVFdWYk5SSnVrVk1VME15?=
 =?utf-8?B?ZEUxa3ZEUnRhMzNvNWdBdWtCVzVTNW1XaXZyc0lBTWJhbjVWV2ZiN1dMcDU1?=
 =?utf-8?B?WXpDRnFwVWRGQjBjSUpEYlppcm54d0hLWGQvT1BwTE1URnZKclpJNkJNZ3VI?=
 =?utf-8?B?dnkweWdxYUdOSWhkVXJoSmZoOUhSVUhyc1BxMTYvU3F4Ujlqejc0UU9pelVa?=
 =?utf-8?B?ak1qWjVPdzlQaFVRNHRLWDRneFlvZWlFWVpUWWJmMzBVNFVHL2xic2tUZXdp?=
 =?utf-8?B?UFE5TzU2OHAyM2VqUkhUeGlCVDBmankyQ2Z3Lzl3Zk9tQis4eE5lOWJEeTVJ?=
 =?utf-8?B?ZVBHdDdKa2Z6NFNTVlN2OXVEYTZ5R1NGb0w5bXh5QWZ4Sk84YTlWUkZWYzlh?=
 =?utf-8?B?cmZFckVvYUw1d3YrVjk0aTEyaGRxNkF0K1ZHZG9IS2hya09YOUttYStoOS9Z?=
 =?utf-8?B?RDdGVU9RT3hOdHlxK29za2o0WDFLdG1tRWFUdjlDZTBsbjhmcnVVV3k2d2s2?=
 =?utf-8?B?NTlqL2UxYU5VYXc0MjREbWo4Ly9ZWGg0bWs3M1JqNzlQemdXL1FpZ1cyeVlj?=
 =?utf-8?B?dlozMlJBSFJzY3BDS2hBL2JmdzlaS2JyaEw0eGFoT0NualZTSEE4bVZFTGJC?=
 =?utf-8?B?ZkJkMjg3dVJPektmU1kyNS9SMm5Wbm1hdzNUVGwzR0o5bEJZTlNLWUwraHFt?=
 =?utf-8?B?aHdCMUd5QVQ1MUFmTDEydUhjYjd2cHkzbURNbyt6VmVhdkRMcnlsSjZTZkow?=
 =?utf-8?B?SzB0UmU1M01PWFZYRkNQUlJQOG0veFh6NFQyTFJwdE5tbENIZDUwZ2pTMTJS?=
 =?utf-8?B?T0ZqOXZwQXVzM3pteHdib0Y5a2I4bEVVMTI4UGp0RTZLa3hyeXBXbGM1RWpU?=
 =?utf-8?B?YklqNVdFNnhLKzhDUFp3QzZOSDdnRmVsc1hlZlRlS1RUN0c5emU2NnFMeXZv?=
 =?utf-8?B?RDhzZ0tWRjR4VytFMEx2YnVoYUFobk9zaGJlK3pvdTZQR2g0azNybURSdHJC?=
 =?utf-8?B?VnlMQXVLWXhFUndkbVhLZ1NHcUZmUDFwcHVtWEh5Y3A5NXFXTFRRUCtFYjRw?=
 =?utf-8?B?YVBlcmtyMFlOc3NtcFdQM25SMHd4M2lCWnViaXBXeU5jK0dBVVVuN3ZUQlRL?=
 =?utf-8?B?NHpXSkhNVENDRnpiekpKZ0UwT3Y1c1hObEZ6KzN3MFpsSkFMR1hsdVYraE5U?=
 =?utf-8?B?a2NPV0VLQkNNUjUrRFlDbHlaSHk1elRKTGRycm1oMjM0WVhGZkFnWEdsWWtt?=
 =?utf-8?B?OEtOKzloYnZlNFRvZk44aWc3dHdraVU1SlhoN2lhQVhsU1NGSDFEdDR0aUh4?=
 =?utf-8?B?aEFGNU1JenVFRWJ6SEVyVzFwRGdSS1ExREFHU3NpSnc2ZWJkTVhpbFlaZUhn?=
 =?utf-8?B?Z2FlWFNXeHVPSnlYbllSU21UT20zakhpMy8yU2MrMk1mdEhYTVVtanJPTkxV?=
 =?utf-8?B?aHZMN1c4SmxjRnJtQTFDTGtxS0M2amZBWEpvNU5yTFpORWZETktJMnhjRVpI?=
 =?utf-8?B?aEpvZUdNN3RYSDFOekg0Q3BkQk9lQnA4czZXVGh5YVdKN29WOUE5RStWOFdW?=
 =?utf-8?B?YXVFcThwaERNUmxSUWsrWGMrYlFLRXE1am8ydEQrWTdwYVkzZzRyaEJvMTNU?=
 =?utf-8?B?NnBkNWhzZDFlWU1xWU8xV1kwVWlFV2tnRW1FT2h3RGNEak1vU2MrL3RzMUN2?=
 =?utf-8?B?RTk1SHpOS0xpSXd2Qy85QUZkMDUwUUJxZ0FuR2hhYkUrb0g1TGtocitVOEgx?=
 =?utf-8?B?Z2pPS1NlTUE5S3ZEOVlqRkUrU2lmN3ZHOXRlS0I3dDZ6NGFzMVkvaGFLY09L?=
 =?utf-8?B?NmpmQUNFL0pGOXpJaUxRMTAxaWI5bkRoS2Vxd3oyTWZCcXQ3blhnaWZhY1Yy?=
 =?utf-8?B?TEFjK3hLcHkxN2hNVHFrYUdxc1ZyUlZzSEVwUXFuSTlvd3MxNTMwNEFSQ1Q0?=
 =?utf-8?B?eTJFYVlsRW5kem5GVkJYb1R0MmlRa1B6cE9NWFUveHZrVVkzd2NKWVhta1Fq?=
 =?utf-8?Q?qrE/D9BXDPie+G3Gw374MjOxqBzMhc7pao7SEUgnAPfs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3c7cf1-99fe-479a-8f48-08de2288be18
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 07:46:23.2804 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f9H2P5+db+2Aeb1dn5FuA/KfVvHP4ilA22LmP7q38TKKddcgKLotNMpjMDaPog+qBc5OFEjNAj126t8L1S128JowbWFaBdaF/etnf8iIs5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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

SGksDQoNCiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1Njk5OS8N
Cmk5MTUuQ0kuRlVMTCAtIFJlLXJlcG9ydGVkLg0KWGUuQ0kuRnVsbCAtIEFkZHJlc3NlZCBmYWls
dXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWlu
ZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFudXN6IEty
enlzenRvZmlrDQpTZW50OiAxMiBOb3ZlbWJlciAyMDI1IDE1OjUzDQpUbzogSTkxNS1jaS1pbmZy
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2RtYWJ1
ZjogQXZvaWQgc29mdCBsb2NrdXBzIG9uIHNsb3cgcGxhdGZvcm1zIChyZXYyKQ0KDQpIaSBJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gU3VuZGF5LCA5IE5vdmVtYmVy
IDIwMjUgMDA6NDc6MjYgQ0VUIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMg
PT0NCj4gDQo+IFNlcmllczogdGVzdHMvZG1hYnVmOiBBdm9pZCBzb2Z0IGxvY2t1cHMgb24gc2xv
dyBwbGF0Zm9ybXMgKHJldjIpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3Nlcmllcy8xNTY5OTkvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFy
eSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTc1MTVfZnVsbCAt
PiBJR1RQV18xNDAyNF9mdWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipG
QUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdU
UFdfMTQwMjRfZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxs
eS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3Ro
aW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzE0MDI0
X2Z1bGwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj4g
DQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xNDAyNC9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3Rz
ICgxMiAtPiAxMCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1p
c3NpbmcgICAgKDIpOiBzaGFyZC1zbmItMCBzaGFyZC1kZzItc2V0MiANCj4gDQo+IFBvc3NpYmxl
IG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUg
dW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzE0
MDI0X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxl
IHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAcGFudGhvci9wYW50aG9yX3ZtQHZtX3Vu
YmluZDoNCj4gICAgIC0gc2hhcmQtZGcxOiAgICAgICAgICBOT1RSVU4gLT4gW1NLSVBdWzFdDQo+
ICAgIFsxXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTQwMjQvc2hhcmQtZGcxLTE1L2lndEANCj4gcGFudGhvci9wYW50aG9yX3ZtQHZtX3VuYmlu
ZC5odG1sDQo+IA0KPiAgICogaWd0QHBhbnRob3IvcGFudGhvcl92bUB2bV91bmJpbmRfaW52YWxp
ZF9hZGRyZXNzOg0KPiAgICAgLSBzaGFyZC1kZzI6ICAgICAgICAgIE5PVFJVTiAtPiBbU0tJUF1b
Ml0gKzMgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MDI0L3NoYXJkLWRnMi0zL2lndEBwDQo+IGFu
dGhvci9wYW50aG9yX3ZtQHZtX3VuYmluZF9pbnZhbGlkX2FkZHJlc3MuaHRtbA0KDQpUaGUgc2Nv
cGUgb2YgdGhlIGNoYW5nZSB1bmRlciB0aGlzIHByZS1tZXJnZSB0ZXN0aW5nIGlzIGxpbWl0ZWQg
dG8gZG1hYnVmIHRlc3QgYW5kIGk5MTVfc2VsZnRlc3QgdG8gc29tZSBleHRlbnQsIHRoZW4gdGhl
IGFib3ZlIGZhaWx1cmVzIGFyZSBub3QgcmVsYXRlZCB0byB0aGlzIGNoYW5nZS4gIFBsZWFzZSB1
cGRhdGUgQ0JMIGZpbHRlcnMgYW5kIHJlLXJlcG9ydC4NCg0KUGxlYXNlIGFsc28gbm90ZSB0aG9z
ZSBhcmUgbmV3IHRlc3RzIGZvciBub24tSW50ZWwgcGxhdGZvcm0sIHRoZW4gc2hvdWxkIGJlIHJh
dGhlciBibG9ja2xpc3RlZC4gIE9wZW5pbmcgYSByZXF1ZXN0IGZvciB0aGVtIHRvIGJlIGFkZGVk
IHRvIHRoZSBibG9ja2xpc3Qgc2VlbXMgdG8gYmUgYSBnb29kIGlkZWEuDQoNClRoYW5rcywNCkph
bnVzeg0KDQo+IA0KPiAgIA0KPiAjIyMjIFdhcm5pbmdzICMjIyMNCj4gDQo+ICAgKiBpZ3RAcGFu
dGhvci9wYW50aG9yX3ZtQHZtX2NyZWF0ZV9kZXN0cm95Og0KPiAgICAgLSBzaGFyZC1ya2w6ICAg
ICAgICAgIFtTS0lQXVszXSAoW2k5MTUjMTQ1NDRdKSAtPiBbU0tJUF1bNF0gKzMgb3RoZXIgdGVz
dHMgc2tpcA0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvQ0lfRFJNXzE3NTE1L3NoYXJkLXJrbC02L2lndEBwYW50aG9yL3BhbnRob3Jfdm1Adm1fY3Jl
YXRlX2Rlc3Ryb3kuaHRtbA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE0MDI0L3NoYXJkLXJrbC04L2lndEBwDQo+IGFudGhvci9w
YW50aG9yX3ZtQHZtX2NyZWF0ZV9kZXN0cm95Lmh0bWwNCj4gDQo+ICAgDQo+IE5ldyB0ZXN0cw0K
PiAtLS0tLS0tLS0NCi4uLg0KDQoNCg==
