Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF3AC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 07:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952DD10FFE3;
	Fri, 26 Apr 2024 07:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knyu87zj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1F10FFE3;
 Fri, 26 Apr 2024 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714118361; x=1745654361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nMJhRHjRSNjVhs7LqdYO11HbQd+RzwwbC83Li7g7DNg=;
 b=knyu87zjXabFpq7gei6H/KKfx0D0q3nNsvggSG6EiVs2/y7uYrkbAlGM
 SA/cT/K5rQJqhuFlK2tSruuB3QRXmBwYEIfwrX3xC9crUhM3M/DEck9Uw
 YB73Kb3sDSFGDZ/FXnDoF0O1ou57cy3BLpKjmk+Xe42Z3jjzs0PEcrrF+
 /NctycgV0OaWmQlSH/QH4XOfRPhdIIFQKWU9MgIzWijcN9jCn8PK5LAGr
 YdFwBgw5zxjSUF+I+DTvzLyEA0OOlzA4L8KHiuWFImP7c4ZubUsCNfra/
 AVyS/Vrt0cNidFPJaZY0noHp3NSIJB9iLiCkdTpVZOtDappw6AD6IicTw Q==;
X-CSE-ConnectionGUID: BsO8RIqvR+O+/N0euztppQ==
X-CSE-MsgGUID: 2dnyNQEtTpWTfxnkYreaXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20458692"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="20458692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:59:20 -0700
X-CSE-ConnectionGUID: zdGeyjoxQb23wrglrYM8Gw==
X-CSE-MsgGUID: I0tZ/paQR52c/U2Hn1WHNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="25430025"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 00:59:20 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 00:59:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 00:59:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 00:59:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4lU4etPv3TW0QW4WTQSvM8+ZatOGYN28Cq8MfcK1+5pEhOwymwca37b9J5k/P7xqT28ajUun5tvyro2xuh+p4i7bzb6wR5bCt+ElhwqmCKh1hmoNHGTJlIp/FcRmYsjq20spJ1EZCYL7xUfA8L5SHmbkv9CWztil6DUjTRC0KAzl3R9MBwgvdGj2SZvQcCjrFp4sU/1/OxosRttaRX4brQVv+/0HaO/MUOXd3uJn/NMg1Ru5iiSkPGYJEqWM3/TaDdzcGdUogLXGyHsVtgDWSPW2uFFyOAPW9pXsP6hLobfb3OiswlRPWWXumeNIS7kQLNhmyb00AUIHXUQIPf32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMJhRHjRSNjVhs7LqdYO11HbQd+RzwwbC83Li7g7DNg=;
 b=mlKVs+JlkMlBQTmR26HjMpjNU8uB22oLk7a1lJfPEZnqXcZp/dPzwvxYSjBrzfhEK+D7T2O5olVhUNbt5yNV68L04HeGqQj8S6Zs7wbMmqPiTQzLnwpFbvYjx8uIcwWABoRM+qGHKeMCYI+UooaTlTnqbMHtS5nPNSdXu2Y7vBed5aETT6Lyq9E1dVdrqdlGuqkOkucFqnqpShB9xX/ZyC9RUaU7P8d/Ye4pBsf8rLDDoG46qJ3HKnQ3DUcBccFgmdPtUYNXJ2IEhN85EACybi3yAPk+dyShD90DuYilEeDLCB4y4StJ0BhYEqoYY0+jQEs9fiV+fyBlv65iM97ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Fri, 26 Apr
 2024 07:59:11 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 07:59:11 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIEFkZCByZW5kZXItY29w?=
 =?utf-8?Q?y_compression_on_Xe+?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIHJlbmRlci1jb3B5IGNv?=
 =?utf-8?Q?mpression_on_Xe+?=
Thread-Index: AQHalwasiLiBoMzxk0qeyuFozpTGT7F57jUAgABCdBA=
Date: Fri, 26 Apr 2024 07:59:11 +0000
Message-ID: <PH8PR11MB6753429E95EF6E65B4ED58FCF2162@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
 <171404577247.1650497.11416675148226267361@8e613ede5ea5>
 <20240426035926.kbl4pgzggp3u6z57@zkempczy-mobl2>
