Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30378EB5969
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 05:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC1510E093;
	Wed, 11 Feb 2026 05:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzOV0sBZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9B910E093
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 05:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770788278; x=1802324278;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=dzD8cyN9Delpw5buwobD/IDudraF5dC0jXav+/Rgodk=;
 b=UzOV0sBZzAk9t7Y/ID4KdAa8Crm1DHl/cm1kTqgWVKliMdRTIDDrNHos
 Le6ORvJSl2S6MznyDhqKYr9tSvB7Uwb1ouUbDm64iFDowAd6UL9nKgB5i
 OzdWl6FaU48ke9xIJ980hOT6UaqOD76YCYhqsMLFcVRx/tDwJyq2jkZPN
 ZAFaTIpZfG6KcbGgc0JfHzdAvON/xhT7yzKjJb3WKdIEetYru5vOf8q8i
 +c3iXj4La3RFC4tZtQ5Yaack357bSkS4utOJ9A8puHmbIjTAEJUzBYq+6
 lhlf0pP8ZC4zbnQW8rX02jmGGKYrWkTrdD8XicR4RpzwsUeY+yKb8zXtb A==;
X-CSE-ConnectionGUID: aPHrTcUgTA6gth2elhMBew==
X-CSE-MsgGUID: k8jBMpFcQOGJ2JjAYd4VEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75774700"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208,217";a="75774700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:37:58 -0800
X-CSE-ConnectionGUID: BQ2SBmEeTD+jLYd4WTnYUA==
X-CSE-MsgGUID: cTxqweIzQ66e4LEoLQYyAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
 d="scan'208,217";a="211246472"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:37:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 21:37:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 21:37:57 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 21:37:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiGIjsJOjjjpxywv8AWLyozfag07mP5FhDCzb/N9TZU/ltzXJqiuZ5O/HjTj6+93iwowdBb8WngsmserFrNa1MyuKKlootVX6cnmnLfoRHoSDTrpwAtrkU71bgqlAB8RFqZC5hvetOm04ZYu/VYyRikhTlYjsP7XWD9JpcQel0E4qbN18eJ8jOSI6bPvAsVIokC73ce2dHvIA/D9gSOtt9w4QFUdV7ocxUSUOhkL8ACPqMDCRO6iC9x1F8rwIhS3IMyjbV+dxvzheqxWd+ApRrm7nHJPSJenVj99a1RXtUojChVE0HuLq3LdyU+2t42oLQGezVTxEtkST6sZXZ6thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8siFy7X0615syWpOs68JscHVSCJjE275/sEzjRUcEE=;
 b=b7W7RY3g7BY6z1qBN5mdJRpcs7iTS2bvf2GvIJ+FNinvS/mcOQ6gxwB/i+WSuODioCKzaLBKapPHJD6EsaptsTgJWBUkp1w4vNhrMQVUO3yVA/eV3El40y3pdbmO9jAj0J9ftB5OashBsk4mr1W4b1TUdNNu2B40oEef2eyC7L+c7yTWVeKga7ZmIOSe/At9FV6f712rZaCs9JMNrTsU8XIt5kqxPWVAqakWDs21mmFiHnW+mLEldI9+2tCSRbXdSsJvyAPPrKgapKI+Yga3wQAlXg9Vsbm9eeXxQ4PcDQ8Yixr5GGuRupCt8QtvzcIJulQocfxdaFF6QI1D5Z98wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM3PR11MB8757.namprd11.prod.outlook.com (2603:10b6:8:1af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Wed, 11 Feb
 2026 05:37:55 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 05:37:55 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHcma8C5NrShR8WiU6fT/URPNivHbV7xGYAgAE4TGU=
Date: Wed, 11 Feb 2026 05:37:54 +0000
Message-ID: <CH0PR11MB54270ACDD05823A367E838CF9863A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260209101835.3899129-1-s.sebinraj@intel.com>
 <nyos3kinfomgey5wpsxhbma5vbs47l6ave7vptlx7cdxaqw76m@wvuiv7ligaol>
In-Reply-To: <nyos3kinfomgey5wpsxhbma5vbs47l6ave7vptlx7cdxaqw76m@wvuiv7ligaol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM3PR11MB8757:EE_
x-ms-office365-filtering-correlation-id: 5bcafb58-c5da-46e6-23d8-08de692fb4c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|8096899003|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?JLRI95VOAmsyuuX1+CiuF9Lip1TihQr1nHhhssk9Fafwm3nzanaCxG+rr3?=
 =?iso-8859-1?Q?wTUvHZ9LFWVNNUjun7asWbQ/De4jptW655LrfHAgHtWVgB/OtsKpGW61xb?=
 =?iso-8859-1?Q?QBw8hQxZx5FSfVCbmnmGmi1IHxsmP/yp/wuPE7k5gE3L2YcgyD3FbqDHMc?=
 =?iso-8859-1?Q?hViV7AxX9Et/ZsflvXV0N1MneJH0AH55+ObuqWv4S0fspPYOds60qywlMB?=
 =?iso-8859-1?Q?phSHp9rPvsw00cSXPZTFMKLePw9K4sV1TAHSyfMOyrrN3n88O8eKrW0z7f?=
 =?iso-8859-1?Q?v29ZAT/e1tsqdLEwp7VQt5noF9cGcejQxixnba+VciVFow0hJGg8AX7V7k?=
 =?iso-8859-1?Q?JYd0DiXtUHynbXunByUvPVGMP8rzblHki8N6/E2QvHRurLCpny7NIiKhUn?=
 =?iso-8859-1?Q?HGar49jFFeYl4gt2WbEgTz/FXJGLb/P4OlFRmtwMGmX4SXoKRv8T4yqF0G?=
 =?iso-8859-1?Q?lke7k2C93bzw/7TWgN3Aq/loromv8q8cAncDjZUmu+ghd4wbR6bpelmNiH?=
 =?iso-8859-1?Q?y4BJfnzKFYF78PUbOjWyTo8B9f7wd7x6UYSxS4c3CPqSDys6DYHOGglYED?=
 =?iso-8859-1?Q?Hc2z1UTQStXRz5eny+cJPSWkcA4YQC0DG4i6Hy9xXoDEB1ZCU1ofKrNXh0?=
 =?iso-8859-1?Q?Ryc93ig5hzp+LMN27tMSUtjO3TcAqRvFLNNpEIXCWMNeJZWva8o1TF+2gg?=
 =?iso-8859-1?Q?GCyCMcyMWQ/XfwConr6QT7bqMPLrW40QPgXEHXb3ULpj+agYKZFkV/V9JF?=
 =?iso-8859-1?Q?UEa1BrDLT3WHJ3UWUYhacO2pbvactnA6xBrb8lanFS2lPuhj7rnliTvq6B?=
 =?iso-8859-1?Q?DDcTjcf2/ggpTCupPiL+B2EvMoGOrikyjoyQrF6O72g0/8vsnTuAdk21X9?=
 =?iso-8859-1?Q?ZEONTnDGI/tX6iDyZkEmUW2kIq52XAKfEYayDilw8HzNHGUcJ/8fehu4P/?=
 =?iso-8859-1?Q?zZvFm8js/p/MGBcP1bgWb/vxdxHMQcjerHbMyoB3rQ1Et9KRL1UVCPGzPS?=
 =?iso-8859-1?Q?98qxGnhXmTJReAcAjbQ9pr1jP/KhTgLMPoUpw1ls4HZAEq0Gl+Rz7L18qb?=
 =?iso-8859-1?Q?teU/R7rM2a/1HlLnzdfYWrbz/ob/lznJqdVkeElONsxpOiQobYrHDbq7nR?=
 =?iso-8859-1?Q?8KM/3NuLlg2T3GLzTlR1SDL/EaYFtTjf0Yrvf2sbLEdhzCZH6WacIrN0WL?=
 =?iso-8859-1?Q?H+LbVmRugbtf6V+364QW4NBLiOjhP59eCqkv7M3mXUQY6xiJ5oiMr6duco?=
 =?iso-8859-1?Q?JxmUPKa5yEix+BYb9X2ziChKWwkZnFEnwaEZVZi9xhGYy/RD0a4mX7pzq1?=
 =?iso-8859-1?Q?LFr2QRYJPvAPzXTAoivjAVBcGoqhj5merSEh42T73wcrEbyu5BvsMQqkk2?=
 =?iso-8859-1?Q?0++brHxt9tcGmLug0w5o6c0f5lBC57MScLNozn545iPRp/nPqFuiECGMCf?=
 =?iso-8859-1?Q?5HcFJIBigpte1gweM6rzCEOWbTQ4BdD/gVS0E0x2Wst6cEbClX1SDdPZkx?=
 =?iso-8859-1?Q?qvikXRgM3HRVrZsGg8v6TbfMr5zwp4htGBlYAyh5M29hoIPLU7r1FlgLGK?=
 =?iso-8859-1?Q?en1JaxexNPtDbtdxl6LriKbNatDHA9Dx27HdHxza7KiWni+SDikoMum8BB?=
 =?iso-8859-1?Q?q8WzElqU2KyBJtdLhZvoDT3zsuGNt6goSDlBG9vQvQXtUfmOp0b+LsDEPu?=
 =?iso-8859-1?Q?E0/OQCX4EJY5OSkjEp8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Kd1SfypYB8G8hQCiqJL28YNpzjUu3FWpfxc+f7180F8GdHZnI+45xR3bt5?=
 =?iso-8859-1?Q?NriEXillj9SfNit6HwOfj6kAGUUmLBatT+uz1ZVeSvV5VqIQ+MsVhXKBfD?=
 =?iso-8859-1?Q?KEn5mAUuW8n6ZAV3n/lyR9dVgZrsr8HjwcVc72AwRCm3n4ykH0Ona7To4p?=
 =?iso-8859-1?Q?venVWPOmPIl+PjlnjiFrvJAU/w2n4a85NMirMs/RBHnpHkBNDo4HlAMc9o?=
 =?iso-8859-1?Q?G+Y+j8eN1+DXXKz/rBeyvXY3Q1JY+MqggFVRsBctOmKOpiGuuVBVHaQX3y?=
 =?iso-8859-1?Q?rjXZo9AiWDECvIW1X4Jw28OZ8EtC4zhswaKOPnCg4PBuspVk+pwcNjNP+u?=
 =?iso-8859-1?Q?1DMIxYhQv++TbjWRTVNWencqZNt2vr0z6Wog5rr71JbmoLIEzAS4lE9oJy?=
 =?iso-8859-1?Q?qgqLcAotqyFEy5tL0r7AMHn3vAaThma2b69stSLCWO6I9UlRBq4fvGQsDb?=
 =?iso-8859-1?Q?SNLvTYs3iGFcLExS6Fuh/HvXgYFL1IMnGQZdiJp4HajevY1TzsG+w3DMck?=
 =?iso-8859-1?Q?mW9odwtYP/VyF5TZaupr0J7uXNs914D7Y1HcIU8sipSnOibGrV+Lky/YXB?=
 =?iso-8859-1?Q?RDoU0eNDcQ7Ja9HOqOoxIrSMwjDfB6ZPXJ+J/HaKcfAapYg0cySfhB34+v?=
 =?iso-8859-1?Q?kZeqoQqdJEYtq7sJyRDSO1x/3iMm+bhVSm6c8NyvkiW8cdpz/p6cyvzJCY?=
 =?iso-8859-1?Q?/RG9qmP3Ypdnvj5Fh5IqSxw0ki9UeH0zC+Wm3yfqH4HpCMn3HKeQJz2mDa?=
 =?iso-8859-1?Q?qSSeizgreirZxBWMJgIEYyMszKorEUNCC3JS2cfFNRDPzx5+IFaELG/qw1?=
 =?iso-8859-1?Q?mzHY6tPganVXcPpppAmLzKxwAtSAZKbhFyRTW6ZploYcQYziWm7iiaB6Si?=
 =?iso-8859-1?Q?AkZ3P6m/S491QhXgXzldDfJ3T1zCwBbKia//ROfFaI1xPkAt9a/4p2usQJ?=
 =?iso-8859-1?Q?eDl6XeQ8DzZxFNOchi4iHd84kQ5e/sES35w9syr5gmkQYnttmvuiTFwm76?=
 =?iso-8859-1?Q?38HREgna+aMk0yMhT0rtQNkKWNZWDtHJIuRRtsQnlBHRZePqpXIIHGLHwB?=
 =?iso-8859-1?Q?ZmXK/C9igzrc++B+IG30/S8VSusl3kr98xHrmj6I7MhoO8hMajjbyxJVxU?=
 =?iso-8859-1?Q?RLGm02gHWVwRhVMp+GvdkT1+7TSWL/B4PiMr1EetTR9f8Qeqlpx75Hjgg4?=
 =?iso-8859-1?Q?GC99+/SY1b28U2y1SpsdX6Y/aV6K7favVN8jo1AoNl4nZ0Rmo0e8D0ZIdD?=
 =?iso-8859-1?Q?kXbSk4qzwzSI1/s8BgBpA+EX367d9OsOvSlWMAJLgDdi0Tad3L/GHPve8g?=
 =?iso-8859-1?Q?IcpYvmD8Wm7Aw5AEdxB5lL0oeKWeA+ve8BlBvL7Yu/wrjxLes9p7Lp/TWU?=
 =?iso-8859-1?Q?se2LMYkdIkBSdSgp+Arv1XEE5tePfzmO5aIXiVsYGmesBB0yE4O0DsJcml?=
 =?iso-8859-1?Q?f1Q+3Vtv3Cqg77ZwKvQKn0gc6j0m5VWRQQUQn5pnKASYnd27yfwQWzHgnJ?=
 =?iso-8859-1?Q?A/ypxH8C0y5NLlwlpPigd62/JFUVHcMjriztkXsp1/hAopcRJDy76Ajix+?=
 =?iso-8859-1?Q?cgJWbf5cVoiZAnPZiXJ9CBrMr/ZTdTsIAqe32Ijil0xtic8zEEaaZZAwHH?=
 =?iso-8859-1?Q?gQLV9eTybj3Tx9b4KycklpUUYsgwcUAPn0F1Jm5Vjffy6Kb+NPhxbUQtKO?=
 =?iso-8859-1?Q?k5xc1e+EuT/6tJ6qWKSGpeHyUcPWoE86IeN2dSYR04DoAB05iVbBiLTqlN?=
 =?iso-8859-1?Q?U8Hudeo/pfL4/giOyuYd8jFEdwBiF0+8iTwlqURkgh37yB?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54270ACDD05823A367E838CF9863ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcafb58-c5da-46e6-23d8-08de692fb4c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2026 05:37:54.9240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heZMyxPx2MAr7SAf7tF8UfEG8XWevu8vUi++7TMNCE7D/tLijULAx9KhfvRn7eZ037dt8lSX2fGT66nYQiTBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8757
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

--_000_CH0PR11MB54270ACDD05823A367E838CF9863ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Tuesday, February 10, 2026 4:26 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Badrappa=
n, Jeevaka <jeevaka.badrappan@intel.com>; Konieczny, Kamil <kamil.konieczny=
@intel.com>; Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Purkai=
t, Soham <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies to the clie=
nt headers

Hi S Sebinraj,

[...]

> +/* Detect which driver is bound to the device */
> +static bool is_driver(unsigned int drm_minor, const char *driver_name)
> This is a bit misleading. The function checks if the driver is
> bound to a given device. It does not answer the question
> "which driver?", but rather "is this driver bound to this
> device?". I think a more appropriate description would be:

> /* Check if a driver is bound to the device */
> static bool is_bound(unsigned int drm_minor, const char *driver_name)

This makes sense, I'll change it accordingly.

> +{
> +     char path[256];
> +     char link[256];
> +     char *driver;
> +     ssize_t len;
> +
> +     /* Read the driver symlink */
> +     snprintf(path, sizeof(path), "%s%u/device/driver",
> +              get_sysfs_drm_path(drm_minor), drm_minor);
> +     len =3D readlink(path, link, sizeof(link) - 1);
> +     if (len =3D=3D -1)
> +             return false;
> +
> +     link[len] =3D '\0';
> +
> +     /* Extract driver name from path (e.g., "bus/pci/drivers/i915" -> "=
i915") */
> +     driver =3D strrchr(link, '/');
> +     if (!driver)
> +             return false;
> +
> +     driver++; /* Skip the '/' */
> +
> +     return strcmp(driver, driver_name) =3D=3D 0;
> +}

[...]

> +/* Count the number of GTs by checking which gt* directories exist */
> +static int get_num_gts(unsigned int drm_minor, enum intel_driver_type dr=
iver_type)
> +{
> +     char path[256];
> +     struct stat st;
> +     int gt_count =3D 0;
> +
> +     /* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
> +     for (int i =3D 0; i < 8; i++) {
> +             if (driver_type =3D=3D INTEL_DRIVER_XE)
> +                     /* For Xe, all GTs are under tile0 */
> +                     snprintf(path, sizeof(path), "%s%u/device/tile0/gt%=
d",
> +                              get_sysfs_drm_path(drm_minor), drm_minor, =
i);
> +             else /* i915 */
> +                     snprintf(path, sizeof(path), "%s%u/gt/gt%d",
> +                              get_sysfs_drm_path(drm_minor), drm_minor, =
i);
> +
> +             if (stat(path, &st) =3D=3D 0 && S_ISDIR(st.st_mode))
> +                     gt_count++;
> +             else
> +                     break;  /* Assume GTs are numbered sequentially */
> +     }
> +
> +     return gt_count > 0 ? gt_count : 1;  /* At least 1 GT should exist =
*/
> This is a bit strange - you checked the number of GTs earlier,
> so gt_count =3D=3D 0 would indicate an error of sorts. You already
> have a check in get_intel_frequencies() for num_gts being equal
> to 0, so no need to force return 1 here.

Thanks for pointing out, I'll change it.

[...]

> +/* Intel-specific frequency reading for i915/Xe drivers */
> +static char *get_intel_frequencies(unsigned int drm_minor)
> +{
> +     char freq_str[512] =3D "";
> +     char gt_info[64];
> +     int num_gts;
> +     int gt;
> +     enum intel_driver_type driver_type;
> +     bool first =3D true;
> +
> +     /* Detect Intel driver variant */
> +     driver_type =3D detect_intel_driver(drm_minor);
> +     if (driver_type =3D=3D INTEL_DRIVER_UNKNOWN)
> +             return NULL;
> +
> +     /* Get GT count from sysfs */
> +     num_gts =3D get_num_gts(drm_minor, driver_type);
> +     if (num_gts <=3D 0)
> +             return NULL;
> With current implementation get_num_gts() always returns at
> least 1, so you will never return NULL here (see previous
> comment). Furthermore, checking for num_gts < 0 is unnecessary
> - this value will never be lower than 0, so please use:
> if (num_gts =3D=3D 0)

I'll update this in the coming revision.

> +
> +     /* Read frequencies for each GT */
> +     for (gt =3D 0; gt < num_gts; gt++) {
> +             char freq_path[256];
> +             unsigned int cur_freq =3D 0, act_freq =3D 0;
> +             bool has_cur =3D false, has_act =3D false;
> +
> +             /* Read current/requested frequency */

> What is the difference between current and requested frequency?

Requested frequency (cur_freq/rps_cur_freq_mhz): This is the frequency that=
 the driver/software has requested from the GPU. It's what the system wants=
 the GPU to run based on the workload.

Thats why the comment is so, I'll change it to make more meaningful.


With Regards,
Sebin

> +             if (driver_type =3D=3D INTEL_DRIVER_XE)

[...]

--
Best Regards,
Krzysztof

--_000_CH0PR11MB54270ACDD05823A367E838CF9863ACH0PR11MB5427namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, February 10, 2026 4:26 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Konieczny=
, Kamil &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigni=
ew.kempczynski@intel.com&gt;; Purkait, Soham &lt;soham.purkait@intel.com&gt=
;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v8] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
&gt; +/* Detect which driver is bound to the device */<br>
&gt; +static bool is_driver(unsigned int drm_minor, const char *driver_name=
)<br>
&gt; This is a bit misleading. The function checks if the driver is<br>
&gt; bound to a given device. It does not answer the question<br>
&gt; &quot;which driver?&quot;, but rather &quot;is this driver bound to th=
is<br>
&gt; device?&quot;. I think a more appropriate description would be:<br>
<br>
&gt; /* Check if a driver is bound to the device */<br>
&gt; static bool is_bound(unsigned int drm_minor, const char *driver_name)<=
br>
<br>
This makes sense, I'll change it accordingly.<br>
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char link[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *driver;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read the driver symlink */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;%s%u/devi=
ce/driver&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; get_sysfs_drm_path(drm_minor), drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D readlink(path, link, sizeof(link) - =
1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; link[len] =3D '\0';<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Extract driver name from path (e.g., &quo=
t;bus/pci/drivers/i915&quot; -&gt; &quot;i915&quot;) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver =3D strrchr(link, '/');<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!driver)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver++; /* Skip the '/' */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strcmp(driver, driver_name) =3D=3D 0;=
<br>
&gt; +}<br>
<br>
[...]<br>
<br>
&gt; +/* Count the number of GTs by checking which gt* directories exist */=
<br>
&gt; +static int get_num_gts(unsigned int drm_minor, enum intel_driver_type=
 driver_type)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check for gt0, gt1, gt2, etc. up to a rea=
sonable maximum */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; 8; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (driver_type =3D=3D INTEL_DRIVER_XE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For Xe, all GTs are =
under tile0 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;%s%u/device/tile0/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_sysfs_drm_path(drm_minor), drm_minor, i)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else /* i915 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;%s%u/gt/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; get_sysfs_drm_path(drm_minor), drm_minor, i)=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (stat(path, &amp;st) =3D=3D 0 &amp;&amp; S_ISDIR(st.st_mode))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;&nbsp; /* Assume =
GTs are numbered sequentially */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gt_count &gt; 0 ? gt_count : 1;&nbsp;=
 /* At least 1 GT should exist */<br>
&gt; This is a bit strange - you checked the number of GTs earlier,<br>
&gt; so gt_count =3D=3D 0 would indicate an error of sorts. You already<br>
&gt; have a check in get_intel_frequencies() for num_gts being equal<br>
&gt; to 0, so no need to force return 1 here.<br>
<br>
Thanks for pointing out, I'll change it.<br>
<br>
[...]<br>
<br>
&gt; +/* Intel-specific frequency reading for i915/Xe drivers */<br>
&gt; +static char *get_intel_frequencies(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char freq_str[512] =3D &quot;&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char gt_info[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_gts;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum intel_driver_type driver_type;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Detect Intel driver variant */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver_type =3D detect_intel_driver(drm_mino=
r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (driver_type =3D=3D INTEL_DRIVER_UNKNOWN)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get GT count from sysfs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D get_num_gts(drm_minor, driver_ty=
pe);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_gts &lt;=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; With current implementation get_num_gts() always returns at<br>
&gt; least 1, so you will never return NULL here (see previous<br>
&gt; comment). Furthermore, checking for num_gts &lt; 0 is unnecessary<br>
&gt; - this value will never be lower than 0, so please use:<br>
&gt; if (num_gts =3D=3D 0)<br>
<br>
I'll update this in the coming revision.<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read frequencies for each GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (gt =3D 0; gt &lt; num_gts; gt++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int cur_freq =3D 0, act_freq =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool has_cur =3D false, has_act =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read current/requested frequency */<br>
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">&gt; What is the d=
ifference between current and requested frequency?</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Requested frequency (cur_freq/rps_cur_freq_mhz): This is the frequency t=
hat the driver/software has&nbsp;requested&nbsp;from the GPU. It's what the=
 system
<i>wants</i>&nbsp;the GPU to run based on the workload.&nbsp;</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Thats why the comment is so, I'll change it to make more meaningful.</di=
v>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">With Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">Sebin</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (driver_type =3D=3D INTEL_DRIVER_XE)<br>
<br>
[...]<br>
<br>
--<br>
Best Regards,<br>
Krzysztof<br>
</div>
</body>
</html>

--_000_CH0PR11MB54270ACDD05823A367E838CF9863ACH0PR11MB5427namp_--
