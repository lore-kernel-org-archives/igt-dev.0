Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596E4FF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 07:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89FA10E11B;
	Mon, 27 Apr 2026 07:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDFfgsMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D0D10E11B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 07:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777274094; x=1808810094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EUkq7U9WD2zrNSVoRQJGFoAHlJf5r1J0DB08/bpdgsQ=;
 b=hDFfgsMg0Cu8P8hRqlNBNvL3Hqr8iw7zG32JKM/3ImGdguDx5uKjdZrd
 FWNnwSGDFzjaiKH65iAFNuPjytslkLyZfA5xg6jbfTdIW36quGjlJB3vY
 mWnGbJSFb1x0xopFMNCdwrlONYhTIpowSJYtOEGZte6uuVKthhFkwCMwg
 h/w9QkL6QYbLD08JQsd0ca0UIoAveTKsmxvK+IR5eWsjINwOt6Qbmr5dF
 dpGJ/KvnuqcZOcE+QelmgKi/zOErZai6jiT9cp6JX79ohdxdCZCvxBu7V
 7tB6X2nYlZOt0WRuZ5TDSHObNizdfN00scc/dZeq4wP6k80htD1dX0DvL Q==;
X-CSE-ConnectionGUID: Bq+L6R+4SbClmA/Fa86uQQ==
X-CSE-MsgGUID: Ro3iUHnZTlSX/Bka+aDaGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="82005388"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="82005388"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 00:14:53 -0700
X-CSE-ConnectionGUID: Kd2WCUUnQS+s4JPQQVCGxw==
X-CSE-MsgGUID: Xf3eHfmgTJ+yjXXkXVRfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="257077802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 00:14:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 00:14:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 00:14:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 00:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3D+LSSuzclexj6Ji8FC8RP2tEo0NBvev1J0HcP1ej9v7I9fphE/YtF6Ogma49/75/+ImlmwoL/uy5NzHSsPTkhMP2IOVBcyrfl4HgWlz3IjbURvEIUJIE7G9ERcDAaAd1VPkykqan8HFyNixcbaPjiBqMTNRKaAb5YJM+qwIfI7xnNL/h3UW7BW6piSz3GFQsAQYAauWwRiWLJKsYr301fI/EsMVFNPUUEdpYixDv2jGpdARwSATGyiJLbeSD+tsZo36j1wQFL8/tJyP2bBQzDK1AMCXSOmle1YiK6p3hFVed35Jk/z31HEYpflv7sqYH70VzC0p2JPfp6ZWtYyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUkq7U9WD2zrNSVoRQJGFoAHlJf5r1J0DB08/bpdgsQ=;
 b=kkrvx+XhpwlFqB2UtbU4H/fWHEb181Zs1v9SNS3yIAenFlzwiSAhHA3hwzWywDYdCda37WHlKK4S6EeFOHceGlbvULv1t9cxj2SPGiZkm793n1iVr0d1wwMnxbS5xglbvVz9v95JUmUvQUlImrA4xP8CNLV8Yzs0cCZvK3XRKeAMadL3HZhvNd/MbhGLNwp7iiKITZyoFV8Ba+bJ3StW1EHfLBl25ZDOMa/mSTArb5/bexYUUge2dgywQIOYzBdN+h8G9moO3dO33eIDGbTHcvRCNBG/TTu6bVOl6TeJLwZgqP++lbrJg3vGz7yXs7UEbIWhT6+CXXf5PlVv9VuK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 07:14:50 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::218c:773:922e:7d82%4]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 07:14:49 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Musial, Ewelina"
 <ewelina.musial@intel.com>, "Zuchowiecki, Grzegorz"
 <grzegorz.zuchowiecki@intel.com>, "Girotra, Himanshu"
 <himanshu.girotra@intel.com>, "Grabski, Mateusz" <mateusz.grabski@intel.com>, 
 "Drab, Pawel" <pawel.drab@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
