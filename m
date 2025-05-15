Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9C7C3DA6D
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 15:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27FE10E8FC;
	Thu, 15 May 2025 15:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER/uEGRF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E4710E8FC
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747324388; x=1778860388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G5e+nQtCSdRlpApoN2A+i/ZUCHmtqEb2q8gyEojlm3k=;
 b=ER/uEGRFY/94Xxfk+25bRMSZGcE02NYtfRvF7sTyDNTWEdAFSlHZYkSB
 Msg+PxfofcA/lC4Qbyorc1GOzGDyf4tiZeQGSa1OGRnNrf3bjR4eLf6E9
 M7pbrPRYEqw3YUAlH92Ev7cijhE/rQX0ZFmkSxenA+BPI0L/igQKj0a11
 lHPoVUeiPqXrm+r/tug07zS8kpE2i3aN5kXNj+6iEThhalh4kVoO+fai4
 48/xaAsNEijZxunIXI2jyXFu7F+d1Bo0wQCPL4PIbid+9P3jM0iJSWbVU
 +k2uCi9BboZKOS8d8M33irilYa6lSCkclNKAt/wjN0tG15c6zCO8lVjIB g==;
X-CSE-ConnectionGUID: aoXzAJ9tTCeIb59PWPKrDA==
X-CSE-MsgGUID: +0RY1nuMR8eyVJzZPtFv8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49255377"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="49255377"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:53:07 -0700
X-CSE-ConnectionGUID: 6HYcseI+QLmiCWnBwvuvYw==
X-CSE-MsgGUID: PSI+/mRvQTqiuh8i1B4AKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="161703513"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 08:53:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 08:53:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 08:53:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 08:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxhuVMexEmoSD0i/6OE3kUJs7DlY9X9wzThkpiAg2wISVNUdCjjVfGu8htPt66W3XBYjPqXyrdG5e66FEAdpVLtXC7LF15QlCKCqtUlxh9qiOaTHCkooeTqyaWYIQRiwjaNxrbTowr9d9zilmfUWeszfvnmuQtb/IGos19Zb5Okfe9yzbLxDprpGqUGASK/YmzHvRdTRrpw2ts0ZnyqNwng8y0AVSRDqYnM+kzgQzuXuT5DkivN3OUIOPErep5gJlDz4jKdgK1IVuNxfIEEzE97kxXpyxaBSg8erT7frd6iFuHPL8EPVn1sQLjxDUOJ85O831qyCC1TPfBdWM9sARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KgSKdQCIbE0cObECy4N1BpnDCcCi3bWS/xuQR1Qxm4=;
 b=xAo/cR0SfSIB3H91O8gSc6HN23bekZ23r9lz3cuCKAJeTbFFbHVDlfG6U5XWAd11IhhHcHhXy4ajo2hQqLPvob0Cm0OG4IYAq5GQpP7BSRURdXHjhZXXJDVZ5w6Vl/CjIVRDI7EDll5emjlWq9/LyGGZLZs47+wYFH1miCrYAw8l7QGGqJ7heTubE1O57ot+V2cHPAzR9d3vtwQAslKNPW6oVwwUiZpzw0Ee5ieM7Pv3P7Ep05LjPA+xgqjDDBgrMHFJa0N9geVUrveXBlWrLBz8DNg3nik9i7T8sN+uAuJ3Jwn0YbzPopDMWXYRMocOeinienXdhB7hiA3i03cHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 15:52:21 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:52:21 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Thread-Topic: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to
 validate basic SVM functionality
Thread-Index: AQHbxRLql4SHoYkfrkSO9RfrJCKwu7PSwLGAgAEWWGA=
Date: Thu, 15 May 2025 15:52:20 +0000
Message-ID: <BL3PR11MB57470962F54CBE5F7B1C308FD090A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250514205801.40253-1-sai.gowtham.ch@intel.com>
 <20250514205801.40253-2-sai.gowtham.ch@intel.com>
 <aCUi9V1wP2hy8Ki0@lstrano-desk.jf.intel.com>
