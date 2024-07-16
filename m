Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9C2C3DA59
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 02:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52CE10E0E4;
	Tue, 16 Jul 2024 02:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PG/7ORjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780CE10E0E4
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 02:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721096138; x=1752632138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DwpKF5XmA+sX+2ItxaTbNA6TIVpusukJryYTSQZNjtw=;
 b=PG/7ORjSeZrQz9i54r/3ayZHWQYN9Gg75l+6IIij52PYFRJ9A+WB8EEd
 6zmBUtfD50RBuRQW3g73uEZ64ipyj3D7zLSwep27u8zGHPj8ausnokBXT
 2NMWGY3hTkWGRkd9lpdzO5Mpb0EZta+CHt1wuF/pqWHYNao0LsoXZ2QX6
 DGGGrlW/AH1NY3C8upw9uN0z8B6fqsH1rbD8j6eBIpalinXAkIwMN4ObB
 LcRTwnwrORjApNHMM2ieFTps99+Hl8JwQmdfL5fajws8WCamAUKJRWgXb
 fMNpXQvGgS3te4xw/8TqYocPY5jUdJYfHWZI9t0QebBCKLfAEF3MkK6jc A==;
X-CSE-ConnectionGUID: BPZyjsfPR+e/Yetn1kHV8A==
X-CSE-MsgGUID: NPET4d/2SxeoV3GKwI8g1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18218922"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18218922"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 19:15:38 -0700
X-CSE-ConnectionGUID: AlBp3hfgRkmy0ddaZY15bQ==
X-CSE-MsgGUID: 4gaORipZRPixCKA+UNgGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54663907"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 19:15:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 19:15:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 19:15:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 19:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZizRk1p7fqCKSduIgpTUVj+sUFVMF4JQTxbdJSzBnUeCgHEtHCOQwK2MnGnxqP8l+7+M6rftGRP8W5UdknR15s763BECRnGut9qrYuOQ5FwTHzHAI78V8kPcMTpNgag36CLaANTBryPCzPXmXiDpfqgxMZlBWT6CvFMgC0cY3h40GXgugHCYI59SUUWSwpYWRuCBfolwZop8Y1USQVSfnH96Gio1nqyUlvakBfS3KrZ/MVKjjyyiiOPI8CPyLgjwdoJBWJcdRRL5yPR2kCnH5Cc/V4Sj078rJ62AtuvLO4PLRMNi+fCBswDfmxEKT5YiE9r/rnb2p8V9wbvPKbvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFeubzcnOLGoowmHe4q4V2PQza9hbXSsUrAOju0aiac=;
 b=Ut69wtb/uwW+aNtA/Ef4Hx1LoiZas1Wa5ASaDVp9/yh05YrRb8h8/7T2Jqd7KYtDnv8hkRdytQtvdCT2HQEeTkwjgX7uPNItph/E/k/185AlxCRS3OmEW37pfXSVUT3HlyzyIOnIKOJGaPdvBlbxZk/0q7Cqek/jJC/S3EJ6+ipoZcUa5VjF8CtVERxRlrUFAoUTymCjcpmWAxA4ZY7qk5A1L3ckbrL6dR5KV/yNeWeBEpRHbzSKVDv2J7/wdNAlrcQoF2+WLB7Tpq8yVNzXLEl6gfAYZ8p3ZE/EZEAiS+/3H228PhpAD+pr7DRE27xFpmNNS9kcOtiN06eOY3H5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 02:15:32 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::ae3c:acd2:8d33:99d7%6]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 02:15:32 +0000
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "akshatajahagirdar6@gmail.com" <akshatajahagirdar6@gmail.com>
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Topic: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx
Thread-Index: AQHa0Ye+pzMauGfXq0WIl705vVL6KrHzDD6AgAWQ97A=
Date: Tue, 16 Jul 2024 02:15:32 +0000
Message-ID: <CO1PR11MB4977801EB665615DD9A794568DA22@CO1PR11MB4977.namprd11.prod.outlook.com>
References: <cover.1720515376.git.akshata.jahagirdar@intel.com>
 <e597e39b0c22d3b58cda09e0e4b33f883b9140db.1720515376.git.akshata.jahagirdar@intel.com>
 <IA1PR11MB6097B86A91F51B54C414ADA486A62@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097B86A91F51B54C414ADA486A62@IA1PR11MB6097.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4977:EE_|CO1PR11MB4964:EE_