Thread-Topic: [PATCH i-g-t] intel-ci: Add a testlist for D3cold tests
Thread-Index: AQHc0msPCpfaq1Ddok2G54fGomxxeLXyhfRw
Date: Mon, 27 Apr 2026 07:14:49 +0000
Message-ID: <IA3PR11MB90130EA677C4CE6B8FC412C385362@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20260422152254.858478-1-karthik.poosa@intel.com>
In-Reply-To: <20260422152254.858478-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|DS0PR11MB6448:EE_
x-ms-office365-filtering-correlation-id: 87710fd4-cfb0-411d-9c80-08dea42cabad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: C4GmhRr9Z/xJR2MW4et2papAjmhvWFkN+b9SYOvQ9hvajKNVdDOKZSFBvTxRg/YC3mD22UzMxfFuE3D3phLtw0bdf9z85YvF0Y+EyqM+WV56xTdY2WTY2fD11DS8ol6cJi/B+EwEUF8OVkG+0eizqH6afHnvJ4sL1N7JuCX5t/GqHsy4WDlqQrLumRnnO1CdptQdgj2wyhK88qL8IK9VU5B14bbCUbo4JTrkdfa5Y9EnK5VfXL0+h7lX48LYkoO1VRQlA8EQ6MsBMYRPDancwIJ378n1apvqE08CL7vsAhmiigQeasVfF4C+LmbPopVb+LMQyA5tgGJ9QpLFRQ3HSy5rCXLxEws+RIJFp7k0FLGwinH+p1zH1XXXl+QDQqhTrCiNmVM1Iu3z/OM79CmjQlnewN2tEwopmrqMcOPTgCVsV1/N0RVD5tD2hxzFFwdJOpmrpXrsN/PBxiMX9Fy/WSo9hkY/M9Nofh5ec1rlqZjkupxiyXcY1LJmtJWFgBwoAYi+JTPrjm/X+9G+pEVepTXLAj86mBTfCu1cbfNNU+Da0gMSwSW8reXGYA8kmiB2gx/gr1gYKcpB1kSlY03ziFSj9CwNwKIjDsYUZT1fiC+Ybt/bbPYKxf/xSIOo3ceqv34SvXWgM/Ls+1s17OwSuE0O9yXDQ4DP8qzP3PjSrEYa5JCdW/Lis6FduDF6UL4OCAY2iMF/51UZpe6fhH4WkZJnxMhRPttx3m//5ZUBXlihzdKaj8DjOUHR5df48IXaKe4W4EXMLL94qqI0KQtBYB6jFxRSl4AB7ICjzGGA1NM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2JrR2ZkNzIyNUlYUTlwNU52cmROQVQ4MlYxWTFUTHNxWUZyd1VOTUZtd1R3?=
 =?utf-8?B?SVcvWTF5SjRMV3VaeVpkcmh6R1F5REpNN2U2U3dPQUhORk4rRXhnbjlrTStk?=
 =?utf-8?B?YnB4MC9GZkNlSk0wdThkUDBaVG8zL1FubVF1bWRtdGxRVGtPTVRRNkVtRm1E?=
 =?utf-8?B?WTErSmxuNnpkUm1RNXZPemMzS2FCc1lNRXFLOUpBd2UrandZQWtKQjZTZXhm?=
 =?utf-8?B?KzFpTTZiYmZzT2o2RDI5cnIrNmtSekk1SVJOeEh0Q1lQUEV2dElRM3lLWFFW?=
 =?utf-8?B?cGppRTNBMDJNVXdzdFQ4QmxLZWxqZEtPTjU5cXpqY1JPejh3V2pxRkZLN0hX?=
 =?utf-8?B?Qk9nREl2NmNhRHJKRG55VXdCeFlXajhBSnFJVVRHQXU5V1JYdmV1STZUeDlR?=
 =?utf-8?B?eGl6cmJCRWhwRHBxbFlwUVFoVWxjOVdXcmsxUVpxUmVCemhJeDVzdWM1SEpZ?=
 =?utf-8?B?WUd3MUJidUREQVZ6Mmk5RXFLZU5oYzhMaDN4Vy9iOHdiTmhnWmdjUjBJQTVW?=
 =?utf-8?B?Q1BLTXRRZUV3aE53MDJQcFdxRGlXdTFlQVpDc0hYeHIrNGlpeXV5aURlWXlm?=
 =?utf-8?B?M3Y3ck9nZXoxT01NdmNuNWRYNnkzN0twaHJwdmJwK0NsNndKNStjUE1iZnB5?=
 =?utf-8?B?Qk53ZndIelhaTTdEVE9heE5DajV4dS9DSFVTSkduempsM2VMYTRWY0FGZ2pC?=
 =?utf-8?B?NGh4T09VbXNnR2VaMVpxcWR6a1doQzV0MnpRK01WZHBPNDh1L2tWMEczVVJl?=
 =?utf-8?B?TUlERVRqSHZ2QnZUZUJ4OHhhZEVsRkV3T0hlZ1pVWVR6T0lGNlZuRnkxVXBD?=
 =?utf-8?B?VjBoTTB0VmQ0Q1Q2UzRvMjQwMU1HUTNoeDFmVnJEMGVoTjJHTFZjakhRMktl?=
 =?utf-8?B?RDZ4Y0NTaGxYOUU0UHJZQWt5SXJnNmNaL3ozRW5iK3gwbGY1dHhtM3lKWWp6?=
 =?utf-8?B?UVJwOEhHcVl2QXBidXR4UWhrMlBzM1d6VnQvNCtGTVY5SDc3cnlqRGMxYmtt?=
 =?utf-8?B?SEoweTJrUjFaN2hGZFZXK0NuQVdyUFArNk1rK1lJaUc2alRCUy8zNHQ1S2pj?=
 =?utf-8?B?VTlZcmFjSUZTTDBxb2lJZTYzOUV5Z3VsV2UySXVaaldiNGJXczBWczVxd1FD?=
 =?utf-8?B?R2czMnV3YnJMQ1lKdGVya21FSVhsblZId3l6cFVYWXl6cWpqUHM1dXZHZ2Fh?=
 =?utf-8?B?QVVWZXlrOFRvSDlhTXg1dnVNVFlxcnQrN0Q2ZE1lRGZJM3FBdE00YzVzNDNN?=
 =?utf-8?B?blk1R3VKRjA1UlJPTFZwMzFSUnJlb2RSdmR3MUdrMGtzaWtIb2hiYWN4Y0JS?=
 =?utf-8?B?Ylh6WGRmeE5Ma0Ivb011aFZ6V0hZbUh1dlR4Tm1ybzF1YkpIZzBwWUR2NUVE?=
 =?utf-8?B?OFhqYUg1RzBkN1piWXBLVk1jRlJVR0Q2THJmQUNIdVpHMkpKb1UzUnBCajZh?=
 =?utf-8?B?THAzcnpGNjZCVHk2MkZmMlUxN0VaZmN4emFpQS9qTlRtZU5Bdjl4RUlYL2xF?=
 =?utf-8?B?dXpxNkRVSFVtRWM3aUpVU0lQNXdtQjlJU3c0bVdUZ3lPQVdRR2xETm40SXJP?=
 =?utf-8?B?N1RGbFE5T1lOWHVYa1hsZTZ0L05WZEdLZmpmZkpMY0o1TzBkWEYrYlh3QXR3?=
 =?utf-8?B?M1JBb1FmNXRwem5FUmdlc1J0bnZZSDdTVHQwT01aSkZva2JxcHJIZUFlQ0dE?=
 =?utf-8?B?QkFqU3VPZlJzZkxmMTBWWnZzRmtQYVFTaWluNEVFK2hGaUtpV1BLYm1NTlZP?=
 =?utf-8?B?T0FVam1yYlhpZzEyYlNyMjVHSFRtd28rRktWazhJVjh6bGlmYkkvMnBOVDdR?=
 =?utf-8?B?YWlRc1NVb01uMzM3SXFSUFRnUXQ1a2lma3d4SVN3d3VKbFJvQWVwb0pMaXMx?=
 =?utf-8?B?VHkxS0hoVG9kb0RRN2pKcS8zSWRMeWtPWFU0S3phaXBma3pGMVhXUTdTcE41?=
 =?utf-8?B?MXZ3M1lhRjZtb1VMWE1ydjkvTVZDTVlXWTlyMTBLazdld1QwM21mVUFnY3lM?=
 =?utf-8?B?SXhhbEppam1yZHZCRmpuYnNsVUZXeng2TW1XV2RaNWFSWm1IWXA0Z2N2VHVD?=
 =?utf-8?B?UnJjL1FEQWt6UUhlS3lFbmVseXI0MjdKY2ZTWlBsakVYaXlLUmx5bjh6UHRW?=
 =?utf-8?B?Wjl6WVlOSlovbk5SdHBhUzNIZnVDWjZHM1ZVQ1VyL3ZiU2RtdlhXNkV2WG8x?=
 =?utf-8?B?dlBMcnJYb2h2MnpMQzgvUk90U3ZFeFdtdTVuUlJTWGxjUHE4RWZQZC9HYXBV?=
 =?utf-8?B?NGhvVndNbjJlVUR6Q2lPa25oemdHUWlPVWJ0U3lCYjZ3bFFsVDJ4Q2RxUjFw?=
 =?utf-8?B?aWY5YSthU0lBV2paVGJNcnRuVzVyU3AvVldwRmZPZUo5bnlRcmxhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LOSP9uglmmGVFR/FJ8MI/voqLyk55MLPI6OkCSiLOnL3fUX/RI9UMxnrSDnVqhDxRA/CK5Cy/f5NpSMXbhLxkvCxu1L+ZqD5DX1vYsR5DAhzBWSN/2VZ5FqFTFZkLRcL5ItpKatOex79l89iov2Fs+ZthSE9p5cBSd0/6WkhLX679hyNA764EgkIXIMnPgaP6LuuwE9sSs3R9jdUENXcydGKb2RwO9QN3vRpQS5Ea+7ijqvK7MSg1RjKhIOx9d1DrYXN1Xe/cggdvSaLtxWG3RzyHGcupTjLAt9CGJh53xkLo0Uh0XrH0kYOqO5YVNMIiWBE2Jj9C7wy4OA94dprWw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87710fd4-cfb0-411d-9c80-08dea42cabad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 07:14:49.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LI5BXuZ+oezzDk8yViW2eWzrT19FPZhUoeO42GaApRr/wDoHRZV+VxUfV8elpEA5WVN8rqRpwbzhLe6EByvyzsHYzap6P6MSUq2mf9PbEQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