In-Reply-To: <aCUi9V1wP2hy8Ki0@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|LV3PR11MB8768:EE_
x-ms-office365-filtering-correlation-id: 8965356f-8272-4519-fec6-08dd93c87a49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NbIC8q7SefuKLQktNWBO8Fk6DhXrnlSexq4qAwEFPyXwGuQz3gMLIqx8f1bn?=
 =?us-ascii?Q?P8tWBiqu9v3l68xiqOs3qLk+9VuNzcrAr3zsbDiXZGw9T+hVaeXFaAQG84n9?=
 =?us-ascii?Q?QlbSPVGEqF3cUb4hNXB/Q+nyqbDKF6szKMya5287KPGHNgV6dqAlrMFyr1I0?=
 =?us-ascii?Q?t4mpWcNTAhQt9Of0s6J04oTvhStUltJYSMV42P6tP++tQ7qdEt9ueeRwUnLY?=
 =?us-ascii?Q?6H6iKHOj+RsOZtjdQ9ydvqUwBIbRdrUAvivgk6PbVczxs6WNlBYfMGy544Re?=
 =?us-ascii?Q?TB7OdFH3IuMWhCeAErV7DBbjOy9eMRbCd+MI+rbCaCH4TPgnZNStMX365y5J?=
 =?us-ascii?Q?Vv06ZJBcOf5YNhL4I3CxKvYmKATbeAZqrBFYZSbB458YDrFyBjxcZNVt88LD?=
 =?us-ascii?Q?E8pDOBy+39fmS9Wl/u7TwYBhYMiZ2rhG4e0Ml+NBG53SuOA6qk86uih74YVc?=
 =?us-ascii?Q?AhR8bdBx04Ilxj891wx2TF33Ibw2xz8qCgKm8Th038LVfr0J+hio/BZ9w2vB?=
 =?us-ascii?Q?xHuccW5k8efa2VySHDSB1Sq/pwGOTcjxrhN5bBhwW95Xn9KTYX+1iJ6ApYnD?=
 =?us-ascii?Q?2Y5j+5/p6Hy01Ad7WCxJJR4nicu1pNP+UrtVEr7d3oIHVExdGjfpznYSq56u?=
 =?us-ascii?Q?65o24lbMPLL/6xg2xvNxHY7wueLc04fozCkqxixT841J7EiOYAlkewoTDTuJ?=
 =?us-ascii?Q?Jujppw714uyzXTvpTYwC/KDsLaqF64iuLqZzZqMeaWtZmymM0eaUBjykBgoq?=
 =?us-ascii?Q?4Br+kcG6rK/WibSAkjJCAm63QRw0AyiELQVUPM2AEZ+Hrj27Oo70lKVtWoQL?=
 =?us-ascii?Q?9PMyhUkO3eV7FuOHXgDo1B/xkiT7DjyH+t2RYbUHsAn9YhwN5ezvQUzPjDVb?=
 =?us-ascii?Q?0kRkps32frc0sZWCIPjGb5vuH3+9vh2KcaZVjzJaKqMwY6RCP3RLPgPYA+1i?=
 =?us-ascii?Q?T5H16vkEB9TZoEPCdM0pJhR4qXauVV/qF64ontWfd1N5M+HiPjKEl4jifA08?=
 =?us-ascii?Q?TE0huRvI1HDpC2JxXoukHMOIIhvPNkDnEQ9VMAHvGT1YmrxzoJkcNtv4VsZl?=
 =?us-ascii?Q?wq73z99PdXaT1fV19CzL44d6l7T5/u6Y23zA+eFnzADmKpay4mHWfBlP3aza?=
 =?us-ascii?Q?gqbZW7etwIzWSS+spYpOcOe7ZjjggV5tpwd1TU6vD1nTL7Rm9taqMyBH0lN3?=
 =?us-ascii?Q?UbmNQWF1DieOpYSQj/nynQQedjM6wL460OnLavqJCzOnR/KI5C1rk+tIcrhR?=
 =?us-ascii?Q?NSUNL4GSe0FUeG5miY8u7XFNdJtkAOhgLYD4bNeuS/QT01sFufRAy2HxDNMe?=
 =?us-ascii?Q?3k9VyMf8YyAN4OBEcdiWMAoGTKyXozR+xfkAjVA8+r8Pai/4/epBDn5TxDWW?=
 =?us-ascii?Q?yYkmJag2yiDGTgaRumSm23Dp/U9VkwIismMh2mqvZ4ybseVablXjsEx4zmGm?=
 =?us-ascii?Q?o7o7ld8Nte71XNDCZ4pz2gO0YXXk4EkczFGS/lAoiyGDR+21JFCLRJh0xuk8?=
 =?us-ascii?Q?JN3NxZ36CW46cvU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XXaesf9tsjOcegdi+enujQBw3NWwbb9T+dgOAFyWgY5VVtXI4wa806AqRuCn?=
 =?us-ascii?Q?gIYCBMBG7gJD0gQZHRCm557YNQjxHBJzZPQhRZUochAHqQKRM1bukdhYKFBa?=
 =?us-ascii?Q?y7fDeM3tnLRluYnfkPKvHqCXV1uShOr0tyOywTW20Jr+YnSjLrnxTR85XzZi?=
 =?us-ascii?Q?A2VzSC7wbXwc7SAZwezmjuObS8oSkdLnGUSs0a5m8HqdfYlQmkGkPm4MLhc2?=
 =?us-ascii?Q?8kTmhHmj5p7bvdMxHmqwfCpBRZvkgooVW4VScGM32gaAVXJpHeaM1Mc9dBiR?=
 =?us-ascii?Q?i952IAv6/9/0MBdw9t5Eo0harYsanfPpSGAlDlc63hc0oe5UqmJlMeIX9JFy?=
 =?us-ascii?Q?pzUVZvm9Sy86SQQNXn0aFRMtSpyhXaDApo34oAIXAgDjYuAjxTsRJYt1zmMi?=
 =?us-ascii?Q?xaqdEUpsXT6aRCiCoCr9ROqtnEZTwY35lWn4f4d8qlprTaEFaOv9c84fLOys?=
 =?us-ascii?Q?SMKw7xenxKhTVdAtaJbPEW0P4oxY1CPIFATmznj2/xLzMKjaoaCH3oeZSPTj?=
 =?us-ascii?Q?gbg0/RkRv7tlWEURkgoLyG36LA+qI2628fISDgPprld961akM9N531Gerqri?=
 =?us-ascii?Q?J4v1H1fMIvHY9jjNmdFnd9UBEsqI2pAPvvQyx/1jcNyL1ytv14j+AMsn9cKM?=
 =?us-ascii?Q?oJ6Ju6oPKzbf+qmUH1gw/i75Co5MVxBJwnFvSJy8sUU9V+YPUhT186DHgyWh?=
 =?us-ascii?Q?N1Gl60oMKISN2PTle15xbB5/mtKmNBWSnAeF76riVKjECs7rlY9xqCAPWEDi?=
 =?us-ascii?Q?xH6tfUKZphBSa4bcAUR6C6YNPOa9ypRb+/DMEXBq2cgUW6BJ49jB7b75zuL7?=
 =?us-ascii?Q?yG4L+vllt2T6JBG/5+9DT42ykAETb9fdFqI1edHCSYxUbfbkB90MHOldSQID?=
 =?us-ascii?Q?g5kGruAISoXaKpKjWlorcQ24sACM+59K6JH4eO4Rm57ou25PV4i/OHCX+3iM?=
 =?us-ascii?Q?3t9yRp3CDbJ08vJ+2oIMgJEG4t5usa/w7AJLmiUHMVwpvXZrhbKA1dKxCywA?=
 =?us-ascii?Q?F208koKsFMpUokidK7poEDuy0BqbGQrcVsSJReMr8HGchIW54cwge1R5SmCD?=
 =?us-ascii?Q?CnR3DslOwt1mrny6Y/ZhBBYrVDNSLpKl7oc0+ZJoeRp+tiN2eJNarIaTS5VA?=
 =?us-ascii?Q?r9gIRR1QFU0YZcimSN5C/Sjo2bnS5ln3SuN1OIkffOzebG67boshK5enj53r?=
 =?us-ascii?Q?5SBKkwzvfa+trkNDb9+xEZaCPDJniMS9Aez3kbgceeh85Zw7zW2bbY1XnbwC?=
 =?us-ascii?Q?Y+qJD9VAxseaYPtA7WFiZqo631jqxP2dmJP+bnzikaoNEIAKL/i4iQDX0/0c?=
 =?us-ascii?Q?7ShbhKj/jWkm3fIGjafOz9YOFcFOamQnKqqUhwauwvKhO5G+jjy7xokHwcNW?=
 =?us-ascii?Q?Mdi6y3HZG/f6LHO/KX9Di3NEWdSWok1h1PivIaZCGjOefHPOaqlW42rF8nkW?=
 =?us-ascii?Q?EuzD+oK097Rf3AuVb1HMXuVZPnKGqtrT/3oL5Tqf4lToVtv1JvQAnJJe3HAn?=
 =?us-ascii?Q?s27aG+4hvpaOdBLkneb4NiSdW4McsO3c/50M8xa3SXjgwk0q90tHL2vbD/CB?=
 =?us-ascii?Q?NIcicgM3kXBZc3WJC2G63U05BXMC8xRXt6r/Kov/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8965356f-8272-4519-fec6-08dd93c87a49
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 15:52:21.0403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CEBFREG43HSeEUFgsFvDUW815HjCsCQIxQl7y/vwcmtiBFWfEgpLFQpLjJeABARO4G4Gs1qZNHCMsDQNzM3mtcRlwDeRXdHUhJDsZJSplDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
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



