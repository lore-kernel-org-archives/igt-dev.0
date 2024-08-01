Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A735C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1984A10E963;
	Thu,  1 Aug 2024 12:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5r1Yf+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59BD810E951
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722516137; x=1754052137;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7EzgyuqpCejgGitlEHuaoFqjtni9M0CqMcfEq9AASDo=;
 b=M5r1Yf+LivNbRNmjKpfZESsVnZ1wlv4xUTln2v+vNWMGaM5WVzBT/v2p
 B53k2+Nxsq5ZFmqMsktdafPfuuypeB4AzuMuEK+L3gAFR0Zh4l9xvtalo
 6XkglsRdwPMXKzhzwy/RqfkeRmqT1HMKP2s/70vdak40yTnAJf8w1we4T
 76aKrv0RpNshgMtUOe+eltnwXxXpzTrKODyh92PWBSMn/fBpYAGd6MXWX
 PBcsi5rc3ofpYtZiSV3WiiA+HfuUv2FhTEdh/T7SL9yK1588s3ydA3I+q
 I0tiUBRUBcKESdbZzi4HhNdafNNNgSAM6cMlMxn+F5pYCk3w3CDRvA96/ w==;
X-CSE-ConnectionGUID: 1JUVh3KmSn26fsWS3ILBTQ==
X-CSE-MsgGUID: PUH/fH+FSc6OdVvyLt84oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37930950"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="37930950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:42:16 -0700
X-CSE-ConnectionGUID: erQfZpWDRXGa2ARsjNg/eA==
X-CSE-MsgGUID: yExHwOhXSsG/IOUICFzAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55804000"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:42:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:42:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:42:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:42:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiIpOyc128BQmHN23h9PVnHWtuukKBdeKuhqaZ/mtidlzvuubx6Lv6BAdVKqJ4WYAGcZg6M/V9jtrzsX9cqfz9MrhFjg1UZvC/qyfoDpbuHBW7H7CNqoPr/EgOgSuWpojvAkKwGQZFr4Y3j/wZhfHvXiQm8JFUG9ZnwfGHU8Zr7r60rIcIDLk43fGk9Cwagm31sMxaGT1DA9hz/KOdxLFM8NCzPCBmD2ujsmiv99QriGLwAWyO8r38h+j05jgWI6o2OgTDMAHWp/7fCUKIzSvFjIAlntaLG45s4ndyxQYFzegOvQLD+SWk6zoggTZ7xUtj5s27SOeMc+q+76r5UwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdvvMtoylts4Y3fWSz2QXNk2rIJ/+SzCLJF06CZ8HQA=;
 b=yPB8HrgFkHfR56TNJ0RusFeKsYsEsnZwxf9shORMAQ0qfyR9S4U12SbRO7ig2jyehjkAnDAXGshMO+X+EJuMJ+VtuCsR9xVDObVWPkuFkPiSUVq3BDoUkceqXkoOb+5p31CfNIw6JR1v++lH7+duQEZc80aOc1/Mx/5qUJBAFfZuQ8jqOEjUnswG3SyVm2iFnD9x/Ebe848Nn6+PaqUZHuVC4Rvevq/CO1OL84R58+73bh0eIN6GPAU2Q+xYbPxtpmjr+LyPv+T+T7nPtVZXlgV+luOFcWunfeqo+5Bi6Ccb6F607nY19MpfxP2n8V1Fz8DeR09AVSj96qTfy3v/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 12:42:13 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:42:13 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 26/66] tests/xe_eudebug: Add
 basic-vm-access-parameters test
Thread-Topic: [PATCH i-g-t v2 26/66] tests/xe_eudebug: Add
 basic-vm-access-parameters test
