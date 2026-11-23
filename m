Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE04606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dLFkT2zo;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=HCAg8ISh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E03410E36D;
	Mon, 23 Nov 2026 15:04:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEE310EEF5
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795446222; x=1826982222;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=TlGsEL/DmKT8YmyZuPO01ar0+Z0+sgklrNg88KHLSF8=;
 b=dLFkT2zo7L0PJ+wYYn9X86b7Gy/rWbYIbgwTidUOsOwB8bmCxWQCM1Ik
 ZoGju1gN/fw/2cR7bkseEhf+5ud0t5sAqZUFUFDYFGuZHenx2aTV7viuT
 DV/T7EHJDQnfxkuF/XBRkybd9tQmhlfwJt1ErsYCGui/WWC6sSM4uWH6D
 qA0BSdCN9qnk1FYin1rfleYjXGbt1jJhJ71wEwrH5hQ0XcvqSNdmXZ5kn
 LAvqdXznjqwbPQV7Lz1YmTIZT5ZjyrB4RAvj6+K1ri+qNcpcjwPrLWSX2
 1XWeHnUF6fA62vwF5pfnnvZH+fLbNDNPjz+pJ5AnXppF6xdYNgiidcnxw g==;
X-CSE-ConnectionGUID: hcu5hgy8S4ikzy6SX5DyGA==
X-CSE-MsgGUID: iFJs7NW7QWC7FUZDxJKY+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4155471"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4155471"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 07:03:41 -0800
X-CSE-ConnectionGUID: vhMgD5wQTneWRgdiEZaQEg==
X-CSE-MsgGUID: MR8P7yPwQPyyXCSzlqEjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="11194283"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 07:03:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 07:03:40 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 07:03:40 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 07:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4FEhoimCLCYFLHDKQuLuso5zU2KPKY1H42o8S7cSevkvGKxNzFUlISOEhdEeDghmcZtJZW+QHZ+oxWEajlrBcZe5WlFaC77tTjnv26wsdyrsNH9UfGvIBktOF5dmcjQU0feRo9nhV1txbems08B9QBoJbzKT/kWtw6VsrX20QY4RrMVXxUSPaMD93N3600jlJk7GhCtman3UbQCELRZ/zd7KIXmSn6vb487a0g9HcphSmsbczqv5tSAiNnYvw0SRyQU9rXPz3JIJS/vR6Ks3msvem7LLrvIflN0LDdBpmEE+ufLsC1sApucs8JJ4wjrt9DqSWJYO00aZ4O8hM0kaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlGsEL/DmKT8YmyZuPO01ar0+Z0+sgklrNg88KHLSF8=;
 b=ku5WkrQo6v63zm8ePzGBw4I7V06QtN7XtZu/0o/9jTWiwhsn8fXFgiKoAj4/UeMb1RBv4k+YLU5Ub7yKEJrAOhk073jpsivifvWy/WJv8nQSaMa0yfQpWAN+d+wpna6XJVsaXzj51Ptbp2TOlcNU5IQXqtY+Kn3y5zAh2pOzLNsBlP8UnEY8wwJ48rNhsw+UJMiSj6vfI9O/G/3x89mPggsWfYWSBQkMWpaA/mch4o4Bor1CB+4Rnn9fZCbodcZZAb4SsO4M/1TPRvS5fv64oeqIKHiw2dRFb5k9Q66wUz359t3U+tC3DRLmXlY1SexjnouJ5OwI946BpzXewjUpJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlGsEL/DmKT8YmyZuPO01ar0+Z0+sgklrNg88KHLSF8=;
 b=HCAg8IShJcuz1K+mZJMsqWwm207Y6HjZOgF8zTAu0HbgsF1oz/qbLEr/brJy4nYmHxxCuytQRDFd0EGMhQgla8taY/gStfH8EuJcFuwrxbH5cKWYCZKtvz4NvB0Cyp4dhAo+notOmYEhtlnYp44iuN/u3sp5xOaqyoKwTHZxpmY=
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 15:03:31 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%7]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 15:03:31 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "gildekel@google.com" <gildekel@google.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "markyacoub@google.com"
 <markyacoub@google.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "contact@emersion.fr"
 <contact@emersion.fr>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Thread-Topic: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Thread-Index: AQHde0lw3+lEOqXxXEKlUBY0kZ8207c7wQYA
