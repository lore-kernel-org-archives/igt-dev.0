Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2164C3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 05:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A610E082;
	Mon, 12 Aug 2024 05:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJWPL163";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C039910E082
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 05:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723441292; x=1754977292;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jriY/KPQUS3FUQBfZinE79IvQY4LNxTxXdCRwxNRC98=;
 b=kJWPL163wx2RTzbQSHwWTs1++DeiN/2FHr9xQB1+a7WfAp2o5o6TmZEB
 CKuOe2fAzAPsTVR4uv+myB5eGqa3KYgj5uXrrtiSnP1igSHT5qt74CX4T
 dg+QDuG76Pk/Iy6hWwWCDvt5kKmK6RxIXVXzDT27dpjFqDF0bkBwBlBsO
 nhRKVje+9jTL+558D/am0ji8MxsS8VQWPqCZbWo6baDJkfVomF7Ugu5al
 zV8qUfwAI1kGTrOtksMRnJC+9nUATpfkZuomb/TcxGsyUEreMfVsZGpSr
 +O8x16oMjtJycb1INPis72TlqpC4NiLlS2+z3tz5YgfZAm2BmH+xiSyl/ Q==;
X-CSE-ConnectionGUID: 2q+RahJmTSSxurkkoF+lvg==
X-CSE-MsgGUID: RiP3V4u+RAGnpu52wLm4xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25398638"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="25398638"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 22:41:32 -0700
X-CSE-ConnectionGUID: J2StsR0OQ5WCO6njSgHLyg==
X-CSE-MsgGUID: crsd/cJWQJ+PyXTrxPkLFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62281588"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 22:41:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:41:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 22:41:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 22:41:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 22:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZiwDk3qSuhDXySx/YDKuTGkykp2dnROKwVuL2JgQwEspGmdlQfLWNKVpc77DXP78D9WmzYzh/DzQ3yL3aNJ7CHfPyAg/gQMhTGS1PpxRZPhS2h+AtLCr0NPzNOcR7qIk3wrPfKMMcRUTEhn2y7RXSxbnM0DWvZSJHyGRLnwNJKi2jBnB5Xf/2jaXe5STTDezLB1c+mPudgbLMZiYf+MBlpQKWMQ7S8HoMiWOiLAPF+rlGA1USfwZH1S77YrQnu6D1FH3d2/aDUEB1uKt3imhgpC13QUH4lUxhFnsS0zLxsw0VtsLmw5IDGm1RYUC/Z2sE3WSgWRhGuUHmkFGBHQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jriY/KPQUS3FUQBfZinE79IvQY4LNxTxXdCRwxNRC98=;
 b=QaEj24GqZmv8PHYyBKePElx1Cai+mnUesM1CTTRdd/ENj2cZCOQME8urbj3gHLU40J9DrUhit/cf5XR2cQXuZSNZ+Gh99fwYbeBQ6Tyf779pWyqNCbju6sZl6/IMVXNyGN9gcxY5UI2eq9lO7f8qRe575lOFUipdOcpIE4vbK9EwsZHI3zWW45lVsZ/khuQpY+0DsTahvSqUi5susTz6velbCBupqF3Tcl9x+6Jz7/5m0zn77eiNMXh718N0gimgcHb726DkaLD7BUvQLysUWkuHAYrR4evPr3zL2z/piOOgi2bASGt/z7BRZNpW9QANP6OQfMj5nDo0prMyEHHtBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20)
 by SN7PR11MB6849.namprd11.prod.outlook.com (2603:10b6:806:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Mon, 12 Aug
 2024 05:41:28 +0000
Received: from DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2]) by DM4PR11MB5293.namprd11.prod.outlook.com
 ([fe80::e1f5:3b23:9560:2dc2%4]) with mapi id 15.20.7828.029; Mon, 12 Aug 2024
 05:41:28 +0000
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Emil Velikov <emil.l.velikov@gmail.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Topic: [PATCH] tests/core_setmaster: Handle the test even if cards are
 non-continuous