In-Reply-To: <20240426035926.kbl4pgzggp3u6z57@zkempczy-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|DS0PR11MB8133:EE_
x-ms-office365-filtering-correlation-id: 6c53d1bc-b283-4663-066e-08dc65c6c255
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dXoxL0RjNzBqVXFWbjAxS0dwZ0R1YXFRY0VoNkJVNDJKZFdnQzVGZHRsWWlo?=
 =?utf-8?B?aDZ3ZmIvQ0U1SWc1MldhZ3VCalJYZXZoUXNydDVtRkl4aERYODNvZnVYTm80?=
 =?utf-8?B?OElZQ2lHTStUeittUXZTMGFVTEtDOWhKOUhQdFlRVFV2STRHV3BqNmxQM01B?=
 =?utf-8?B?U3puZzVzUXVsd2IyZllZU3k4MmlQTWt0RktPMWtnUGVGdXlnVzBIU2RETldQ?=
 =?utf-8?B?Ty9WUGVyUU4rZ2p3T3RzTllLam12Zk80NEtJbENoSElBMDQvdHlpdVFVYUZN?=
 =?utf-8?B?T2tNajFucDNRL3I5SzZDYmF5cjB2NTRLdklDejVnTlR1UFFCOVllRHpESlZV?=
 =?utf-8?B?VmtmVkpxMGxZcFJxUFV3Y2liY3ZMSUJUQ1pjWlp0UjdCYjJEcktuNG5EMWJ5?=
 =?utf-8?B?OGtZUVc0NnB6cXllRWdBcXpVd1Y2d3ZDYW9ySEJuWWFIdm5ZcDVoTkM0U1V5?=
 =?utf-8?B?b0pVMzBRU2hjWWlZSWpDVVhPSU1UTGw0MjZIbXBvbEMrczV6NjF0WmZwTTRW?=
 =?utf-8?B?ZU8ySlNyNjJhbGRrdFp3T3lscHFQYkhCT2Y5RVRoMVhLbmJWQjRraEZWcURC?=
 =?utf-8?B?YjVMZHpIVENqaHhrbFZ1U1p5UTZiMG56UGlURXdYR2tlZDBjenhtcmJMOFMz?=
 =?utf-8?B?QkgzZVN1bFh5b0NuMEljT05vYzFTVlIraGgra0g3dXJOM2Zsb1h0Qk9uMzE0?=
 =?utf-8?B?VmJ2RXY2UDlCNllsSFJPSm5GNy9ZZ09GdUlVait2ZEVKVDlaSFluU3Y2b2ho?=
 =?utf-8?B?SkREZHlBV0hRMElDUXY4Rkg4ZFo5S09OR09QQy9vekJVckRSZEtIVXJ0V00w?=
 =?utf-8?B?ZlpYKzZydUhWZFVJMWl3V3N6c0N6Q3NPYjN3Zlo1dDFoTGxyRHgzbkEzWVVZ?=
 =?utf-8?B?UzArQ1RBamFiZUU0MXB1STUzM2tlU1VqZnVpQ3NnYTgxTWNVUm1aLzhWS0tO?=
 =?utf-8?B?VEl6MnBaQ3VKa3cyM3VScjk2SU1iaXlGdFRQb3lkRDRtUFgzTG1MVzJJdGtO?=
 =?utf-8?B?MTB6ZSttOTJLMzBIQjk4NGlrV0tRZTBPQmtBVDNnQ05hcWJ2clplRkR4TDZL?=
 =?utf-8?B?YUV0N04yOG9TeVpiNEFjaS9VSmoyRVBabUtTVXpyeGdIUythNnlHUmZkMU0z?=
 =?utf-8?B?cS8xYTYzRTMwcldmRDlBUkk4Qy9kNm9WdVEvWlMwVW5WNFhBZGVjL3Nlb1BS?=
 =?utf-8?B?M0g2YjZGWkdyY2FwTzkreG9OZ3ZMODhaKzlPeFhzR3RVZWQwYytCUDVoQ243?=
 =?utf-8?B?L0ZQMEkxV2J2Mzg4N2dBS3k3VUFLN0NsM1V6QkRFZFc1WjNqcTNTZExVbHZK?=
 =?utf-8?B?b3FnZjkzeldmdG13VkM2UHdDcjVNK3ZDUExweStKTDZmcm1EZVdSdlR6OHpq?=
 =?utf-8?B?L3Y2QnYxbVBpYU85dFFUS3BLb2RJckZXOHlKNEF6NjZhWFdDTmRYbzdqaUI4?=
 =?utf-8?B?NDlQOUNZZytwNkQvR1k0Tm9HbUVPR3ptZ20rcUc4N0FGdDJNa3V5OGFCQWFM?=
 =?utf-8?B?QTBVVFp1ek5QNXFSYmdSMVhLbFRuRFk3T0Jva0RuSjhtYUxFV2dNYnluY1pH?=
 =?utf-8?B?NXRwWmk3aVJva01sWVlSSFJueUVUT0cwUjBXTkpuVktzV1orME10Vlp0bVVa?=
 =?utf-8?B?RUthOVVYN3k0dHJxV01Zd2RzWThhcGtlS2dMZDhBSW81RU81T1NzTGkxMFJT?=
 =?utf-8?B?YmhKOHdnSjlvaDhUcnhPb0pqdVF3c0lpVU10S3NGUjZIcURqd1ZjckhVRTdp?=
 =?utf-8?Q?7lC0YBTYxilALotTTg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3BVSWh6MnpyNXVrV0tnb1NNRDE1bktmSU5QNVFmdXdnVUVXbUNuRGxsMUox?=
 =?utf-8?B?dFBQcExIUmZYNnZpZGllUFdRb01CckNpRXZlVXpwYjJnSjIwNlF2WjZpRk9j?=
 =?utf-8?B?Q0t1ZVBQSVZIMmpHc21PUGg1MnJDU0JkOVRwelBhaElXaHdiTVNUTzU5bzJy?=
 =?utf-8?B?V2VqQTcvZmorUWQ1cngyaFdlNGFTbEJDZ0ZoMTVjWEtHNzdDUHBBc2hOcm9q?=
 =?utf-8?B?Z29uemliNkZ4bnhXZVU4NXFGSGhnUHRQSjYyZUFLNk45M0daTmpZZEtpQVFB?=
 =?utf-8?B?WTBSdlRTU1dtaVA1NlZLcThNK1VjMTdicndTV2tCK0lwVVhtTjFJUUtqNmlk?=
 =?utf-8?B?ZFZVaW5KeGZ3WWgyWWR0ZnlnNmZSTlIyUjVRQTF2QUdVd2hudXdzSFBLMjBa?=
 =?utf-8?B?cnBxWlN2Q1dtaG0yVm5JNE1JV21KYXNJbmUwak5odnNEclNVNVhxbkdzYTI3?=
 =?utf-8?B?RGJYVXNRMEpPU0RhOW5xbS84RnovbnVqTkVEWXpCUHV4am9sN0pnNEFISXpG?=
 =?utf-8?B?dnFaZG9zSEpNLzY2V2FiQ01XM29yY0ZjSTJTYitsam5xakZ2WmN2ankzeXZL?=
 =?utf-8?B?NzNSK1JUcjQwd1FJdFkreGs2akQ2cTBVa29oWThTeE9rbFJWQzUwb2MrWjRL?=
 =?utf-8?B?N2xiTmtqQ1AyaFM0SnBOWHo5UFBPZ2RiVG9CdmEvRi95MkJRV0hoNWlhZnR1?=
 =?utf-8?B?Qm5hdFlOSElTVTdXbXc3dU9qd0ViZmdBZTRvbXBFeCtUcFpNQVl6bmIwZ3pO?=
 =?utf-8?B?SUMzUnRldFNLNjc3R2tCdlpLOHpHcTlYMHhTanhQdVdUd2g5Ri8rSUo1ejZB?=
 =?utf-8?B?czJhdU9GWXRNMHRoRU4rc0Vxc0ZrOVlld0Q1WE9TZEMvTmVPZUtPc01ZTGlH?=
 =?utf-8?B?MUJ1SUI1NjJHUHJoZWhKeFhiM3o5cy9CcnBPODFCZnpQSkRiY09ONWtOeGpV?=
 =?utf-8?B?bW4wZ2RaUENuWDhqNzNLRjIxR201RTJQMXBrQVJOaHFUMGFDY1FSNkJPMnZl?=
 =?utf-8?B?V2FMaUVjdUk0K1RsSDE0TERZaXNJZVNTc3FvS1lPVVFBTGZKZDZtQjd6VUtu?=
 =?utf-8?B?T0pxTTZ4cGo5WlhhQmNPL1VtQUM5V3ZHZkNIVWxXaG52YVozclZkMWFMbkRm?=
 =?utf-8?B?Sk9Sd1k1VEtEeXlkTjc0WS9xeXQ5WDJzb09Zd2I5ZlhpQjNrT1NmVm41UjRx?=
 =?utf-8?B?OWJZMzRrbThSYnVIMHRqblU0RDVzakZKWE1FaXJrNFRMK2F6b1ZlNTlsTXVl?=
 =?utf-8?B?UHIwUlphdE5XakV3Y3NWZEdBN2dFVWczb1lqNUx4UFBKRDZxdTNnVGd0dWpy?=
 =?utf-8?B?QXNIeVVIbEpmdEZpaERGRmRyblRqbUN6TjN4WmV5TmRMYWhrRjg4aUZWdUR4?=
 =?utf-8?B?RUlsVEg4dmZwY1Vrc05zZFN2aHlocU16eE85Z1p6cU5WRi9HOTgvZU1RKzVN?=
 =?utf-8?B?ZENOMWJaV1Z1WUpQQWJyWEpJZUNSanFHVjkrNTRCMTE5Vzd3dFZaTjZraXBy?=
 =?utf-8?B?bms3aE9xY1l3bExYUG9nTFlaa2VSVDBueFkzT3ZLc0hTT2Z3aTdXTTg5Sy8y?=
 =?utf-8?B?UjA2cDNMTlVIUW9lQXppcHMwUTdycy9weXA1cTZFZU9YRDlHRmtRL05Gc1Rm?=
 =?utf-8?B?U0hnNFRxY2U1T1RhOTM2MEFwcStFeXhUVk1xQ0N0QkNoMGFObWlPQWdBdTFq?=
 =?utf-8?B?UFJaVVN4c29FMXE1cUFFVnVqK0luYnVpaDhCcytGblhnc2trT3FXR1JjaHRI?=
 =?utf-8?B?eWhyVTN3VzBBNEcvMmdpajlENllzaGNqTzdKb3dyanNCZW5LVFNITmd2M2pZ?=
 =?utf-8?B?U1Q5UGRoaXJPejhxRUUvTXVJQXpQa0htdUpVM3B4bXZjY0xZL25aVDR1UTdZ?=
 =?utf-8?B?S2MvM0h5SWtGcnYvUEEzSFZpODRZQnZlM1dRaHd4a2l6THJTdkpqcEJaQW5T?=
 =?utf-8?B?dFl4dXJkcjkxWTljK3NWVndwM1Nhb0QyT01rU0lxOUM2ZGlIT3lLUEk0MlNY?=
 =?utf-8?B?MUl1S1RHYWp1cytTVnJnWHovMlM3YXE4STlVUGcvRG0xMVJWWjlZTmFtaHdL?=
 =?utf-8?B?VjV0Z2Q5OWY1OTNoVnlUamYrRDdDaGF2ZTlkaGhtcXB1WFJ6cDlCMHNGY2FF?=
 =?utf-8?B?bXFobGlFUklCd2szWDEveFhRWFdxaWZIeXgwbzFUUk9ELytvQzIraEFraUd1?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c53d1bc-b283-4663-066e-08dc65c6c255
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 07:59:11.7818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57DYLRu162nVWZn0r+1/wVoyN2t1k/91NZQp3s9RAMcrPINvdHIv8N+z+DvrYWZupyDUmw9SKUSHrhSV1WubKT4onU/U86fGYosPCvBMMnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMyOTAyLyAt
UmUtcmVwb3J0ZWQuDQoNCkZpLkNJLkJBVCAtIFJlLXJlcG9ydGVkDQpDSS54ZUZVTEwgLSBYZSBj
YW5ub3QgYmUgcmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClRlamFzcmVlDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgWmJpZ25pZXcgS2VtcGN6eW5z
a2kNClNlbnQ6IEZyaWRheSwgQXByaWwgMjYsIDIwMjQgOToyOSBBTQ0KVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNClN1YmplY3Q6IFJlOiDinJcgRmkuQ0kuQkFUOiBmYWlsdXJlIGZvciBBZGQgcmVuZGVyLWNv
cHkgY29tcHJlc3Npb24gb24gWGUrDQoNCk9uIFRodSwgQXByIDI1LCAyMDI0IGF0IDExOjQ5OjMy
QU0gKzAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gICAgUGF0Y2ggRGV0YWlscw0KPiANCj4gICAg
U2VyaWVzOiAgQWRkIHJlbmRlci1jb3B5IGNvbXByZXNzaW9uIG9uIFhlKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIA0KPiAgICBVUkw6ICAgICBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvc2VyaWVzLzEzMjkwMi8gICAgICAgICAgICAgICAgDQo+ICAgIFN0YXRlOiAgIGZh
aWx1cmUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICANCj4gICAgRGV0YWlsczogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJt
LXRpcC9JR1RQV18xMTA2OS9pbmRleC5odG1sIA0KPiANCj4gICAgICAgICAgICAgICAgQ0kgQnVn
IExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfNzgyNCAtPiBJR1RQV18xMTA2OQ0KPiANCj4gU3VtbWFy
eQ0KPiANCj4gICAgRkFJTFVSRQ0KPiANCj4gICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29t
aW5nIHdpdGggSUdUUFdfMTEwNjkgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgIHZlcmlmaWVk
IG1hbnVhbGx5Lg0KPiANCj4gICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhh
dmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgIGludHJvZHVjZWQgaW4gSUdU
UFdfMTEwNjksIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbQ0KPiAgICAoJ0k5MTUtY2ktaW5m
cmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJykgdG8gYWxsb3cgdGhlbQ0KPiAgICB0byBkb2N1bWVu
dCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZl
cyBpbg0KPiAgICBDSS4NCj4gDQo+ICAgIEV4dGVybmFsIFVSTDoNCj4gICAgaHR0cHM6Ly9pbnRl
bC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTA2OS9pbmRleC5odG1sDQo+IA0K
PiBQYXJ0aWNpcGF0aW5nIGhvc3RzICgzMyAtPiAzOSkNCj4gDQo+ICAgIEFkZGl0aW9uYWwgKDYp
OiBmaS1rYmwtNzU2N3UgYmF0LWtibC0yIGJhdC1tdGxwLTkgZmktZ2xrLWo0MDA1DQo+ICAgIGZp
LWNmbC04MTA5dSBiYXQtYXJscy0zDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+IA0KPiAg
ICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1
Y2VkIGluIElHVFBXXzExMDY5Og0KPiANCj4gICBJR1QgY2hhbmdlcw0KPiANCj4gICAgIFBvc3Np
YmxlIHJlZ3Jlc3Npb25zDQo+IA0KPiAgICAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUBndF9t
b2NzOg0KPiAgICAgICAgICAgKiBiYXQtYWRscC0xMTogUEFTUyAtPiBJTkNPTVBMRVRFDQoNClRo
aXMgZmFpbHVyZSBpcyB1bnJlbGF0ZWQgdG8gdGhlIGNoYW5nZS4NCg0KLS0NClpiaWduaWV3DQoN
Cg0KDQo+IA0KPiBLbm93biBpc3N1ZXMNCj4gDQo+ICAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZv
dW5kIGluIElHVFBXXzExMDY5IHRoYXQgY29tZSBmcm9tIGtub3duIGlzc3VlczoNCj4gDQo+ICAg
SUdUIGNoYW5nZXMNCj4gDQo+ICAgICBJc3N1ZXMgaGl0DQo+IA0KPiAgICAgICogaWd0QGRlYnVn
ZnNfdGVzdEBiYXNpYy1od21vbjoNCj4gDQo+ICAgICAgICAgICAqIGJhdC1hcmxzLTM6IE5PVFJV
TiAtPiBTS0lQIChpOTE1IzkzMTgpDQo+ICAgICAgKiBpZ3RAZmJkZXZAaW5mbzoNCj4gDQo+ICAg
ICAgICAgICAqIGJhdC1rYmwtMjogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTg0OSkNCj4gICAgICAq
IGlndEBnZW1faHVjX2NvcHlAaHVjLWNvcHk6DQo+IA0KPiAgICAgICAgICAgKiBmaS1jZmwtODEw
OXU6IE5PVFJVTiAtPiBTS0lQIChpOTE1IzIxOTApDQo+ICAgICAgICAgICAqIGZpLWtibC03NTY3
dTogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMjE5MCkNCj4gICAgICAgICAgICogZmktZ2xrLWo0MDA1
OiBOT1RSVU4gLT4gU0tJUCAoaTkxNSMyMTkwKQ0KPiAgICAgICogaWd0QGdlbV9sbWVtX3N3YXBw
aW5nQHBhcmFsbGVsLXJhbmRvbS1lbmdpbmVzOg0KPiANCj4gICAgICAgICAgICogYmF0LWtibC0y
OiBOT1RSVU4gLT4gU0tJUCArMzkgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICAgICAgICAgKiBiYXQt
YXJscy0zOiBOT1RSVU4gLT4gU0tJUCAoaTkxNSMxMDIxMykgKzMgb3RoZXIgdGVzdHMgc2tpcA0K
PiAgICAgICAgICAgKiBmaS1nbGstajQwMDU6IE5PVFJVTiAtPiBTS0lQIChpOTE1IzQ2MTMpICsz
IG90aGVyIHRlc3RzIHNraXANCj4gICAgICAgICAgICogZmkta2JsLTc1Njd1OiBOT1RSVU4gLT4g
U0tJUCAoaTkxNSM0NjEzKSArMyBvdGhlciB0ZXN0cyBza2lwDQo+ICAgICAgKiBpZ3RAZ2VtX2xt
ZW1fc3dhcHBpbmdAdmVyaWZ5LXJhbmRvbToNCj4gDQo+ICAgICAgICAgICAqIGZpLWNmbC04MTA5
dTogTk9UUlVOIC0+IFNLSVAgKGk5MTUjNDYxMykgKzMgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICAg
ICogaWd0QGdlbV9tbWFwQGJhc2ljOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMtMzogTk9U
UlVOIC0+IFNLSVAgKGk5MTUjNDA4MykNCj4gICAgICAqIGlndEBnZW1fcmVuZGVyX3RpbGVkX2Js
aXRzQGJhc2ljOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMtMzogTk9UUlVOIC0+IFNLSVAg
KGk5MTUjMTAxOTcgLyBpOTE1IzEwMjExIC8gaTkxNSM0MDc5KQ0KPiAgICAgICogaWd0QGdlbV90
aWxlZF9ibGl0c0BiYXNpYzoNCj4gDQo+ICAgICAgICAgICAqIGJhdC1hcmxzLTM6IE5PVFJVTiAt
PiBTS0lQIChpOTE1IzEwMTk2IC8gaTkxNSM0MDc3KSArMiBvdGhlcg0KPiAgICAgICAgICAgICB0
ZXN0cyBza2lwDQo+ICAgICAgKiBpZ3RAZ2VtX3RpbGVkX3ByZWFkX2Jhc2ljOg0KPiANCj4gICAg
ICAgICAgICogYmF0LWFybHMtMzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMDYgLyBpOTE1IzQw
NzkpDQo+ICAgICAgKiBpZ3RAaTkxNV9wbV9ycHNAYmFzaWMtYXBpOg0KPiANCj4gICAgICAgICAg
ICogYmF0LWFybHMtMzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMDkpDQo+ICAgICAgKiBpZ3RA
a21zX2FkZGZiX2Jhc2ljQGJhc2ljLXktdGlsZWQtbGVnYWN5Og0KPiANCj4gICAgICAgICAgICog
YmF0LWFybHMtMzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMDApICs5IG90aGVyIHRlc3RzIHNr
aXANCj4gICAgICAqIGlndEBrbXNfY3Vyc29yX2xlZ2FjeUBiYXNpYy1idXN5LWZsaXAtYmVmb3Jl
LWN1cnNvci1hdG9taWM6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtYXJscy0zOiBOT1RSVU4gLT4g
U0tJUCAoaTkxNSMxMDIwMikgKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgICAgKiBpZ3RAa21zX2Rz
Y0Bkc2MtYmFzaWM6DQo+IA0KPiAgICAgICAgICAgKiBmaS1rYmwtNzU2N3U6IE5PVFJVTiAtPiBT
S0lQICsxMSBvdGhlciB0ZXN0cyBza2lwDQo+ICAgICAgICAgICAqIGZpLWNmbC04MTA5dTogTk9U
UlVOIC0+IFNLSVAgKzExIG90aGVyIHRlc3RzIHNraXANCj4gICAgICAgICAgICogYmF0LWFybHMt
MzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjOTg4NikNCj4gICAgICAqIGlndEBrbXNfZm9yY2VfY29u
bmVjdG9yX2Jhc2ljQGZvcmNlLWxvYWQtZGV0ZWN0Og0KPiANCj4gICAgICAgICAgICogYmF0LWFy
bHMtMzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMDcpDQo+ICAgICAgKiBpZ3RAa21zX3BtX2Jh
Y2tsaWdodEBiYXNpYy1icmlnaHRuZXNzOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMtMzog
Tk9UUlVOIC0+IFNLSVAgKGk5MTUjOTgxMikNCj4gICAgICAqIGlndEBrbXNfcHNyQHBzci1wcmlt
YXJ5LW1tYXAtZ3R0Og0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMtMzogTk9UUlVOIC0+IFNL
SVAgKGk5MTUjOTczMikgKzMgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICAgICogaWd0QGttc19wc3JA
cHNyLXByaW1hcnktcGFnZS1mbGlwOg0KPiANCj4gICAgICAgICAgICogZmktZ2xrLWo0MDA1OiBO
T1RSVU4gLT4gU0tJUCArMTAgb3RoZXIgdGVzdHMgc2tpcA0KPiAgICAgICogaWd0QGttc19zZXRt
b2RlQGJhc2ljLWNsb25lLXNpbmdsZS1jcnRjOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMt
MzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMDggLyBpOTE1Izg4MDkpDQo+ICAgICAgKiBpZ3RA
cHJpbWVfdmdlbUBiYXNpYy1mZW5jZS1yZWFkOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMt
MzogTk9UUlVOIC0+IFNLSVAgKGk5MTUjMTAyMTIgLyBpOTE1IzM3MDgpDQo+ICAgICAgKiBpZ3RA
cHJpbWVfdmdlbUBiYXNpYy1ndHQ6DQo+IA0KPiAgICAgICAgICAgKiBiYXQtYXJscy0zOiBOT1RS
VU4gLT4gU0tJUCAoaTkxNSMxMDE5NiAvIGk5MTUjMzcwOCAvIGk5MTUjNDA3NykNCj4gICAgICAg
ICAgICAgKzEgb3RoZXIgdGVzdCBza2lwDQo+ICAgICAgKiBpZ3RAcHJpbWVfdmdlbUBiYXNpYy1y
ZWFkOg0KPiANCj4gICAgICAgICAgICogYmF0LWFybHMtMzogTk9UUlVOIC0+IFNLSVAgKGk5MTUj
MTAyMTQgLyBpOTE1IzM3MDgpDQo+ICAgICAgKiBpZ3RAcHJpbWVfdmdlbUBiYXNpYy13cml0ZToN
Cj4gDQo+ICAgICAgICAgICAqIGJhdC1hcmxzLTM6IE5PVFJVTiAtPiBTS0lQIChpOTE1IzEwMjE2
IC8gaTkxNSMzNzA4KQ0KPiANCj4gICAgIFBvc3NpYmxlIGZpeGVzDQo+IA0KPiAgICAgICogaWd0
QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQ6DQo+IA0KPiAgICAgICAgICAgKiB7YmF0LXJwbHMt
NH06IERNRVNHLVdBUk4gKGk5MTUjNzUwNykgLT4gUEFTUw0KPiAgICAgICogaWd0QGk5MTVfc2Vs
ZnRlc3RAbGl2ZUBndF9tb2NzOg0KPiANCj4gICAgICAgICAgICogYmF0LWRnMi0xMTogRE1FU0ct
RkFJTCAoaTkxNSMxMDk0MCkgLT4gUEFTUw0KPiANCj4gICAge25hbWV9OiBUaGlzIGVsZW1lbnQg
aXMgc3VwcHJlc3NlZC4gVGhpcyBtZWFucyBpdCBpcyBpZ25vcmVkIHdoZW4NCj4gICAgY29tcHV0
aW5nDQo+ICAgIHRoZSBzdGF0dXMgb2YgdGhlIGRpZmZlcmVuY2UgKFNVQ0NFU1MsIFdBUk5JTkcs
IG9yIEZBSUxVUkUpLg0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiANCj4gICAgICAqIENJOiBDSS0y
MDE5MDUyOSAtPiBOb25lDQo+ICAgICAgKiBJR1Q6IElHVF83ODI0IC0+IElHVFBXXzExMDY5DQo+
IA0KPiAgICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICAgQ0lfRFJNXzE0NjQ5OiA2Nzk4OGFm
ZDU5NmYzMDdiNmI3ZTg0OWU2YTI0NmJjYTlhMjBlOTNkIEANCj4gICAgZ2l0Oi8vYW5vbmdpdC5m
cmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgIElHVFBXXzExMDY5OiAxMTA2OQ0KPiAg
ICBJR1RfNzgyNDogNzgyNA0K