Date: Mon, 23 Nov 2026 15:03:31 +0000
Message-ID: <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
In-Reply-To: <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|DM4PR11MB6527:EE_
x-ms-office365-filtering-correlation-id: e9fe38a2-d680-4109-87ef-08df4972f04a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|921020|38070700021|10067099003|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261021121427099003|261021123027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: leQakvuk1JQRGG999J+lytyIBWSCFr+Ogzm/o+QqDPdxLJqcxf+8gbecKmC2b6QM+rvxVRWruppBGD/NII4+Ldzj9OrckU8hpLEwpFZbDJ+p61g2UzWxhWns5ds9w+MSgthldWAE1HFCpFJldj/JWhGfbhdms5yOv7md5y6vVRPD1yLGWj9BNPT9ZFEfOZJiMUxf+TqVUVM0naOOydNz77QF+BeiFnC6gYvaaSi3QCKKa2WUJMgvRtCciyevKHwkkt7skST74N+D6s9Pcwuz01GOG+jUnd017MynJ+7UfDpr2GyLF25l1OedEBLcZj1Z3sB378sYH9Sw2S5ZXH6xZZev8D1DhA6+tE1n3pZl6t/9alS3bP52qrWEtRQOIe3et+RG+SFawbgCTnI6SQLi2yAmV87PkD1iuJ/EdPLaax/P3GaJbja0RbM66bLefi1rP44wLuDYagmEangmHrxJHCgA2giw+345c44wdlHno+piTf/CXD8dLx6H54z9JhSMKXVfhP9trA2O3YaNpN7Izib4Lvla9eyzQTcwMIkiREZILtu4lkoluxm5QRTBnMRZbuLRxd29U/yiwoARIQwbVXjhwpAlRmDchR5eQ3OHtSy7I/IX/ipO4VC3mumNnVQoR1Io9RxUm6KJlZg/pk3adAulytAkIiz4cMK6AYjP+eWw5C263hUhnU+XaKjPzmmQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(921020)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1FQT29UT1ZUREIvQStHMlBtRVA2Q21JK1hFWk4xaFdPSDRqMUFoUlpWNENn?=
 =?utf-8?B?YVA2aWpxUFl4Z1VGSTA0NTJKSkRPaTkvWHNYUjF4d3VVOEx1aDIyMm1lYytC?=
 =?utf-8?B?YzFKWG9yUVpFS3dqVTZ1UFowaHIzSlV5QVVyOEorYVFXQUZEYzVFc1VpR2p0?=
 =?utf-8?B?ZGZ1ZTZPbUN5VlBQTzJDOVQyV21TNmI1dGFsZThKMUt1MmFZUUp4NXF3QmF1?=
 =?utf-8?B?ZWxlVGowMllpVG5kK3lyMDhTY0k3SVVsQmRXUWhTMHFBZ0VnN3NQS3hNVEJk?=
 =?utf-8?B?MUJ4N0F4RHZaNy9kZlRWSVNDU1JSTVdMcUlOakhmWXBHd2duUUt2ZnNBWEhG?=
 =?utf-8?B?VDdPb09iZ0w2R1k1aEtXKzBDNDNIWERCeFBGT2FmZ1R1djhtT2dJazBFZFlx?=
 =?utf-8?B?VGZkdm5sMXJlVlJIZXdvbVlEQnVBVzhFcXpwNGhaalZmNVVUWDFTb1YyeEFK?=
 =?utf-8?B?Y1dQVEhFVzlRRWh6OXFJRFpOL0N1WWFxaUdBZjd6S1FaQ25JSjhaQm14U0t3?=
 =?utf-8?B?OUtySUNIODRVMVRYVVhKYmVrVzVSbVFzWkNRaFVhK1hZQmE4WWN4c2tXYmxU?=
 =?utf-8?B?OFNvY2hTWStxSlI1Y1hJdlBHNHA5MEFrZTdjTnZ3WjQ5UExKL2RJaDdoSWZn?=
 =?utf-8?B?cTI0OUlHOEdNdkpxZVU5ZEJlaDhNWkRpZ3MvcXZ2QmhMTnNwcXZvVEY3NUF6?=
 =?utf-8?B?djk0a2pSYVA5enE0QVNuaHF5ZEs1czMyRGhyeWlQNGtFV0h0dzZKQVJYdWlo?=
 =?utf-8?B?aDFBamtMZHVQbUx0MktLUUNLaHZLWFRTMndNUzdaVTFSdW9ESmZxNDhpRzRw?=
 =?utf-8?B?WTFsZnFaOEptUk1MSjhyeVlzalBobHBaNjhpQlJMcmN0ekV2ZUFZRHVIL2RJ?=
 =?utf-8?B?bnFQYjFPVlJiR0IvMlBoZDBwMEpYc0tCbEptcm9UOFpHdXNjNXdPbWx1RjNF?=
 =?utf-8?B?Z2ttSjZNTDFwN2trQ0NRejRrMEtQUm1vcVhRcDhETEEyT2VwRnlLdVMxZmh1?=
 =?utf-8?B?dWRoUDFqQVdidC9YbDFTNW9hZXNVVDJ6amo5V2FtbGZ5QVdEZms0bjNGTE1S?=
 =?utf-8?B?Y2VFRFY1OTdLMlNqOWxUclVjTS81UjVOUTZHcXFXdTJ1WlZNbi80WkxCTFhQ?=
 =?utf-8?B?R1hkMmNlQktGb0VyWjVTK3p4bG1ic3JtemprY2luMU8ydGk2eHFTTndCZlpY?=
 =?utf-8?B?dzRsMlZueVdQRzhlYjUvazQvVE9pVGVUeWc0d3FuZmVrRHpNRUU0ZmV1TjdU?=
 =?utf-8?B?eklNb1hXelJTSG9OMmRYc20rVk05Qy9QdVQraFRTQ2ljbHVSOEUrSWROTUtE?=
 =?utf-8?B?T2kvc1dSM3hudTY1Y2ZEUGR2aTdRM0pWTFZpR3p5SjBpT1VBaWZ2aUdiZkRP?=
 =?utf-8?B?QytJVXlJU2g4YjFQcnNIdHg0S3prVnhEV0FlQ1JNTEx3NThBa0VMbDhua1Z0?=
 =?utf-8?B?ZlhUbUZRVys5Z3ZiOTJZMm9zMkJhS3lNOHBvamNZWWNrZUhvbElHbU9qRzBN?=
 =?utf-8?B?L0VVaks0QUhLbXhDODFGd3l3dlBkdGFaUWYrUUhENUlxemFEbDc3dlZwT05F?=
 =?utf-8?B?Qy85UnA0b05pM25tV2xjMm94UjZXSGMxMktMSlB3NDNYNHRIMzFNNTlPSnRa?=
 =?utf-8?B?eGo3am9YK21JMXpBUnpHRmlGczVwZk5tU1lXaUpiMUVhbWxSY2swa3RqT054?=
 =?utf-8?B?UjhvNTVwSVhsZHRxS05tL0xxRWc0N2NRalhTSDdPK0dQaURDaUJ5UW50Sm9N?=
 =?utf-8?B?VkFOZnJrVEpaTm4ybU1yUnB5Q0hwWHY3bVVkY0xrWTFzeDhaYThyZHNyNml5?=
 =?utf-8?B?c2ZaOFA4eTM0cGttSGVrdXhlcVZqQWpQejJxR3hNc1Y5V01XdWUyODNYTUhk?=
 =?utf-8?B?eDVkSmVkRHRiOTZuYmw0K0k3Rnc2YTM5ZnN4cjcyOWZJQjdncXlaTE1QTDVF?=
 =?utf-8?B?MVNIU0ZoQ2NWbXVoTWx3dTJTd0lYdjMyZzF5Y09YbnlwbkdvcDZLeGsxdm1D?=
 =?utf-8?B?YWIxbklJV2syckNvRUtNSTdoMFdkZUliN09NNDgvUmlhUVhQdXhmYVBWTHM1?=
 =?utf-8?B?SzhMdTZTekFSRllmdWhyUDF5SEZvSlMxQXlESkxDNXQrb1hMY1dROEpKOEth?=
 =?utf-8?B?T3dGNnBRN2k3di9sQmFJVXJFbE1oclVyMW5URjg1dzYxSnpqZFZsaE9GcUJm?=
 =?utf-8?B?anRIbHNpTi9CNkVtNEFwbWg0TWRPYnBxYTg4am96bmt3SkVXYW5jYXdOb0FN?=
 =?utf-8?B?K3hpT3RNUE1lREc4dXdIRVg5VVJiTlNNNDlrbjB0QWJraUpOVjQ5dkVQcTk5?=
 =?utf-8?B?dzQreE5neVBuUXlvd3lRTHRtUlNoSHRCU1VsREhTYjBwWmxGczJJZkMyTENS?=
 =?utf-8?Q?5crzHOLGOo5kJqqo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0BCA741034A4B4B869FA557D570DD49@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LYP9U3lkWN0/r1bNOefTGbFnkY5nhMsqv+6vSr/Z3W7OKNE0y7BFUkMmP7EZ384MWoztKuaue9yD29vsStBV3vImj0PwSUW2Il7YjDR7EvV97QngPbqjikLGWpftsg5Xe0iCZsMzaEfS7efWVVEnJACkdOytGsFXoJ1qKGzp412XuGmcSkbOrQ3HA/4+MUHH5Mqawpa7h4mHSj7MC7MyETkz+QRmi2Ey8g/OzJ8qhNcDQsqYO7n9hUvr7gEsVX7zzQilQzXgJ7bnIbP+CIYFYZM49hhz1jfgR1zFge+1YFKSvm0ZBeP7hxsgUZ6IPFPxLVSPkWs3hsU2F6tKGtGaXg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fe38a2-d680-4109-87ef-08df4972f04a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 15:03:31.5999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKUrZLs2Bx0t8eKcSqnV3qoE/3iCKLCp1KcGLlhOvDUaNTwQq4mWjwR9PMkHsvLARSuokXTpyV6uVPf2xRzNBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCAyMDI2LTExLTIzIGF0IDEzOjUxICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIFNpbW9uLA0KPiBPbiAyMDI2LTExLTIxIGF0IDExOjUyOjQ5ICswMDAwLCBTaW1vbiBT