Thread-Index: AQHa7HmNOHyC0Moaw0+57cY6Mi7ZNbIjGtmA
Date: Mon, 12 Aug 2024 05:41:28 +0000
Message-ID: <DM4PR11MB5293105C83FE191F0F192B049D852@DM4PR11MB5293.namprd11.prod.outlook.com>
References: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20240812052443.12856-1-krishnaiah.bommu@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5293:EE_|SN7PR11MB6849:EE_
x-ms-office365-filtering-correlation-id: 2787b6b5-7c9d-416d-c3fd-08dcba916989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cExaZVNXaVNTTTc5NzJqTTNxaVIrWVpsZFRaUUJraGwyVndUYnI3U2RsOW5p?=
 =?utf-8?B?NVhOcmxXTEpaL09VRXVuMHhzZnlKT1pyQjVCeEFzWFBmdUhVUXd3ZG82bWI0?=
 =?utf-8?B?K3lBMkM5emY3Vm0xbzkxTFF6VGNibTVnTUFMWkIxSEZtcE9HdVRNMi85T3gw?=
 =?utf-8?B?NVA0NlVSeU9WVWE5bUhnK2h3bE4zYUFjdDMrU2cwamVIT0R1b1dCQWdhZGtu?=
 =?utf-8?B?eDlTZXJDczR6cjd2MXp6eFFnb3lYNGdqZkVGMXBTU28yUERxbGFqL2k2emVs?=
 =?utf-8?B?UHlBM3NHY3UwMzVnR1pQckk4UjBKZFYxMVIzNEVIdmNnOC9OeUtKYkZKZWF1?=
 =?utf-8?B?SDRXYldqcWlZZklqRVhUWERBNXZoYTVuZjFYdWpqU0RjWkVZZUt5QlhpSUVm?=
 =?utf-8?B?NWRoYmFTcURXdHA5MHhPa1VGRy9JMjNJdWIzSFdsNWlJSkhtRXhuVFd1UWo2?=
 =?utf-8?B?bFhsMnJ1eGxDR21FUEFVZTRPVk9idFFzTWpNcWJNQTNITTg2MXh4c0JsSlFU?=
 =?utf-8?B?N1pCWXg2cHNxVWNsYTVWZlArUWxyM29KN2dNanhHNCs4NVFxVnI0OHFKR0Fv?=
 =?utf-8?B?Q3dLVk1lZGhEcVJuZDFSa003NUJkV3NhSTJMYnh4TkFCbm9yQW5yZ21JcFBj?=
 =?utf-8?B?V3E2OXJoLy9PZkhDUnQzTUxjOUY2RWZscE5VT05QM0RzMGxFVGJnRFdJeVBn?=
 =?utf-8?B?K2lXblVqRUI1SkJoT25yYUpKYUw2bHEwUE1mTmFGM01xL2VxSmxzemptNjlB?=
 =?utf-8?B?RWNoRk5mZnp3MGMyVWZFaU4vQi91NDVuaWdNOENEdTRRS3ArOTZuYUh1NmtV?=
 =?utf-8?B?L2NyejFrQ1VWekF4cVF0SkFNZFRGQUlSTUZsbU9Ub1FrRC91Z0k0eTE2Y2VN?=
 =?utf-8?B?Rlh4Z2pJMzVtWFlnVGpWQXliN0IyMnF0N3JnV2ZCOUN0UVNIeFNTblJtbzlG?=
 =?utf-8?B?N1lKbDAxaWpHdUJJd2dWZDhFSitvUXIzVko4aGdhOGozaE9VYWNRMXBnTFhv?=
 =?utf-8?B?UjdjdTFJbkk0UlVHWk1jZmcrcVFyM1BOcDdUMzkyMGxoeFBnQ2grUTloeVhE?=
 =?utf-8?B?UEJFTjBGRSsrMTh5ejE0RW5SeTlkR2ZQRUx3UGxrM0pCNUZwc2VXVXpzV3lS?=
 =?utf-8?B?SmhDVm1temxST3U0VTRSYnRtcnBuR1UrckdFU3JrYWtHSTcyZ1I5WVRHSWZM?=
 =?utf-8?B?Qzd4UzRGUkxldmxXRytTM2gvK2c5YjBxa1ZoQnpjV2hxNWlzUzRROXVWU1hI?=
 =?utf-8?B?VFY0TkNLellyQzhrV1RHZEM3ejd4bXhyRDByZWdQVFlvNTRqN08yV2VoTkhJ?=
 =?utf-8?B?WUVYMUJCZG4yV3dxOTZNd2Q1T1E2d0pDOGxVRGdOMkxlYWJLcDRRWDNoNmFn?=
 =?utf-8?B?VXE2SkV3TTUyRXVYUk5Zbk10amw3K1E3NS95UU1JNW0yVWU0bSt3d3pvbnF0?=
 =?utf-8?B?VXZpWUZMNTZjd3RES0Z6S0pkbHE0b0FCZ0d0Q1hoZnZBYjVHRHpLeDl6SW1y?=
 =?utf-8?B?UHRCRUQyRVJGb0x0TlR5THlZZzcwTVRIbXpGL3FTSmxBSWREOWUyMDBJdlVI?=
 =?utf-8?B?Slp3M253cFJWSjBPb0swUm9OYWs4U3kxM0ZxM1krbWVZVHFWNTRGNGNCZ3dE?=
 =?utf-8?B?d2I3YStSVjRTUU5INDVMZnZXUXFpUW9KNXJyalUyK0N3U3BGbHNwZHB1ekRj?=
 =?utf-8?B?eFBRVGFwR0ZMSFQ5T29pSXp3aytGbVAydk5IeEloQy91bHVLcFFzQUVFeitB?=
 =?utf-8?B?Qzd4SzlIcFdramJZdDJEeXJleWJhYW5RVkdQNHhEOURERHFWZjRJU0pEVWVB?=
 =?utf-8?Q?lAjsEt9CK/suQ85CKkCnqnsH4KUIoG1loZMNs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODFjZ1NoWE81Vk5YbFE4WVhqcks0WVYwZUNyUUhCVzJ3SGpyZFBtV1ZBWGJm?=
 =?utf-8?B?QmtDc0FNOHdJZCtCTGp4L0tNT2NDVk9URjlwdlhTWlV5enlabUtzMXBIMHpE?=
 =?utf-8?B?bDJiUE9UUXFmcmVwQlh4cmxGTzRqUnBnUkFhZjEvUmh4cHhZcWZ5Q1RZZnFP?=
 =?utf-8?B?NHZRTk9GTHRlQktaSTVvRkxhL3gzaE1GUlZmUVVHMGJkV0szN0RwVlVaK1U1?=
 =?utf-8?B?QkViK0o2b3VoNVE5cUZmNDdJL0FLa3BTYnVHQmVydEhQMjM3ckNwakUxbm40?=
 =?utf-8?B?akdybHg5aEE1UUhIR3BPYXF5SXdsSjk3dTVITDVrTmtUVkF4V2NsM291eTE2?=
 =?utf-8?B?VHFiRDZRUlh5dDJ3b3VnRjdIanRTTkVHYkFSc0oydUJQKzRlZUVZUzczK1JD?=
 =?utf-8?B?WG5lbFFzdW5yTjdWUjlsS3VuclZGVVV0WlVBYzNMb0Jkd3hWSWI0NDJ1Vkly?=
 =?utf-8?B?WjNhNjVlWVF2T1dxVjZaU0xobHMvVVNJNmh6YVlTU3pIelB2TnJJNzhaVyto?=
 =?utf-8?B?dWMxNUxvdVVWakRaT0wwVGEyaHF0V3YzTXpxQVludW8wcVJUUnNQaUF5dFRU?=
 =?utf-8?B?dlRETlh4QzJ3dzJHdEhOTm9yT3BvbWlwN1h6VkgvdUdra0tkeUVUV2pYWlRQ?=
 =?utf-8?B?K1drZGZHSUdQVFQyNTZIaUtyU3JvNkpMb1prbE9ZZXJBM244NTB4MDZncktj?=
 =?utf-8?B?SU9zMUt1N2xOVGhkQUNJcEUwSGxsdE1ObFNMWEVZTmNNQWM5L0Vmcmw0bzQ3?=
 =?utf-8?B?cmJZcHA4U2grNTNBVGdMNkhld0lkdXBINEFkZ1lIWHd3c3RMNkNxMzlhaERO?=
 =?utf-8?B?NE1QTEdaeTZFaVVLK0l3cU5ZS0F6K0VnbFIwY08zMHNGUWovVVU3Vk1iY051?=
 =?utf-8?B?WWt2VUtZUlpYYlhhQW9xY0pHVGhrcjVJbUNxODZ6Nko5TUFzdWVQVWsvbUtH?=
 =?utf-8?B?ZldPV0NtQjl5bUZqQUNjQllrTHhqK00rNjVueWpIYmxpc1B3amZJcm5obVlL?=
 =?utf-8?B?Umh2K1hlZ1Vxc1BxTDBxT0ZHTUMvUXF3eEdNUmszYktCSW9hQTFaNjZFYVAv?=
 =?utf-8?B?YjFVOEY0TGFNa1lIYVBnV2lReUdDSjRHeGpwT1ZjNUQ4Sll2NW9vZHV0bWk0?=
 =?utf-8?B?dkRZOHJXS2s4aVo4TXN6am5NdElHRllVZnBxY01oclZJTm4vRFpPamFtYXR5?=
 =?utf-8?B?dVpMMEQ4UDNxSUFNWGJPSUc0bGlGMVNOVDhraDdhYlJ3WGdnaXU4ckNHTWxi?=
 =?utf-8?B?aFR0MUw3ZkI1VHRMTTRGTFRiSFZvTG8walJHYkxSUGU0bjRqRW5PTExJQjFu?=
 =?utf-8?B?U2VGMCtBWWVUUHlqcitCUlpSQVFUaGFlTnVRWjBkN3o3bklLRnArUk5yMm1S?=
 =?utf-8?B?bTBpNHRyTG1KVndJdC8xZUlqMDVGNzhJUnRDRXhvbHZYYU4rU2Uva2pSa1Fl?=
 =?utf-8?B?amU1dG9HQWMvd2ZhVFQ5aDNQV1RRc25jU2FpbktqVXhnWlZhRE85WFdzMjQ1?=
 =?utf-8?B?TFI2Ri9UdDNrYW04Nk5ZZXRGOXU4V0tVcTExYkcybVY2K0NuUVBkczE4cGxR?=
 =?utf-8?B?alNPM2xmc2dDQ3RGUmdOU1U3TjJ1T2k2bU1MN2lKWTI1Z3lIeS85Q3lMTExu?=
 =?utf-8?B?VjN2N0pJcmpiME1RYVNCcC83QlBRY3UxMUlncUM0RXJVYTNvZWFzYmlVOXBN?=
 =?utf-8?B?Z1hWT0FIK2dnT1ptNHVYc1dlTjh6KytOb3JZbTg0OTYxVXplaktrQWxJZUor?=
 =?utf-8?B?Mk5Td2duVlJBb2RsaTVFV00xUDhyVmMrS1pQRCsrQVZaOTZCT1RPNDZYZjZ4?=
 =?utf-8?B?OVZ2TTNKYXhoMFlyV1Rjcmk2V1p6Z3BFS1EzclcyY3pXbUNSUVpoQUhla2xv?=
 =?utf-8?B?UzBxYTdqT3hZOGlwRHZ0QVdCUHdOa1pUREExWk0wYXVLa0VsMU9RN05hQUVz?=
 =?utf-8?B?TG5vc2lJbURmK1pRV0ZGdks5a1JVQnAwZCs1MWMwVDJNZFNBTFE3UHd1Z2xM?=
 =?utf-8?B?SThURlpQRnhCeUx2bHZ4YUNuc0ZEOWltQ2RsVmI2d0JjMFVleGhBZGZFTFQz?=
 =?utf-8?B?bXY5bWVmSkhOeTdJSEgwa2MxMEdIZ21WOHZmc1Y1SExIajlkS21aMlE1SzRm?=
 =?utf-8?B?bUtIcUc1SkVuYmlzUVlYSmowL1BMenVDSmRhM2hFV3FIWFVXbDN0alZIQnVt?=
 =?utf-8?Q?6weYAmqm5hwVFzRUS9/KlFaWxvPiUEN/Ikos6MQHuHxg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2787b6b5-7c9d-416d-c3fd-08dcba916989
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 05:41:28.2910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HrnaWrxtjqCXVwXkhetd30vbTJdSRCYUGqVuHH1ShjTJ/8YwGKgylExNs5BIwlg63ZXG53cy18kyYcVETmpirmZWk1qNxOXkvbLK4Y8k4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6849
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