>-----Original Message-----
>From: Brost, Matthew <matthew.brost@intel.com>
>Sent: Thursday, May 15, 2025 4:41 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
><himal.prasad.ghimiray@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel=
.com>
>Subject: Re: [PATCH 1/3] tests/intel/xe_exec_system_allocator: Test to val=
idate
>basic SVM functionality
>
>On Wed, May 14, 2025 at 08:57:59PM +0000, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Basic test validates basic SVM functionality.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>See my replies to rev1, to be clear I'm nacking all of this series.
>Please see my comments in rev1.

Thanks your review comments looks like rev2 was already in the mailing list=
 before your comments on rev1,  Missed your comments.
Will have a look at it.=20

Thanks,
Gowtham
>
>Matt
>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 63
>> ++++++++++++++++++++++++++
>>  1 file changed, 63 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index 06daac8c2..68bf29898 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -32,6 +32,8 @@
>>  struct batch_data {
>>  	uint32_t batch[16];
>>  	uint64_t pad;
>> +	uint64_t vm_sync;
>> +	uint64_t exec_sync;
>>  	uint32_t data;
>>  	uint32_t expected_data;
>>  };
>> @@ -405,6 +407,63 @@ static void __aligned_partial_free(struct
>aligned_alloc_type  *aligned_alloc_typ
>>  		       aligned_alloc_type->__size - aligned_alloc_type->size -
>> begin_size);  }
>>
>> +/**
>> + * SUBTEST: basic-svm
>> + * Description: Test validates basic svm.
>> + * Test category: functionality test
>> + */
>> +static void test_basic(int fd, struct drm_xe_engine_class_instance *eci=
,
>> +		       size_t bo_size, int num_dwords) {
>> +	uint64_t addr;
>> +	struct drm_xe_sync sync[1] =3D {
>> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
>DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value =3D USER_FENCE_VALUE },
>> +	};
>> +	struct drm_xe_exec exec =3D {
>> +		.num_batch_buffer =3D 1,
>> +		.num_syncs =3D 1,
>> +		.syncs =3D to_user_pointer(sync),
>> +	};
>> +	struct batch_data *data;
>> +	uint32_t exec_queues, vm;
>> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>> +
>> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +	data =3D aligned_alloc(aligned_size, bo_size);
>> +	igt_assert(data !=3D NULL);
>> +	memset(data, 0, bo_size);
>> +
>> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
>> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>> +	bind_system_allocator(sync, 1);
>> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	data[0].vm_sync =3D 0;
>> +
>> +	addr =3D to_user_pointer(data);
>> +	for (int i =3D 0; i <=3D num_dwords; i++) {
>> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr =3D addr + batch_offset;
>> +		uint64_t sdi_offset =3D (char *)&(data[i].data) - (char *)data;
>> +		uint64_t sdi_addr =3D addr + sdi_offset;
>> +		int b =3D 0;
>> +
>> +		write_dword(data[i].batch, sdi_addr, WRITE_VALUE(&data[i], i),
>&b);
>> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
>> +
>> +		exec.exec_queue_id =3D exec_queues;
>> +		exec.address =3D batch_addr;
>> +		sync[0].addr =3D addr + (char *)&data[i].exec_sync - (char *)data;
>> +		xe_exec(fd, &exec);
>> +		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>exec_queues, NSEC_PER_SEC);
>> +		data[i].exec_sync =3D 0;
>> +		igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
>> +	}
>> +	unbind_system_allocator();
>> +	free(data);
>> +	xe_exec_queue_destroy(fd, exec_queues);
>> +	xe_vm_destroy(fd, vm);
>> +}
>>  /**
>>   * SUBTEST: unaligned-alloc
>>   * Description: allocate unaligned sizes of memory @@ -1700,6
>> +1759,10 @@ igt_main
>>  		open_sync_file();
>>  	}
>>
>> +	igt_subtest("basic-svm")
>> +		xe_for_each_engine(fd, hwe)
>> +			test_basic(fd, hwe, SZ_64K, 1);
>> +
>>  	for (const struct section *s =3D sections; s->name; s++) {
>>  		igt_subtest_f("once-%s", s->name)
>>  			xe_for_each_engine(fd, hwe)
>> --
>> 2.34.1
>>