x-ms-office365-filtering-correlation-id: 17833ac1-51b4-4913-fa73-08dca53d2b95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?r2tbJV1kGPF5AYOiIm4SeksuMnmpYVLwEN1BN9/mmUpvdLh6fIOvrNCEzo5B?=
 =?us-ascii?Q?Xw48hQsF0Dvu9sBXqYje4qxZrpBlqUWSr5aG0CWTEru4uvU0HRPbYm5yDFzw?=
 =?us-ascii?Q?c8I7L1jajkr9emFATHzqMC4e9/U0vb7Bb30FsX0coB11SCI/n/wVReqgLWeR?=
 =?us-ascii?Q?ZRUSrG0v5bNaZtmt5cNm+mmbEVY0BtoIl1QbtNOwCr/aD4WAbt504S2zUE0y?=
 =?us-ascii?Q?KmtpWJQ8k6q7zRxCNnbVWQ37FXJceWGdbSfQuQTWfaynLoqN0mh/cJD9A3XX?=
 =?us-ascii?Q?YdU5MPLR/5CtC6JXlB0IZdAmOsGGXKONG4jURhJeaY9B/Xf1PW+rlaEFCXBz?=
 =?us-ascii?Q?fItrQa/Mwxq+3TzxbtK2VkruAzUv5dK4blnmBhMTvGtMtbnlb+5n2d9mZzNe?=
 =?us-ascii?Q?Olh90sviLRDrbINqBqBysI4v1uJRpt/P2cOc9tzCPV0hqwK/FM6MXTbqsK/n?=
 =?us-ascii?Q?H7fwzZvIpkvswKt0V/vH16cIavmZYj1Z8nk+XJxdw6jF1D9vOoksYM+k4fTw?=
 =?us-ascii?Q?MzWlSkURcbuwGKtrSUqpOsQvpHeldHbEbHRL74a5d5akZ0DyOwqu6JK3UT5r?=
 =?us-ascii?Q?7WpRjKHZH7kx/9POdnbBpzaRDqMNZxNBV0JWon0FfyOGLvGpLcY+NHkjXa1X?=
 =?us-ascii?Q?BI1X2xD/xLpiQy+7p84YnbWfK3JlDMzwzLPP7eqmFOIGLmCSII+KTjVhVfVg?=
 =?us-ascii?Q?nixZjYZd+Y2IWYR7lXFyRztOI3uXoTpSrbfSt6yV5da1vQmsVAXEuRmKjTbo?=
 =?us-ascii?Q?q1QTkkzJC305YDupgcGCrww4ITtE48hAO5GOJ040NiLAZss3nfVKFy0AMSPG?=
 =?us-ascii?Q?/UkjGlzZfbSG5LF+UwK0/v8bBwe0cIOTxFkXgrr7Ad4jrM+H7vJVYzjvdg5a?=
 =?us-ascii?Q?Lza8Kr3JJGoVEBlSzfpIRUkZOxdzqFQKRSJuwXk9zL+olnT9R9uzffpn//Pi?=
 =?us-ascii?Q?uupObkssyml50xcBUqcAcnXnuaxLuasZe6cyknda11l+jMcqd37JjlMhc0ee?=
 =?us-ascii?Q?hgma21lrdUqz7N4AvH26Mju3QsS1XnRBJd0F7W/COKKtE5Wd46jLh36W3DJU?=
 =?us-ascii?Q?0Ut5nUEV3xfEF70NEUozhID3hu1kB21MKJuXYzUS6TV3B6cuAk1OXiysHSH7?=
 =?us-ascii?Q?fR8WLnkKLc8gknw69ezyH+ryQkHB1/cnqL0Egqt9RfEPqiIOqrRCX0dd63Yi?=
 =?us-ascii?Q?pM8MQod4EyJI2o3CZpoUcEmUARH7xFnaRXtnxLUQYfap2ZKCf2zycE8+jPCn?=
 =?us-ascii?Q?esAePNrDO4sWfpEiA6H+Ytzsh3b4UOMAC7q5NSSizxun/ZWri5xbt+u6oL8c?=
 =?us-ascii?Q?QbHaBVN1J4B6j0mmUpeCBmMQG+Qd1POGk9b3Byix75g+XrQlIzKH7tq9ts9C?=
 =?us-ascii?Q?52bsO/PI7J0c4dp2OSrJQq0gmHEzaSH3MzUfUS2uV8VcSljQ/g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G+9Y+BNte90MnWgUH1PKQX6pUns7EecpVti7rmOmzb8Ab+j1aHl9UK21tHfS?=
 =?us-ascii?Q?giwYwRtg4kdolXBiCuE3To4vIjQ+b89eW7LAo8mRo6QPUbD/L9K2HgdaRMCD?=
 =?us-ascii?Q?rRqfbF8gdMeBGHcfhOwLdmWwmZsriVpkSEeM5+90YYTiIPW5rWNwJcdnBVmm?=
 =?us-ascii?Q?wcx56gULFoYgbf8ymDajahRX123LOOb7HvcvR4kTqKHxOZo/B2SjCfbDC8PM?=
 =?us-ascii?Q?GVSNlCxBz5EEPphrxts6vHZDTtYDbo+HdLtILtYHGFwBgmtDSrFAVl92bdkp?=
 =?us-ascii?Q?U4O2ek0mRgZnBDYxjK/AKMTfJSzvrbaTUEsJNAaLYTocAq1NcKV/Razy+hch?=
 =?us-ascii?Q?CCrRQso6MJWYNRLRZ2r4EteeJ0dONAOLUQ5Nykm8bsoir0H+bq6HcN1WJ1A/?=
 =?us-ascii?Q?KeEoqomthv/ZdJzwjzD1iNFxygEZKmdzFV2sly/nb4CGiEVWKPwsQ9DNrTAv?=
 =?us-ascii?Q?5/ELDs/Pe6lT/qeE+JDM6y9IUPbCiDu42MW4Ipma9b4v0T8Oic4zooTyhwEj?=
 =?us-ascii?Q?nsY5KgYyXps61s3uav0cW7LN584t0gUmJxO9a1axDCs1onj3bHzQXIcxYeq3?=
 =?us-ascii?Q?RnmMwteZbY6DEqG53ci9KV7ThDiMqIFWU3cOLN6vLfbEpGE1qvmEczmTzbFt?=
 =?us-ascii?Q?pmf8zxtoIDS9mqgeHXjorxai+hHoPzYV3GELoOem8YeNExZenGU87ByUSswW?=
 =?us-ascii?Q?skwMxvCTV41iJ4YW+8wiD8F1o/EZTpLUQuzh4OMTgyLCXTeerVgsijJmW+Mz?=
 =?us-ascii?Q?ZPrh5Tvs/0/tImZxf8eL6DIhG7hAbD22GtbpUOZww6GdKJonOloo6G02tW0b?=
 =?us-ascii?Q?LEZDVKjaZLpDJfVnXEeTS4VzST17QvvSK2fQyBeLwfofTyAl24pV55kno3ec?=
 =?us-ascii?Q?d7BGmxemrJVQNJuvgcXCNd++V1qNExkchw2QQX1Rl42iYlXxwoDgjS2saCSN?=
 =?us-ascii?Q?yyjt6OU8L6L3XUI3cggZ8oYiqPJA8IK9Tc1RTfUVWgFUTY8vQ0SxIc6xohYA?=
 =?us-ascii?Q?PEjXYQsv0AGZ2U0lfLKwiPB1TOnz09qD74JM8HiNWqUptdqhXMqTz+S0qWB5?=
 =?us-ascii?Q?MnnPa6Htexl3qEyIoJsXpswRL4bcd323dGIZ9ht5XK7rtUyGOWHPsjLxFlg9?=
 =?us-ascii?Q?4hi5EdRmLMNdm4rPcW9ZkyibEJozOLZTBNbsXuq+VsbEAWef5a1sX4Xog4rB?=
 =?us-ascii?Q?rYLUWzB7kcUwwA2QmWCV+Gj691LGBsttwt/WCPxsNRHNq6oodV9WO2uNyPoJ?=
 =?us-ascii?Q?C/lrM+8me2821EHIVo30kgsc8sdpLNkerA+n1+b2jpFiS6pndZmkzOFdD+MG?=
 =?us-ascii?Q?rdx0kaI4sbiBmb6ksWY6EXcRgTJ3HxSvZcCjR3/w5t6CjrAvdRrQk6A/MDgp?=
 =?us-ascii?Q?gVVuxhhCsCcJMMcZYfbENVLC33jOYvEensPsqC4nMhFTcxz3vlwuzS9ZWLSn?=
 =?us-ascii?Q?sq5WNlupOE+bxGQltCsKervbXzxMz5gpjCt0BCc5qkm9jC0pTNoFtzffoYjz?=
 =?us-ascii?Q?5o+k0OI8GH84GqRBHo2r8rcaZud3sBK23YzMYw3aMbDwlovsRLFZMxdEuLGM?=
 =?us-ascii?Q?OOtfPHWYp1DhiME6P7+EQuuvDqscWPRGodLqG6pGvp9HohN3LlkW1xdu6QzI?=
 =?us-ascii?Q?Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17833ac1-51b4-4913-fa73-08dca53d2b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 02:15:32.2064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vbW1SpbAfCzskbVLAergmA2vorKRAxA3RR9foMjid5+PyonYARq2uG4fR79WDcR0W4ppqhB9wIDgAn15yKlLV5EslYovApbj3omIiLGSD6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