T2xkIFNlcmllcyA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTM2
NzI5Lw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJvbW11LCBLcmlz
aG5haWFoIDxrcmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1
c3QgMTIsIDIwMjQgMTA6NTUgQU0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBCb21tdSwgS3Jpc2huYWlhaCA8a3Jpc2huYWlhaC5ib21tdUBpbnRlbC5jb20+OyBF
bWlsIFZlbGlrb3YNCj4gPGVtaWwubC52ZWxpa292QGdtYWlsLmNvbT47IEdoaW1pcmF5LCBIaW1h
bCBQcmFzYWQNCj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBLYW1pbCBLb25p
ZWN6bnkNCj4gPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQ
QVRDSF0gdGVzdHMvY29yZV9zZXRtYXN0ZXI6IEhhbmRsZSB0aGUgdGVzdCBldmVuIGlmIGNhcmRz
IGFyZSBub24tDQo+IGNvbnRpbnVvdXMNCj4gDQo+IEFsdGhvdWdoIG1vc3Qgb2YgdXNlcnNwYWNl
IGFzc3VtZXMgZHJtIGNhcmRzIHRvIGJlIHBvcHVsYXRlZCBjb250aW5vdXNseSwNCj4gDQo+IHRo
aXMgYXNzdW1wdGlvbiBtYXkgbm90IGJlIGFsd2F5cyB0cnVlLiBBZnRlciBob3QgdW5wbHVnaW5n
IGFuZCByZXBsdWdpbmcgb2YNCj4gY2FyZA0KPiANCj4gdGhlIGNhcmQgbWF5IGJlIG5vbi1jb250
aW5vdXMuICBUbyBhZGRyZXNzIHN1Y2ggc2NlbmFyaW9zIHdoZXJlIHRoZSBjYXJkcyBjYW4NCj4g
YmUgbm9uLWNvbnRpbm91cw0KPiANCj4gbW9kaWZ5IHRoZSB0d2Vha19wZXJtIGZ1bmN0aW9uIHRv
IGxvb3AgYWxsIHBvc3NpYmxlDQo+IGNhcmRudW1iZXJzKGNhcmQwLWNhcmQyNTUpIHRvIGNvbmZp
cm0gYXJlIHRoZXkgcG9wdWxhdGVkIG9yIG5vdC4NCj4gDQo+IFByb2JsZW0gRGVzY3JpcHRpb246
DQo+IFRoZSB0ZXN0IGZhaWxzIGFmdGVyIHJ1bm5pbmcgdGhlIGBjb3JlX2hvdHVucGx1Z0Bob3Qq
YCBzdWJ0ZXN0LCB3aGVyZQ0KPiBjYXJkMCBpcyBtaXNzaW5nLg0KPiBUaGlzIGxlYWRzIHRvIGEg
ZmFpbHVyZSBpbiB0aGUgc3Vic2VxdWVudCBgbWFzdGVyLWRyb3Atc2V0LXVzZXJgIHRlc3QuDQo+
IA0KPiBDb21tYW5kIHNlcXVlbmNlIGZvciByZXByb2R1Y2luZyB0aGUgaXNzdWU6DQo+IC0gQ2hl
Y2sgYXZhaWxhYmxlIGNhcmRzOiBgbHMgL2Rldi9kcmkvYA0KPiAJLSBPdXRwdXQ6IGJ5LXBhdGgg
IGNhcmQwICByZW5kZXJEMTI4DQo+IC0gUnVuIHRoZSB0ZXN0OiBgIyAuL2NvcmVfaG90dW5wbHVn
IC0tciBob3RyZWJpbmQtbGF0ZWNsb3NlYA0KPiAtIENoZWNrIGFnYWluOiDigJhscyAvZGV2L2Ry
aS/igJkNCj4gCS0gT3V0cHV0IGFmdGVyIGZhaWx1cmU6IGJ5LXBhdGggIGNhcmQxICByZW5kZXJE
MTI5DQo+IC0gUnVuIHRoZSB0ZXN0OiBgIyAuL2NvcmVfc2V0bWFzdGVyIC0tciBtYXN0ZXItZHJv
cC1zZXQtdXNlcmANCj4gDQo+IFRoaXMgZmFpbHVyZXMgb24gYm90aCBYRSBhbmQgaTkxNSBmb3Ig
YWJvdmUgc2VxdWVuY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCb21tdSBLcmlzaG5haWFoIDxr
cmlzaG5haWFoLmJvbW11QGludGVsLmNvbT4NCj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZl
bGlrb3ZAZ21haWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFz
YWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBDYzogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2NvcmVfc2V0bWFzdGVyLmMg
fCA1ICsrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2NvcmVfc2V0bWFzdGVyLmMgYi90ZXN0cy9j
b3JlX3NldG1hc3Rlci5jIGluZGV4DQo+IDljMjA4M2Y2Ni4uYTI3NThlMmYyIDEwMDY0NA0KPiAt
LS0gYS90ZXN0cy9jb3JlX3NldG1hc3Rlci5jDQo+ICsrKyBiL3Rlc3RzL2NvcmVfc2V0bWFzdGVy
LmMNCj4gQEAgLTExNiw5ICsxMTYsMTAgQEAgc3RhdGljIHVuc2lnbmVkIHR3ZWFrX3Blcm0odWlu
dDhfdCAqc2F2ZWRfcGVybSwNCj4gdW5zaWduZWQgbWF4X3Blcm0sIGJvb2wgc2F2ZSkNCj4gIAlm
b3IgKGkgPSAwOyBpIDwgbWF4X3Blcm07IGkrKykgew0KPiAgCQlzbnByaW50ZihwYXRoLCBzaXpl
b2YocGF0aCksICIvZGV2L2RyaS9jYXJkJXUiLCBpKTsNCj4gDQo+IC0JCS8qIEV4aXN0aW5nIHVz
ZXJzcGFjZSBhc3N1bWVzIHRoZXJlJ3Mgbm8gZ2FwcywgZG8gdGhlIHNhbWUuICovDQo+ICsJCS8q
IFVzZXJzcGFjZSBjYW5ub3QgYWx3YXlzIGhhdmUgY29udGludW91cyBjYXJkMC4uLk4gZHVlIHRv
DQo+ICsJCSAqIGR5bmFtaWMgdW5sb2FkaW5nIG9yIHJlbW92YWwgb2YgY2FyZHMgKi8NCj4gIAkJ
aWYgKHN0YXQocGF0aCwgJnN0KSAhPSAwKQ0KPiAtCQkJYnJlYWs7DQo+ICsJCQljb250aW51ZTsN
Cj4gDQo+ICAJCWlmIChzYXZlKSB7DQo+ICAJCQkvKiBTYXZlIGFuZCB0b2dnbGUgKi8NCj4gLS0N
Cj4gMi4yNS4xDQoNCg==
