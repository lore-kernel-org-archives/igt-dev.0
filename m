Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849ECCD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 15:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2694C10E4BD;
	Mon, 11 May 2026 15:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhiH0x5X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60E710E4BD
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778511962; x=1810047962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Yia44QZw5EfUsM5WPsGx0mFWnxekxdgB7Yi+5pYxULc=;
 b=NhiH0x5XQPkLajoEIhskflYXvQlNMT7diap7WpD7HyCWY4c0J/G1nLZf
 9WMLVoYaKVz/Oqx6fNnF09rsSWCQs5QoXHV7eXLDIW+Qm7FIQzDf2HgYA
 pe9n34WOlzvXxa1Y05htLCFFNF4rj4TJxl0iiEsJzgKw5qr80SROXmspp
 ocpYUru95SGrkINofmNV7YVEEzEW0xc+vAKr6AdKpQe2GevD99SXId6Ps
 kxZB1hzugInyyBVvmiZnuZ63RRhiCc4fRkgZphiJaGOYDsLe2zyVvtYix
 RJ7gBPP6sXl9oCzvOLwQFgDWHcF3mGWTGWaiQjwZgtTckNl6FsMMgVY+e Q==;
X-CSE-ConnectionGUID: l6Am389xSBCFrRv+yFBG5Q==
X-CSE-MsgGUID: Cu2rZpLZT32Z4bBZCOv8Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79121866"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79121866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:06:01 -0700
X-CSE-ConnectionGUID: uKz7nQHqT2CxTnhwu4Q7Qg==
X-CSE-MsgGUID: TPATwGxoSkyU0IUD07yP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="231084465"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 08:06:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:06:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 08:06:00 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg+tFxhMW6w260nKHkViKqjZSX26EX//PubKT2a5U16bygnXYQ+Dv9FX680Jr6D02bJ7B2sCIq7z94e/+q7cLo37X5rW4knTqeJezok9ckLM7tqyb5lg2mFwGRs7+ydUqQLhnTFTBF/Adm9nggvjIlViij/45NyjxxrwU5/yRU9q1nFW8vI1ZudY4Of+i7kABaRjEK1FnEWcX2ieGwRU6tEKgXiRu9lZ2nRaDqv8xKDWkqMB/36ws1q4GUMfSNE8PYswOqLfr3h6EhDRjALnALyJR6U39izq+IZkqxKGNct5POBd+fsZ2MOpHbKUT72/7DgEfF5Y6pJlWWZqXKtuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yia44QZw5EfUsM5WPsGx0mFWnxekxdgB7Yi+5pYxULc=;
 b=E34lfYo9NedcoQRVQae4zbgRsVBztJDsj4WcL/14MYM0EzPLeo9wwHnUjbNymLGV/JpBXd24NHf8t9F3NjCJwLVhHUzti/OB+4+dt85CoCoCYOkKAzAVQ0f1qCXHOPuz7tVyOrbLJr27cjgwdCgGMuPXy/IsOYzyx6leGqZOU5cn1Hm2R1m+j2RA0Aim42lb2r4OLhD9zKc0B/iBI8wGAa4NLrVWSgbHz0EJtU0OEWgGU4E7D6F70tVcs1SJK67N30h+gJQXvljT/gy1J82YGoSwTx/xIGnspwhivLS57WMpmenYHy7PVN1JoAoboGY2d1D480G+d6emc7nF899cMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by PH0PR11MB7523.namprd11.prod.outlook.com (2603:10b6:510:280::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 15:05:55 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 15:05:55 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "Summers, Stuart" <stuart.summers@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>, "Grabski, Mateusz" <mateusz.grabski@intel.com>, 
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 1/2] lib/igt_core: do not reset errno in igt_gettime
Thread-Topic: [PATCH v3 1/2] lib/igt_core: do not reset errno in igt_gettime
Thread-Index: AQHc4UWnY72B3O5qsEmzAs/YR//AkrYI7MgA
Date: Mon, 11 May 2026 15:05:55 +0000
Message-ID: <7e1517c71867dd5101dda96a61d4ee8854f6a615.camel@intel.com>
References: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
 <20260511-add_timestamps_to_logs-v3-1-041130e1f7ef@intel.com>