Hello Kasia,

This patch is actually meant for the intel-xe and not the igt-dev patchwork=
. Due to some unknown reasons, my emails are not getting through to the int=
el-xe mailing list. I sent it to the igt-dev list as a test patch to confir=
m if the issue is solely with the intel-xe list or with igt-dev as well.

I am still trying to understand why this might be happening and apologize f=
or any inconvenience caused.

Could you please let me know if these failures are solely due to my patch, =
or are they also being reported on the latest kernel or other patches? If i=
t's only due to my patch, we can safely ignore it.

Let me know if further debugging is needed.

Thank you.
Best,
Akshata Jahagirdar


-----Original Message-----
From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>=20
Sent: Friday, July 12, 2024 5:33 AM
To: Jahagirdar, Akshata <akshata.jahagirdar@intel.com>; igt-dev@lists.freed=
esktop.org
Cc: akshatajahagirdar6@gmail.com; Jahagirdar, Akshata <akshata.jahagirdar@i=
ntel.com>
Subject: RE: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgf=
x

Hello,

Ashata, please verify results from patchwork as our infrastructure is not a=
ble to process whole logs.
Example - https://gfx-ci.igk.intel.com/cibuglog-ng/testresult/1840022997?qu=
ery_key=3D5010e5e29d437861d2c89e0d98eda884b16111d8
Looks like whole memory dumped to dmesg?