ZXIgd3JvdGU6DQo+ID4gUmVwbGFjZSBtYW51YWwgRURJRC9DVEEgcGFyc2luZyB3aXRoIGxpYmRp
c3BsYXktaW5mbyBbMV0uDQo+ID4gDQo+ID4gbGliZGlzcGxheS1pbmZvIGlzIGFuIEVESUQgYW5k
IERpc3BsYXlJRCBsaWJyYXJ5LiBJdCdzIHdpZGVseSB1c2VkDQo+ID4gYWNyb3NzIFdheWxhbmQg
Y29tcG9zaXRvcnMuIEl0IGV4cG9zZXMgYm90aCBhIGhpZ2gtbGV2ZWwgQVBJDQo+ID4gKHdpdGgg
aW5mb3JtYXRpb24gY29sbGVjdGVkIGFjcm9zcyBFRElEL0Rpc3BsYXlJRC9DVEEgYmxvY2tzKSBh
bmQNCj4gPiBhIGxvdy1sZXZlbCBBUEkgKGV4cG9zaW5nIGluZGl2aWR1YWwgcGFyc2VkIGZpZWxk
cyBmcm9tIHRoZQ0KPiA+IHNwZWNpZmljYXRpb25zKS4NCj4gPiANCj4gPiBVc2luZyBsaWJkaXNw
bGF5LWluZm8gd2lsbCBhbGxvdyBJR1QgdG8gZHJvcCBhbGwgb2YgaXRzIGN1c3RvbQ0KPiA+IHBh
cnNpbmcgY29kZS4gbGliZGlzcGxheS1pbmZvIHRha2VzIGNhcmUgb2YgdGhlIGJpdHNoaWZ0aW5n
IGFuZA0KPiA+IHZhbHVlIGRlY29kaW5nLiBsaWJkaXNwbGF5LWluZm8gaGFzIGRvY3VtZW50YXRp
b24sIGEgdGVzdCBzdWl0ZSwNCj4gPiBmdXp6aW5nLCBhbmQgYSBjbG9uZSBvZiBlZGlkLWRlY29k
ZSB3aGljaCBjYW4gc2VydmUgYXMgYW4gZXhhbXBsZQ0KPiA+IHRvIGZpZ3VyZSBvdXQgaG93IHRv
IHVzZSB0aGUgbG93LWxldmVsIEFQSS4NCj4gPiANCj4gPiBJR1QgaGFzIGFscmVhZHkgcXVpdGUg
YSBiaXQgb2YgaGFuZC1yb2xsZWQgcGFyc2luZyBjb2RlLCBhbmQgd2UNCj4gPiBuZWVkIHRvIHN0
YXJ0IHNvbWV3aGVyZSwgc28gaGVyZSBpcyBhIHBhdGNoIGxldmVyYWdpbmcNCj4gPiBsaWJkaXNw
bGF5LWluZm8gZm9yIGlndF9oZHIuDQo+ID4gDQo+ID4gQXMgYSBib251cywgaWd0X2hkciBub3cg
ZXh0cmFjdHMgSERSIHN0YXRpYyBtZXRhZGF0YSBmcm9tIENUQQ0KPiA+IERpc3BsYXlJRCBibG9j
a3MgZm9yIGZyZWUsIGJlY2F1c2UgdGhlIGhpZ2gtbGV2ZWwgbGliZGlzcGxheS1pbmZvDQo+ID4g
aGVscGVyIGRvZXMgdGhpcyBhbHJlYWR5Lg0KPiA+IA0KPiA+IFsxXTogaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2VtZXJzaW9uL2xpYmRpc3BsYXktaW5mbw0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj4NCj4gPiBDYzogR2lsIERl
a2VsIDxnaWxkZWtlbEBnb29nbGUuY29tPg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPg0KPiA+IENjOiBTd2F0aSBTaGFybWEgPHN3YXRpMi5zaGFybWFAaW50ZWwu
Y29tPg0KPiA+IENjOiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29tPg0KPiA+IENj
OiBNYXJrIFlhY291YiA8bWFya3lhY291YkBnb29nbGUuY29tPg0KPiA+IC0tLQ0KPiA+ICBEb2Nr
ZXJmaWxlLmJ1aWxkLWRlYmlhbi1hcm02NCAgIHwgIDEgKw0KPiA+ICBEb2NrZXJmaWxlLmJ1aWxk
LWRlYmlhbi1hcm1oZiAgIHwgIDEgKw0KPiA+ICBEb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1taW5p
bWFsIHwgIDEgKw0KPiA+ICBEb2NrZXJmaWxlLmJ1aWxkLWZlZG9yYSAgICAgICAgIHwgIDEgKw0K
PiA+ICBsaWIvaWd0X2hkci5jICAgICAgICAgICAgICAgICAgIHwgNjMgKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIGxpYi9tZXNvbi5idWlsZCAgICAgICAgICAgICAgICAg
fCAgMSArDQo+ID4gIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4g
IDcgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNTQgZGVsZXRpb25zKC0pDQo+ID4g
DQo+IA0KPiBQbGVhc2Ugd2FpdCB3aXRoIG1lcmdpbmcgYXMgbm93IGl0IHdpbGwgbm90IGJ1aWxk
IGluIENJDQo+IG9uIFVidW50dSAyMC4wNCBhbmQgMjIuMDQuDQoNCkhleSBTaW1vbi4gSW50ZWwg
Q0kgc3RpbGwgcnVucyBvbiBVYnVudHUgMjAvMjIuMDQgYW5kIFJIRUwgOCB3aGVyZSB3ZQ0KZG9u
J3QgaGF2ZSB0aGVzZSBsaWJzIGluIHRoZSByZXBvIC0gY291bGQgeW91IG1ha2UgdGhpcyBsaWIg
b3B0aW9uYWwNCmZvciBub3cgKG9sZCBpbXBsIGFuZCBuZXcgaWZkZWZlZCB3aXRoIEhBVkVfTElC
RElTUExBWV9JTkZPKT8NCg0KV2Ugd2lsbCBsaWtlbHkgZHJvcCBkaXN0cm9zIG9sZGVyIHRoYW4g
MjQuMDQvUkhFTCA5IGluIHRoZSBuZWFyIGZ1dHVyZSwNCmJ1dCBpdCdzIGEgcGFpbiB0byBtYWlu
dGFpbiBhIHNpbmdsZSBleHRlcm5hbCBsaWIgZm9yIHRob3NlIGRpc3Ryb3MgOjwNCg0KUnlzemFy
ZA0KDQo+IA0KPiArY2MgUnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPg0KPiAN
Cj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9ja2Vy
ZmlsZS5idWlsZC1kZWJpYW4tYXJtNjQgYi9Eb2NrZXJmaWxlLmJ1aWxkLWRlYmlhbi1hcm02NA0K
PiA+IGluZGV4IDExNGI5NzYwZDFmNi4uN2E5Y2QxOTE1ODI1IDEwMDY0NA0KPiA+IC0tLSBhL0Rv
Y2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybTY0DQo+ID4gKysrIGIvRG9ja2VyZmlsZS5idWlsZC1k
ZWJpYW4tYXJtNjQNCj4gPiBAQCAtMjYsNiArMjYsNyBAQCBSVU4gYXB0LWdldCBpbnN0YWxsIC15
IFwNCj4gPiAgCQkJbGlicGNpLWRldjphcm02NCBcDQo+ID4gIAkJCWxpYnBpeG1hbi0xLWRldjph
cm02NCBcDQo+ID4gIAkJCWxpYnVkZXYtZGV2OmFybTY0IFwNCj4gPiArCQkJbGliZGlzcGxheS1p
bmZvLWRldjphcm02NCBcDQo+ID4gIAkJCWxpYmdzbC1kZXY6YXJtNjQgXA0KPiA+ICAJCQlsaWJh
c291bmQyLWRldjphcm02NCBcDQo+ID4gIAkJCWxpYmphbnNzb24tZGV2OmFybTY0IFwNCj4gPiBk
aWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tYXJtaGYgYi9Eb2NrZXJmaWxlLmJ1
aWxkLWRlYmlhbi1hcm1oZg0KPiA+IGluZGV4IGM2NTI3ZWExZWIyZi4uMzc1ZjNlMTg1YmJhIDEw
MDY0NA0KPiA+IC0tLSBhL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLWFybWhmDQo+ID4gKysrIGIv
RG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tYXJtaGYNCj4gPiBAQCAtMjYsNiArMjYsNyBAQCBSVU4g
YXB0LWdldCBpbnN0YWxsIC15IFwNCj4gPiAgCQkJbGlicGNpLWRldjphcm1oZiBcDQo+ID4gIAkJ
CWxpYnBpeG1hbi0xLWRldjphcm1oZiBcDQo+ID4gIAkJCWxpYnVkZXYtZGV2OmFybWhmIFwNCj4g
PiArCQkJbGliZGlzcGxheS1pbmZvLWRldjphcm1oZiBcDQo+ID4gIAkJCWxpYmdzbC1kZXY6YXJt
aGYgXA0KPiA+ICAJCQlsaWJhc291bmQyLWRldjphcm1oZiBcDQo+ID4gIAkJCWxpYmphbnNzb24t
ZGV2OmFybWhmIFwNCj4gPiBkaWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tbWlu
aW1hbCBiL0RvY2tlcmZpbGUuYnVpbGQtZGViaWFuLW1pbmltYWwNCj4gPiBpbmRleCA1NzNiYjUx
MzljZWIuLjFkMzI2MjUwZWVmOSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2NrZXJmaWxlLmJ1aWxkLWRl
Ymlhbi1taW5pbWFsDQo+ID4gKysrIGIvRG9ja2VyZmlsZS5idWlsZC1kZWJpYW4tbWluaW1hbA0K
PiA+IEBAIC0xNyw2ICsxNyw3IEBAIFJVTiBhcHQtZ2V0IGluc3RhbGwgLXkgXA0KPiA+ICAJCQls
aWJwY2ktZGV2IFwNCj4gPiAgCQkJbGlicGl4bWFuLTEtZGV2IFwNCj4gPiAgCQkJbGlidWRldi1k
ZXYgXA0KPiA+ICsJCQlsaWJkaXNwbGF5LWluZm8tZGV2IFwNCj4gPiAgCQkJbGlieHJhbmRyLWRl
diBcDQo+ID4gIAkJCWxpYnh2LWRldiBcDQo+ID4gIAkJCXgxMXByb3RvLWRyaTItZGV2IFwNCj4g
PiBkaWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5idWlsZC1mZWRvcmEgYi9Eb2NrZXJmaWxlLmJ1aWxk
LWZlZG9yYQ0KPiA+IGluZGV4IGFhY2M2YTg3Yzg0NC4uZGI3NjE4MzI1YTY3IDEwMDY0NA0KPiA+
IC0tLSBhL0RvY2tlcmZpbGUuYnVpbGQtZmVkb3JhDQo+ID4gKysrIGIvRG9ja2VyZmlsZS5idWls
ZC1mZWRvcmENCj4gPiBAQCAtMTQsNiArMTQsNyBAQCBSVU4gZG5mIGluc3RhbGwgLXkgXA0KPiA+
ICAJJ3BrZ2NvbmZpZyhjYWlybyknIFwNCj4gPiAgCSdwa2djb25maWcobGlicGNpKScgXA0KPiA+
ICAJJ3BrZ2NvbmZpZyhsaWJ1ZGV2KScgXA0KPiA+ICsJJ3BrZ2NvbmZpZyhsaWJkaXNwbGF5LWlu
Zm8pJyBcDQo+ID4gIAkncGtnY29uZmlnKGdsaWItMi4wKScgXA0KPiA+ICAJJ3BrZ2NvbmZpZyhn
c2wpJyBcDQo+ID4gIAkncGtnY29uZmlnKGFsc2EpJyBcDQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfaGRyLmMgYi9saWIvaWd0X2hkci5jDQo+ID4gaW5kZXggYzBlZDllODQzMTYzLi5iODE3NWNl
ZWYxZjcgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9oZHIuYw0KPiA+ICsrKyBiL2xpYi9pZ3Rf
aGRyLmMNCj4gPiBAQCAtMTEsNiArMTEsOCBAQA0KPiA+ICAjaW5jbHVkZSA8dGVybWlvcy5oPg0K
PiA+ICAjaW5jbHVkZSA8dW5pc3RkLmg+DQo+ID4gIA0KPiA+ICsjaW5jbHVkZSA8bGliZGlzcGxh
eS1pbmZvL2luZm8uaD4NCj4gPiArDQo+IFtjdXRdDQo=