Thread-Index: AQHa4nZeBN7qC9F4SU2mXVxPNI23kLISW3wA
Date: Thu, 1 Aug 2024 12:42:13 +0000
Message-ID: <DS0PR11MB7264B02C1A9A33F7A5E44A51D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-27-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-27-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SN7PR11MB6679:EE_
x-ms-office365-filtering-correlation-id: a0eb369b-d814-40e9-9535-08dcb2275e07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?P1tF8F8uA0+a/dvV18eQLpl9XaRv/kEn3ZA06AMmpV9NuA0iqv5kTfgPab?=
 =?iso-8859-2?Q?1UIRMmg6dOuD3MzV2A/TZKo0b7KaUP1p2DHd0Ha2N9mUoc9CFOU3LyinKr?=
 =?iso-8859-2?Q?vGFvBKurZIEanZuAhoYa2zXVbSGZkKC8bLJ9yRvWULzofZcK0PZHDnldN8?=
 =?iso-8859-2?Q?SvmSulI0nDFe58fztg7pW+WuOzMwog/nZNCrZTEIqHLuX/YUnqxahJJcOH?=
 =?iso-8859-2?Q?K/N/BLA1jCO0xqC5cCgEEr6S2sRjHDf8RGKOAq3fl9BMIyNUuWUZZhvrnc?=
 =?iso-8859-2?Q?JnesqxQgJcYodvrCalvzaA2p6U6qu3XOEzZCWn60ezJSHA3T4wzwu4Psu3?=
 =?iso-8859-2?Q?9I7FZjfUk9Lo2BdNvGds0lB4KopQBzC8ur9J2otqaoWKlarw/LpzzsjgvX?=
 =?iso-8859-2?Q?uhNIzOdDelHwzHGSAX45zcZP0ci7cr1frztnk/eKsEQ9u+iq6xXum9dGlC?=
 =?iso-8859-2?Q?ztAs+a3BrDwn6M32WLA3joLHVIKYzcloKbTi9KrjySKrlnFBBe7SJ3P/GI?=
 =?iso-8859-2?Q?6qGNUySbghyVeC6PgpiGBW+dzZtHbqCGJF35wyPdQwzevTYJmFJ2EGq1M8?=
 =?iso-8859-2?Q?iZG1NaZW8//2u/wsawj0y0tUclNUQd8qoWXtHURW2QFhy59w7zI2y/g4Mu?=
 =?iso-8859-2?Q?4NQOeHGPpcDtgAJBtMgLfGjizNsHU7jnjTdQw+qSbEXqlAcmTWriVw2+5i?=
 =?iso-8859-2?Q?wJH11X3FWG0zcciBWQDPT6LNEt9GgVTJ+6r08caZij957AGP3yl//PMWj8?=
 =?iso-8859-2?Q?713SN+/qz0bi8MDMKG7azIn8flyeQGFYGjqyK1hhJA5L83Ra0vGrKyrnn2?=
 =?iso-8859-2?Q?cflYwYowqRohNRZ6iniLJfYtp1hWyhm5Jcw6xFodCukDp2Ifo2Aw2d/Gex?=
 =?iso-8859-2?Q?jwHRSFIXAvoXo6YcrjE4pBtfsNszMsQxe4kQb65IhVemOpp19iLdc1hXRC?=
 =?iso-8859-2?Q?C2z+nTUJQ+jDYQALDO+a9f5BildlFzKo6o5pfz43CZU9p58BCyAom2Mk/d?=
 =?iso-8859-2?Q?bQklTQTOxiYNZ5VFfLyYTOGtjp+lMMtToOzB/DZu5hKWKjVFR/TB3o0ifV?=
 =?iso-8859-2?Q?xLZcsqwEpjdr2/KPI1iWuAouNFHc7Wrs4Fk8fN1e7JED6wcBYjV1reN3HY?=
 =?iso-8859-2?Q?+ywqpx10goVFAjVBl1cFBZ43UFR7fMMsAwayxgQvbC63k7wPCG0Ejw25Ga?=
 =?iso-8859-2?Q?hJnf39peQKjthh3PARwlu/bbf0KT8Dn1kwm8VkULPytj6OD+/Y+eotTMY1?=
 =?iso-8859-2?Q?heF5R+FGRe00YhpxEivCs/1OuOU4ymZWjjrD703grerLErcNR8eygg2F3+?=
 =?iso-8859-2?Q?O8QKTnO0LhgD2c9uJOYswe+rgDbppi3UFSLQwcdEW3MBvLsi/OoHz40fpG?=
 =?iso-8859-2?Q?poOgKLupW2gofAmB+hvRHxV5LCnrtRmSKvFj3buCB9chMgIWWANFSN6JVt?=
 =?iso-8859-2?Q?CacoA8XDosCKl8rsyGscRiKTmibyWfAhNukXBg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?+8LGCg8it8MYxa9oZZNK7qbo3nwi0RY7qr9C+ZBm8zkfuW4Y/9GRutWu41?=
 =?iso-8859-2?Q?UUaJe2PKsKxbnwo+JfqDLJSYTfVDqr+O8jTviupXnf2r2SWYEy4pz3tTm+?=
 =?iso-8859-2?Q?boinYhTOG0MXv4CPsOoPNkM8iUABSY+lT+n7fUrr1swBr8QzXXjkFcW1aS?=
 =?iso-8859-2?Q?FYjkIkHCO3SkIIBA9Qf3rPO98do+4rIf8th1xSdFLYMSSLoQYla4IRNQeK?=
 =?iso-8859-2?Q?SFR1PsWLgO3pVK+eEfbSgtU9nNUMfwMImm//jiGPMtrtroEo8Lr318Sas/?=
 =?iso-8859-2?Q?8Yl09yoAjTOOU6hxr1IrtUvQMNkr/c29Rx7jQ1VihRQvfdxRdSkazjYqss?=
 =?iso-8859-2?Q?zSmrDSWrKkSk+mqiOFJAb0JwcA31xEVt3/IGE7QjMs7SBM5Tf+DhaMS9FL?=
 =?iso-8859-2?Q?5oba9nVLxIx1Y+hlB5GcuStLFtN28bLvX9kWInKpr4hkxTwAw5zrRL9DQ3?=
 =?iso-8859-2?Q?StjfHrEgJYBiZr3ToVKZTAufzcBBtC1XSn5rzl2j08e9rKkJsfGwSBATA+?=
 =?iso-8859-2?Q?4AWhrrsy6hyVnLWyMBqg1RPqZ6NsPvwZ+t0ho9BxkFQQT63Rdixp8L9eAS?=
 =?iso-8859-2?Q?mqvk8zLAm+uzI9mSZnXVFwcWJ1Pd4WsJRHEV5dj7fiVcya3Q2NviZyb8Yz?=
 =?iso-8859-2?Q?Lap+PohdJgp/GhXWF4/JACOsaBNpOI/LpuZyTBB/+jFk6lY2ly13XqTkAK?=
 =?iso-8859-2?Q?TNON7nF+H5RN0NhQ3Mx02xSX4mPwc8o/f9QmGYnQnpaWkaAUJT+Tmvv5sT?=
 =?iso-8859-2?Q?PlsCn1Fu8ut2mQZ98CRgc9iNFCN9RIVRmhSr3Z5gdNzNKnzeY2gzUu4Lx9?=
 =?iso-8859-2?Q?oA8hEB96DD3PvwEoyYC/YJx6hVQgtCnk1FTr2OSZzpHFKPea0EHO6W/5zA?=
 =?iso-8859-2?Q?A5icTMza6NRVFH2FXyXkPICnZAeqVVce3R/KqoyOIhWLXASIvC6z0IkVDy?=
 =?iso-8859-2?Q?H1CKVP2L03PtSiOQDLgvPmUBAAtSHVN0akiE6tQ/hMblS5QYqdrOShHACp?=
 =?iso-8859-2?Q?8xyYVc+Rar8j2oolG+qFhcZUUYF46c8Ot4S9xkyMEABBDBIMu6678mRcL9?=
 =?iso-8859-2?Q?jdAb7xe6YS6yK/Z2YS1u0QlwkYvTWmRWWVMDL1fBCqnfUQHvRqD1bzIikO?=
 =?iso-8859-2?Q?ge/tIr27Wx6GY27WQ4r9ZSOHMCVOAgY3+1P74tfEinYV44RiAyKU9QluE0?=
 =?iso-8859-2?Q?bZ5KJIJZns/4UONvFJKrSMsloiv8nxcFHW0yGzkdSQPBn9ibO1qWDAibb0?=
 =?iso-8859-2?Q?WJNh6o3zF1a4C2AfDZz816/hEJ32GLELUiAko/9xZNmUQwn4aAKZclZaoq?=
 =?iso-8859-2?Q?5jxE1Qhruim+Z5mhurpbJNBtJU4K4KypSoTWmXFNKDISz/EX4rFU0l+7s+?=
 =?iso-8859-2?Q?20o41pQaalMKKciX07Fb8caM1m84gjer7rmoIHDlrBkYqCWFkG4HJDSJxE?=
 =?iso-8859-2?Q?Ae2FXyPBXlV3bn6N/iLXJFtpEK572tNsPw4xSNicR6xM09gAkV/iHTt3v8?=
 =?iso-8859-2?Q?6EJWckVwn800bEPRPkd6uro4i016h4odkr+RnmfGpzxJUNm76SSAX/DyMa?=
 =?iso-8859-2?Q?zLbMa9zW5McgM3oJKHWXGCRB/X/QgfgRPjaYDDeOLJ5oEta5kM3Hv8rHAG?=
 =?iso-8859-2?Q?p96r0QmvwFc0J3t2f+HfDjCfuz7jHXq0YATmO3zJkYR7worufxx4Wbq97n?=
 =?iso-8859-2?Q?0wH8e2+ZleHUim4fUlg=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0eb369b-d814-40e9-9535-08dcb2275e07
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:42:13.0428 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ILlJ685KdVPQwTkqnYGikJuYBanneSIkhv33tGE1v/CwArLytkVWwjfVrpykRCYcaEfe9AzbCmVx2Oii3zRjIhnFANzYQSbCv4SYLQmPSLvxpb7PlzOpcXoZMMtGaPz9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 26/66] tests/xe_eudebug: Add basic-vm-access-
> parameters test
>=20
> From: Pawel Sikora <pawel.sikora@intel.com>
>=20
> This new test checks negative scenarios of VM_OPEN ioctl and pread/pwrite
> usage.
>=20
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 143
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 143 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> d4036ba05..ab856727e 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1168,6 +1168,146 @@ static void test_vm_access(int fd, unsigned int
> flags, int num_clients)
>  					 false,
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
>  }
>=20
> +static void debugger_test_vma_parameters(struct xe_eudebug_debugger *d,
> +					 uint64_t client_handle,
> +					 uint64_t vm_handle,
> +					 uint64_t va_start,
> +					 uint64_t va_length)
> +{
> +	struct drm_xe_eudebug_vm_open vo =3D { 0, };
> +	uint64_t *v;
> +	uint64_t items =3D va_length / sizeof(uint64_t);
> +	int fd;
> +	int r, i;
> +
> +	v =3D malloc(va_length);
> +	igt_assert(v);
> +
> +	/* Negative VM open - bad client handle */
> +	vo.client_handle =3D client_handle + 123;
> +	vo.vm_handle =3D vm_handle;
> +	fd =3D igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
> +	igt_assert(fd < 0);
> +
> +	/* Negative VM open - bad vm handle */
> +	vo.client_handle =3D client_handle;
> +	vo.vm_handle =3D vm_handle + 123;
> +	fd =3D igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
> +	igt_assert(fd < 0);
> +
> +	/* Positive VM open */
> +	vo.client_handle =3D client_handle;
> +	vo.vm_handle =3D vm_handle;
> +	fd =3D igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
> +	igt_assert_lte(0, fd);
> +
> +	/* Negative pread - bad fd */
> +	r =3D pread(fd + 123, v, va_length, va_start);
> +	igt_assert(r < 0);
> +
> +	/* Negative pread - bad va_start */
> +	r =3D pread(fd, v, va_length, 0);
> +	igt_assert(r < 0);
> +
> +	/* Negative pread - bad va_start */
> +	r =3D pread(fd, v, va_length, va_start - 1);
> +	igt_assert(r < 0);
> +
> +	/* Positive pread - zero va_length */
> +	r =3D pread(fd, v, 0, va_start);
> +	igt_assert_eq(r, 0);
> +
> +	/* Negative pread - out of range */
> +	r =3D pread(fd, v, va_length + 1, va_start);
> +	igt_assert_eq(r, va_length);
> +
> +	/* Negative pread - bad va_start */
> +	r =3D pread(fd, v, 1, va_start + va_length);
> +	igt_assert(r < 0);
> +
> +	/* Positive pread - whole range */
> +	r =3D pread(fd, v, va_length, va_start);
> +	igt_assert_eq(r, va_length);
> +
> +	/* Positive pread */
> +	r =3D pread(fd, v, 1, va_start + va_length - 1);
> +	igt_assert_eq(r, 1);
> +
> +	for (i =3D 0; i < items; i++)
> +		igt_assert_eq(v[i], va_start + i);
> +
> +	for (i =3D 0; i < items; i++)
> +		v[i] =3D va_start + i + 1;
> +
> +	/* Negative pwrite - bad fd */
> +	r =3D pwrite(fd + 123, v, va_length, va_start);
> +	igt_assert(r < 0);
> +
> +	/* Negative pwrite - bad va_start */
> +	r =3D pwrite(fd, v, va_length, -1);
> +	igt_assert(r < 0);
> +
> +	/* Negative pwrite - zero va_start */
> +	r =3D pwrite(fd, v, va_length, 0);
> +	igt_assert(r < 0);
> +
> +	/* Negative pwrite - bad va_length */
> +	r =3D pwrite(fd, v, va_length + 1, va_start);
> +	igt_assert_eq(r, va_length);
> +
> +	/* Positive pwrite - zero va_length */
> +	r =3D pwrite(fd, v, 0, va_start);
> +	igt_assert_eq(r, 0);
> +
> +	/* Positive pwrite */
> +	r =3D pwrite(fd, v, va_length, va_start);
> +	igt_assert_eq(r, va_length);
> +	fsync(fd);
> +
> +	close(fd);
> +	free(v);
> +}
> +
> +static void vm_trigger_access_parameters(struct xe_eudebug_debugger *d,
> +		       struct drm_xe_eudebug_event *e) {
> +	struct drm_xe_eudebug_event_vm_bind_op *eo =3D (void *)e;
> +
> +	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
> +		struct drm_xe_eudebug_event_vm_bind *eb;
> +
> +		igt_debug("vm bind op event received with ref %lld, addr
> 0x%llx, range 0x%llx\n",
> +			  eo->vm_bind_ref_seqno,
> +			  eo->addr,
> +			  eo->range);
> +
> +		eb =3D (struct drm_xe_eudebug_event_vm_bind *)
> +			xe_eudebug_event_log_find_seqno(d->log, eo-
> >vm_bind_ref_seqno);
> +		igt_assert(eb);
> +
> +		debugger_test_vma_parameters(d, eb->client_handle, eb-
> >vm_handle,
> +						   eo->addr, eo->range);
> +		xe_eudebug_debugger_signal_stage(d, eo->addr);
> +	}
> +}
> +
> +/**
> + * SUBTEST: basic-vm-access-parameters
> + * Description:
> + *      Check negative scenarios of VM_OPEN ioctl and pread/pwrite usage=
.
> + */
> +static void test_vm_access_parameters(int fd, unsigned int flags, int
> +num_clients) {
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	xe_for_each_engine(fd, hwe)
> +		test_client_with_trigger(fd, flags, num_clients,
> +					 vm_access_client,
> +
> DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
> +					 vm_trigger_access_parameters, hwe,
> +					 false,
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
> +}
> +
>  #define PAGE_SIZE 4096
>  #define MDATA_SIZE
> (WORK_IN_PROGRESS_DRM_XE_DEBUG_METADATA_NUM * PAGE_SIZE)
> static void metadata_access_client(struct xe_eudebug_client *c) @@ -1332,=
6
> +1472,9 @@ igt_main
>  	igt_subtest("basic-vm-access")
>  		test_vm_access(fd, 0, 1);
>=20
> +	igt_subtest("basic-vm-access-parameters")
> +		test_vm_access_parameters(fd, 0, 1);
> +
>  	igt_subtest("multiple-sessions")
>  		test_basic_sessions(fd, CREATE_VMS |
> CREATE_EXEC_QUEUES, 4, true);
>=20
> --
> 2.34.1