Please check your series before sending at least on 1 machine to avoid such=
 situations. Patchwork cannot be a way to test your code.

Thanks!
Kasia


-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Akshata =
Jahagirdar
Sent: Thursday, July 11, 2024 2:22 PM
To: igt-dev@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com; Jahagirdar, Akshata <akshata.jahagirdar@i=
ntel.com>
Subject: [PATCH 1/6] drm/xe/migrate: Handle clear ccs logic for xe2 dgfx

For Xe2 dGPU, we clear the bo by modifying the VRAM using an uncompressed p=
at index which then indirectly updates the compression status as uncompress=
ed i.e zeroed CCS.
So xe_migrate_clear() should be updated for BMG to not emit CCS surf copy c=
ommands.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h  | 5 +++++  drivers/gpu/drm/xe/xe_migrate.c=
 | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h index 0a2a3e7fd402..c3093506c28c 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -144,6 +144,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_de=
vice *xe)
 	return xe->info.has_flat_ccs;
 }
=20
+static inline bool xe_device_needs_ccs_emit(struct xe_device *xe) {
+	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >=3D 20 &&=20
+IS_DGFX(xe)); }
+
 static inline bool xe_device_has_sriov(struct xe_device *xe)  {
 	return xe->info.has_sriov;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrat=
e.c index fa23a7e7ec43..2fc2cf375b1e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -420,7 +420,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile=
)
 		return ERR_PTR(err);
=20
 	if (IS_DGFX(xe)) {
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			/* min chunk size corresponds to 4K of CCS Metadata */
 			m->min_chunk_size =3D SZ_4K * SZ_64K /
 				xe_device_ccs_bytes(xe, SZ_64K);
@@ -1034,7 +1034,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
=20
-		if (xe_device_has_flat_ccs(xe))
+		if (xe_device_needs_ccs_emit(xe))
 			batch_size +=3D EMIT_COPY_CCS_DW;
=20
 		/* Clear commands */
@@ -1062,7 +1062,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate =
*m,
 		if (!clear_system_ccs)
 			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
=20
-		if (xe_device_has_flat_ccs(xe)) {
+		if (xe_device_needs_ccs_emit(xe)) {
 			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
 				      m->cleared_mem_ofs, false, clear_L0);
 			flush_flags =3D MI_FLUSH_DW_CCS;
--
2.34.1