In-Reply-To: <20260511-add_timestamps_to_logs-v3-1-041130e1f7ef@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|PH0PR11MB7523:EE_
x-ms-office365-filtering-correlation-id: c0914712-5223-4dfe-c44a-08deaf6ecd0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|11063799003|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 8C55q0yK/IdEupJ9E4vmaitD5EgsNcQyMm3ZCkoFTpzTQ5ryfkNOoS7YUKajq1sTt+fbxQEzu+cZaGeE6XAIJpbpaGcWucSTei2Uumi0o6S4aOLhfNj4w0LI0yqCe6yAitTiud5MG0H+WW/tcvRlp8LRdU+OXcC0Va/WO+Jn1WqgkXHYCZgpwB7zHNNa1xzncTgx8Kj/HhXP9TKgrpUuQS36i/S00d9T8RZKmTfW4kh++ePzD9qP19aRjhJNvGuBne1Jca5j2u2km2cFdMyNS3D57/4eLJ6e4IOVJnAAJ2Lmlj3luWkGaq/rQNlTDVb6JKHmT2VHWcAXe/osfbZGQQfVQCPIQeYYd48fwEXF9KoAKtnxMxl2xer/wpk+KOXq2bESlf3jCpeJeuuIp7VuybUadxe/Megx+0NXSE9NMrDvIU+2Wn8VW7+qL4XuJfDkGAN2qYf/oUHDpWydv7mRBWNtU+xSrj78itA9fOpiScZuLzCM3vqEO66xFBj3aLTEOzNy+MjrNp9sQ01BzwwsqaXiPcyJZaq5ef+r3rqmtFBX5JuWzXX4o4XmjJuauodnrgvXsWnWo+Xrp3AH7zTTdnua0fJEZ3arBXQOp4Obpyae+/ZVEadnUJOlcpmBoCDUGZXLU9/aLdMVZPvn23lJpzN8MMgiQrIM2wem26GqLYLgTh2Bfd9OhXj1E/lM/oYqicpS17fPKf9xd6X9pNzcsKcSTdgoHZ7H1u2YDG6hPov8Ijj2phUe76eClE7h9QUj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXZoY3k4N0lTeG1CaHUxaGd2N3hCTmpJSHpxSmMvTlE1aHU5UmxFaUxYdWxH?=
 =?utf-8?B?MVp4MUtjOFFnR2J2WGlZSmYrSFU1TERDcnBxSWdYcHFDV3NxTzY1ZzdvQzlK?=
 =?utf-8?B?QldpTlBtTmF1aDBCUzZ0YmhJQUdBVFJZZ0taNUcvbGdIZzEzZkMxd2ZrWExS?=
 =?utf-8?B?L3h5bFVPc0dOT2E2YXJVOEdlQWg2WFlIYVpOSmZuRW0vNDM1cUNSUTVPdUpT?=
 =?utf-8?B?QmIrSXo0THNxbnNzL09XcEgzZS9yK2pROU9jVHBYd0tIZGYzVW9LL24zQStk?=
 =?utf-8?B?b0VaaFJuejVYMVRvSzRKciszOGFIVEZpUFc3T3QvQ2VVWTN0ZnhzOGFFMDlz?=
 =?utf-8?B?SkZZZmdQOU9SK0xSdWV1UHNET2gwcFpIUkRScjJ2NThHck1wMkZmS2hGdFdv?=
 =?utf-8?B?SmR1SGV0c1hqQ2hlS3VQb1Ardlk4Wm5URElLVC9WK1luM3RKbm42TFkwZ1dn?=
 =?utf-8?B?UlVEYjY2RGZwTHVSNzViYTlWT0RXSkJxc2VUc2dtUzRXb2wwbXVFL2ZYRlR1?=
 =?utf-8?B?WlV4M2lQcStSMFBtMU1GWEZRTjdlZ2JxTytMb29VQnl5enNhQmJoRWRsbTVV?=
 =?utf-8?B?RnordHZadExlNXBqSWhJU08reDMxRUE4Slp1ZTlZR2VzeExBQTI3NlZEcnNz?=
 =?utf-8?B?SnZwMW9aNTc1S1F0ckhlYVUyZ1RtSEZ4emhmSENJc01MVmpid3hMRmFJUVRB?=
 =?utf-8?B?TGFKb0w0V1ZGMmtQVmFLdlBtTDRHaFRZYmxDbENYZXJ3NzhMMm9hTHovYm9z?=
 =?utf-8?B?SWExRXc2Y1cwTmp5c0pwTTR4RGlYc1Y4MFRyeHNTMS9HbmJ3YzVhSFV0NUti?=
 =?utf-8?B?eGM4Q25mYldQdUl1TGcyOE93MXNQMWZVYWU2OEZTQ04rWktIWFdEb0owYlV0?=
 =?utf-8?B?NjFVckh6TG9aUzg2QlJjdVAxcFBnWXJxbWRJN2xLQ0xUemhFdmxJZjBvZFh2?=
 =?utf-8?B?TjRmTGFjYXRLWGhIMTdUdU5TRUVCRy80SUN4L2t4WTF5aXd6L29ZbDNYUVRm?=
 =?utf-8?B?bFlMajBBRFpRVWpRZlJrb1JmaENadTRRSVEvUFFCTXdtek9ua2Y2Z2l2RlBW?=
 =?utf-8?B?dFBCN294amtYTXdJYnkrSTJhY05vVFBWeUhtc0tFK2w2SXBEdjBiRHdvVHU3?=
 =?utf-8?B?NUZqcmgzZFlHdmt1QzhsMlc1MXQ0S053VWFYcDhKWHFXSkdWQjJZTzBYUEgw?=
 =?utf-8?B?M1pOblR6NVVoNzZxbDFPUlk5QXVVT3ZhbFU1VkVkNWNsa2YvQWZ1cGVQWmpl?=
 =?utf-8?B?eEEwb1h1SWh3b08rd1ZFVGdPRDBMWXJ1dkhpSGpwVEJOeTFrMmtHV1FHaXhH?=
 =?utf-8?B?V1VSUmRCZyt0TXFKL1d2aldLcjJ0THlhbG5YcDRHeDVHMzhjemRvSFZyNWFq?=
 =?utf-8?B?a01Jdi8zZGxra1NMNS9ndldaT1o0U1ZrSjlqc3VvQ1gxMERBbHZ1TXMvVXo3?=
 =?utf-8?B?YjBEMUpiV1JYM1hjTEZQTTc4V2c0SXdHa05UZytDWGpIV1A5R1hPZWF2ckhz?=
 =?utf-8?B?VEdhcmpOempyWnVOTGl1dkNqMThHNDJVeEI0RS85eTNwZDdYaEprWWJqM0x6?=
 =?utf-8?B?U1ZaZ3VZc3dlbVNlTnpQVC9uWm1UOE1JR3dhSHBKeTh6Q0xlT2dLS3ZIQU8y?=
 =?utf-8?B?Uk1SdUJ4bGljQVZEbk1PSmJYU1RBM040VnV0d3hJdDRaRjB6c1p6b3JpMFB1?=
 =?utf-8?B?MzlBcWp5T0pYdkNFUkNoUVVvMWZsNmwzT3F1WUU5aU5zdUZFaWY0d0FvUEd4?=
 =?utf-8?B?a3I2K2N1N3pyMkpTQjVPWUFnT3R0cXF2RUJJaFp0YWt4SXp4RnQ5N1ZiWjhR?=
 =?utf-8?B?L0ppVCtHZDdHRkpjdW5MY3ZGaXFqVjZIWWpLRTJSUzhueTdnTVp6NHpCOXh1?=
 =?utf-8?B?QVkvaHo3bUVydnpJa2lhK0dtbWN6c0V6U040N2xpRzlHaWFQRmJOaDAyamYv?=
 =?utf-8?B?YlBxUDIrNWtnQU5DK1IrOTk0bFJLMTduSkVmOUN4ZTE2WXM1aXJ4elFrdzQ5?=
 =?utf-8?B?bDI1V1p5U1RUT1RuUG54MVR0VzBYaFZNbC9Bc0hPTWhWd25mS2ZxT1l2YTZr?=
 =?utf-8?B?ejV6aXpoMmxSN2hZNldzK1Y2N3JzNjRGRDBEMFBFU2JVZTV0NnBRL1JKMVZ0?=
 =?utf-8?B?M1JTZlRxYlhPSUFYZTUweGNNWUlsZHF6MVgwVXdyaVJxcEE3ZzhvTVMrQU4w?=
 =?utf-8?B?YTNQTTFUQldSV3NFZ1lGOXU1WDdIZys3QjFaWGhlc3ptdzh0UDZ3K3dmeFNm?=
 =?utf-8?B?NC8vOC9xY3RwRS9SZkR1Wktiank0TE1kckh6WWc4YjRCNjY4MWRQeEYzc2Jp?=
 =?utf-8?B?YTFiNWJ1NmFkandVRkl5SzJLTnV4R0xJL0JuMjFMZHYyMW9SRmdMazNCYUd0?=
 =?utf-8?Q?psl1vc99VThAHS8U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3127F0ABE98F2B47BE89F43588A40EAF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hEEehNOUl0U9dIvlFQXEJPl4MYKoQpXQLWmpgO7gqzzFW5mQ6DDLHMwUofTwLUISMBzWpCa3O/4A/Xf2toNH5iE23yD4wiTgPYZuvQGpZi+6PkXOgOjdahuCT6juuFlscs7oaYvDflAXOHM4iaj0V99Z+kYyX1hJxJLKWHVDyKF0tCailu8zr7oOHDQpPKOw6uVGdq/+lM65LQrGVp+T9BTAuSO4ePOeP+n635L1d6SJgD6Vv8wzMk56E5tyxQ3pKK/mFqmgm23wOS2hO6OwLeF4jyDMEfXzdXJiwPneqoBFOjhnr8cvFD5i+MjPUFH/eltYN6xTEdkMdMg4j0naGg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0914712-5223-4dfe-c44a-08deaf6ecd0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2026 15:05:55.4322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CllCYGcLcnCN4r4IQhUn2TzFUvXdgzVNNyTuTikcuBUkSDq/KXsYxZDRcyrC4QWuFUhSKoZMZqt71hsxv85I/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7523
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