UHJlZml4IHdpdGggInRlc3RzL2ludGVsLWNpIg0Kd2l0aCB0aGF0IA0KQWNrZWQtYnk6IEdhbmRp
IFJhbWFkZXZpIDxyYW1hZGV2aS5nYW5kaUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogUG9vc2EsIEthcnRoaWsgPGthcnRoaWsucG9vc2FAaW50ZWwu
Y29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDIyLCAyMDI2IDg6NTMgUE0NCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBHdXB0YSwgQW5zaHVtYW4gPGFuc2h1
bWFuLmd1cHRhQGludGVsLmNvbT47IE5pbGF3YXIsIEJhZGFsDQo+IDxiYWRhbC5uaWxhd2FyQGlu
dGVsLmNvbT47IFRhdXJvLCBSaWFuYSA8cmlhbmEudGF1cm9AaW50ZWwuY29tPjsgVml2aSwNCj4g
Um9kcmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEdhbmRpLCBSYW1hZGV2aQ0KPiA8cmFt
YWRldmkuZ2FuZGlAaW50ZWwuY29tPjsgTXVzaWFsLCBFd2VsaW5hIDxld2VsaW5hLm11c2lhbEBp
bnRlbC5jb20+Ow0KPiBadWNob3dpZWNraSwgR3J6ZWdvcnogPGdyemVnb3J6Lnp1Y2hvd2llY2tp
QGludGVsLmNvbT47IEdpcm90cmEsDQo+IEhpbWFuc2h1IDxoaW1hbnNodS5naXJvdHJhQGludGVs
LmNvbT47IEdyYWJza2ksIE1hdGV1c3oNCj4gPG1hdGV1c3ouZ3JhYnNraUBpbnRlbC5jb20+OyBE
cmFiLCBQYXdlbCA8cGF3ZWwuZHJhYkBpbnRlbC5jb20+OyBKYWRhdiwNCj4gUmFhZyA8cmFhZy5q
YWRhdkBpbnRlbC5jb20+OyBQb29zYSwgS2FydGhpayA8a2FydGhpay5wb29zYUBpbnRlbC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdF0gaW50ZWwtY2k6IEFkZCBhIHRlc3RsaXN0IGZvciBE
M2NvbGQgdGVzdHMNCj4gDQo+IEludHJvZHVjZSBhIGRlZGljYXRlZCB0ZXN0bGlzdCBmb3IgRDNj
b2xk4oCRcmVsYXRlZCB0ZXN0cy4NCj4gVGhpcyBsaXN0IGlzIGludGVuZGVkIGZvciB1c2Ugb24g
Q0kgcGxhdGZvcm1zIHRoYXQgc3VwcG9ydCBEM2NvbGQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBL
YXJ0aGlrIFBvb3NhIDxrYXJ0aGlrLnBvb3NhQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9p
bnRlbC1jaS94ZS5wbS5kM2NvbGQudGVzdGxpc3QgfCAxMSArKysrKysrKysrKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9p
bnRlbC1jaS94ZS5wbS5kM2NvbGQudGVzdGxpc3QNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9p
bnRlbC1jaS94ZS5wbS5kM2NvbGQudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC0NCj4gY2kveGUucG0u
ZDNjb2xkLnRlc3RsaXN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAw
MC4uNzgzODU5ZmM3DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50ZWwtY2kveGUu
cG0uZDNjb2xkLnRlc3RsaXN0DQo+IEBAIC0wLDAgKzEsMTEgQEANCj4gK2lndEB4ZV9wbUBzMmlk
bGUtZDNjb2xkLWJhc2ljLWV4ZWMNCj4gK2lndEB4ZV9wbUBzMy1kM2NvbGQtYmFzaWMtZXhlYw0K
PiAraWd0QHhlX3BtQHM0LWQzY29sZC1iYXNpYy1leGVjDQo+ICtpZ3RAeGVfcG1AZDNjb2xkLWJh
c2ljDQo+ICtpZ3RAeGVfcG1AZDNjb2xkLWJhc2ljLWV4ZWMNCj4gK2lndEB4ZV9wbUBkM2NvbGQt
aTJjDQo+ICtpZ3RAeGVfcG1AZDNjb2xkLW11bHRpcGxlLWV4ZWNzDQo+ICtpZ3RAeGVfcG1AZDNj
b2xkLW1tYXAtc3lzdGVtDQo+ICtpZ3RAeGVfcG1AZDNjb2xkLW1tYXAtdnJhbQ0KPiAraWd0QHhl
X3BtQGQzY29sZC1tb2NzDQo+ICtpZ3RAeGVfcG1AdnJhbS1kM2NvbGQtdGhyZXNob2xkDQo+IC0t
DQo+IDIuMjUuMQ0KDQo=