VGhpcyBmdW5jdGlvbiBpcyB1c2VkIHF1aXRlIGEgbG90IGluIHRlc3RzIHdoaWNoIGFsc28gaGFw
cGVuIHRvIGNoZWNrDQpmb3IgZXJybm8gbGF0ZXIuIEEgcXVpY2sgZ3JlcCBzdWdnZXN0cyBub3Ro
aW5nIHNob3VsZCBnbyB3cm9uZyB0aG91Z2guDQoNClJldmlld2VkLWJ5OiBSeXN6YXJkIEtub3Ag
PHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQoNCk9uIE1vbiwgMjAyNi0wNS0xMSBhdCAxNDo1NSAr
MDIwMCwgQW5kcnplaiBIYWpkYSB3cm90ZToNCj4gUmVzZXR0aW5nIGVycm5vIGJlZm9yZSBjYWxs
cyBtYWtlcyBzZW5zZSBvbmx5IGlmIHdlIGFyZSBub3QgYWJsZQ0KPiB0byBkaXN0aW5ndWlzaCBp
ZiBmb2xsb3dpbmcgY2FsbCB3aWxsIGZhaWwuIFRoaXMgaXMgbm90IHRoZSBjYXNlDQo+IG9mIGNs
b2NrX2dldHRpbWUgLSBpdCdzIHJldHVybiB2YWx1ZSBpcyBzdHJhaWdodGZvcndhcmQsIC0xIG1l
YW5zIGZ1bmN0aW9uDQo+IGZhaWxlZCB3aXRoIGVycm5vIHNldC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxp
Yi9pZ3RfY29yZS5jIHwgMSAtDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMNCj4gaW5kZXgg
NGY3OWMwMjk0OGFiLi41YTBhYjQzNjFlYWEgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfY29yZS5j
DQo+ICsrKyBiL2xpYi9pZ3RfY29yZS5jDQo+IEBAIC03MTksNyArNzE5LDYgQEAgZG91YmxlIGln
dF90aW1lX2VsYXBzZWQoc3RydWN0IHRpbWVzcGVjICp0aGVuLA0KPiAgaW50IGlndF9nZXR0aW1l
KHN0cnVjdCB0aW1lc3BlYyAqdHMpDQo+ICB7DQo+ICAJbWVtc2V0KHRzLCAwLCBzaXplb2YoKnRz
KSk7DQo+IC0JZXJybm8gPSAwOw0KPiAgDQo+ICAJLyogU3RheSBvbiB0aGUgc2FtZSBjbG9jayBm
b3IgY29uc2lzdGVuY3kuICovDQo+ICAJaWYgKGlndF9jbG9jayAhPSAoY2xvY2tpZF90KS0xKSB7
DQo=
