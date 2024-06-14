Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013B5C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 08:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C87C10ECA0;
	Fri, 14 Jun 2024 08:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjucLGFe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCAC10ECA0
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718354809; x=1749890809;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=as/Km9aIdqfZMjf6bJw6jyxYd8NxJVBQtyfclpiJqwY=;
 b=QjucLGFe3W21Ly95anrS8g631P2EMidQCaH98WuweRl0H/ePZAuT8yOt
 c9Np7nmp2iTQMaWr55kHeEZGSup0wdfBJ92hn9RlpyyCGFfyR9tUPY1A5
 ae/hGv135wUFX7lYjKA7yItEDkcwq41HZXmycHJ9aAfyT4JJQtmAF2koP
 wdBYQjQMeTeo+fGo5+kAy3g+3R8GKLC6rQEdcuikihX8KtCSiWpoVWb4S
 fmHI0sfDs3e/zbX6bYWdRGuIO1qgyolEfMc6cPWoPtgf1Kh8f/1/rxDyi
 wUdeeMD3d2W+qrp4d1pttIHXmIXGp+aLqmN7utxPWuNkxZ+pNSaczrun4 Q==;
X-CSE-ConnectionGUID: SNcjunx+RgODfJT89Az4cw==
X-CSE-MsgGUID: 97n7obRoQRKhSVSc85yVDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15062830"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="15062830"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 01:46:48 -0700
X-CSE-ConnectionGUID: cLsVI1xpQmWq2bLSdm8V5g==
X-CSE-MsgGUID: vQkz0eoaRQeITBdVUbvhTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="63640799"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 01:46:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 01:46:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 01:46:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULeG39wGjH/SUAuCTtlpx2ck7PPX+vgRMshgZJ41pkvAEn6fHe7UdtwBQ9Ql8r5oA2ntpI90t1iUPkeuTWX/48xwUOsSkpc4yl/nqYZ3QRbgZdhxpcGndIUkxyowgMU3FEeVnTxN1m+0mti1+2u2EAGZHqvcoSyP/EGNabcxZVmf/kbrVY+XWyp1fpeWBTcYCBgaPGM7qoL68LIBCY7h6MmlRn1ve/WIa+ADH6VLzm0OYuSHRZD1iqoMplq8D26ZMLlDU6M4AQ6CKkO5hIQpID5dqkd9h6M0M3KNiLZE/QFhqawbdK/4Zf/dIbcB+XTzETrVaUB0vipLiJ7L1Csr9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+diWubIiW5koLpQCtKOWHvCu8BtYByqKsvTkWS1mDJ0=;
 b=J90B95BzUoNd2e6NaAiNHr+0ppxvgM2yTKq1iXTKk5NWoPYmuhiCPdZ8rksH/HjjBkm91JM8X9CCE6/O/W9pa0iAwCKI7KQBj6HyR/RMwOzYLDCrmWq+hj8R4NrWEND+e+gn/MB/TZqTKC41a6ukw+zhngCBKJml5ZVSaHYkAzKLULGwvhnc9mMiImliD2ujbp0MEuYNng7tvIeaWF68s5eiQWkFeuv6HKiTJXi2asp9G5zCfxAkIhmrT1Ez1gjDwBuX3qv6lpTE5ax/TiT53A36/Mpzbl5GKk40ctWr/2BGQuL69kPAsOIRDoq4ngaE7DrpKjvv8Yd1BrBmBjWwDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Fri, 14 Jun
 2024 08:46:38 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 08:46:38 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
Thread-Topic: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
Thread-Index: AQHau7x+fckaRsM+i0KLYbCZXJ3uxrHEAGPwgAL2ytA=
Date: Fri, 14 Jun 2024 08:46:38 +0000
Message-ID: <DM4PR11MB63126DDF88CFDF562607A1B790C22@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240611045348.3727239-1-bhanuprakash.modem@intel.com>
 <20240611045348.3727239-4-bhanuprakash.modem@intel.com>
 <DM4PR11MB63121A1851109AE394C871E290C02@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63121A1851109AE394C871E290C02@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB8551:EE_
x-ms-office365-filtering-correlation-id: 0e4088e2-c0fe-4421-7aaa-08dc8c4e817a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|376009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info: =?us-ascii?Q?EISim/tfBhrruQVXU63LkcLaVeIHdSwFSLmc4/1m4HV7kfT1+7THcgDDXb/l?=
 =?us-ascii?Q?LN/EnhBRC75VJHNwvRtbiOZ+J51czykPsDxLlHjks7mv7w/ElpsRon1n5Msd?=
 =?us-ascii?Q?jFFEtnZs29kG5XA28oeMnlzXy/Be4l/JJi+3UFZf6KTHtvWH/MNgRnEI+Kbc?=
 =?us-ascii?Q?/LJVWRq9BVvCWneWgvpkHdnKUC3ShoVHHX1aNI4bLn86+rw1C7mI9FlqrZcH?=
 =?us-ascii?Q?kwwnHv9R7OfHrdFfHAFa8O4PPNs+l389fdNOcFoy0+Gl2TfkhhqYJ0w6MZPN?=
 =?us-ascii?Q?8l/JGLmfIafHcMyUH5y/6uowPQmNn8vKDw5/PGHcqwuHOT6gIhCny8sJsWqE?=
 =?us-ascii?Q?U7vQ89JsffdtQLK9AHNN6JWv0krePRMi3i2VrhGLJyh4X7/LM3YKqYDoCqhX?=
 =?us-ascii?Q?2pKaqbVvulmMqxtRK4QYExGnd+1Yx0LhRt6INsZAOL6kvOGccwTKExJzu9Fn?=
 =?us-ascii?Q?mo7kWZkrxTFhyncVY3ljGsOBywLoh0g5F/TPK9/dYDw0zZYcmdm4bRLxk/7i?=
 =?us-ascii?Q?n24JOCMo9soEKrdAt9eo6R7g+RTqLgRJETPPHq3Aw48kfGHwXSmvLuB0Xox2?=
 =?us-ascii?Q?l/i0VQ4EmoW0/npfJq690v0CGzihsXtIhkzFuisgmVPOlme9icNTUK3hIof0?=
 =?us-ascii?Q?RiauLA+iSF7uW8Rd2Khq/WigwbIXeLpTHUNiZLUgmBPviQVPUMOv0h1Ih/fB?=
 =?us-ascii?Q?uFPWNTh/UM0TOQ6KwzEi8bP7zeOn6vgYGSVz55sby7lIBIUsIGY1R+jsdFmb?=
 =?us-ascii?Q?geGh61gmd8W5kQbgYWylgBKTCFY+4gwLEu+kcHLLFLwQ7159buUuZ6Z8t2or?=
 =?us-ascii?Q?Iw3FT4zEIsFfg3Mg4E7hZ2dPMyXa+dPNymdaQbfe4QnyJ1mbQElyu0okRark?=
 =?us-ascii?Q?BLBd7p5Scbx/NtXyPfLkxm0sdtmvPoxfSUUV6NmAxv6qKX5BjTXJykXDsGxO?=
 =?us-ascii?Q?nqAIUGnlzVqCnbk7kH0aONqCZfWtm167rLu25nIURJHdihh5T0MfDYfiBKFN?=
 =?us-ascii?Q?BXIl5pS77uOqp15RT60WWLYq8f415teLof1PI6G4r+3iT5GCfLBX/BOWHsyP?=
 =?us-ascii?Q?kYnS6uokr2gDv3QqQnABSAGL57ccT8J5pu7U5oG85sFmUI+epWNRuJ7nW4uw?=
 =?us-ascii?Q?+qpCXUBgJR6D4fGSzNRBnmEAQTc1NNkgKbCi6Fn948cK1KNe5/der7j7W7DQ?=
 =?us-ascii?Q?sShwr8flW9BEyWHn41OZ1rRU4o6evFCzXsdV3NDUdwDgWMI3HsASseHYWMV5?=
 =?us-ascii?Q?LgIXL84ED7Us+6/HCjY8+K1xwIoIghMZhwbbvoV6Eo9JuEEQa/xv5lO8Krq8?=
 =?us-ascii?Q?WIiPtdhZlM5i8+q8m4jTNx+Df7ne9/WaiVT4045X0G1atebcMbOwqHC5z/U1?=
 =?us-ascii?Q?LyBX5tw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fEynuvK8TLZLk2hg2jd+C9z7tCWMopxGeAcyFYgWJ5atBYhmBPVqI9/sOWXl?=
 =?us-ascii?Q?prrEJhrckfSnMXAK5+hyPB+3//bzw/7BLmJLEAsNn7SgxgETtSZWVGdunZTr?=
 =?us-ascii?Q?Ue+Y4QxVWecsYI5DXMAeRxi9lIZX0euNZBaQYBrxVp7+LvKO7jjk9bivrC9X?=
 =?us-ascii?Q?5JOnnJeHvyrHT6J4TNFZycpBDWHwQZ+Y/K7eiu381h81A4AiQmPwnFRlK7hs?=
 =?us-ascii?Q?jvCV1SH+H0uZ0pZk/TZutjxnTMFzUrxMI8599Kc2BozE4HxXLwp091k1hKYm?=
 =?us-ascii?Q?/C2C28ntWiYcuXX1nUrSUpFCQ+4Qi0kDcQk6EzSkMEp9GYNCpZtViS1MciWD?=
 =?us-ascii?Q?S1LKKioj2TdgSUvrm2JFfhwV/k28hmZ8YZwifEnqNgtgjwHPhftXGVv1lked?=
 =?us-ascii?Q?yGl7jqoa1m8Q6DcRJQ5wmmB08kpRSoj8lZpZj80eaigtPCX4YKzWD9A8YfWJ?=
 =?us-ascii?Q?6xSD0alaKg/g4OqPHFjF9dpeqEUQJhy3H7sbCHsyr13W7U1nEKF/HHCsqyAV?=
 =?us-ascii?Q?R6/Iv7h6lZZN0qUvyloiZOFLoQWlQCpJtZfxOsuDUAnk4F/KXTFesHLNSihB?=
 =?us-ascii?Q?g+GgVghi7zvaMujTpQDeUj1DTWDjUH8xXEaPS+ihPprNX5M6LWm14YSisqfp?=
 =?us-ascii?Q?v6m1rRoNwjJW97jUh3ypMNWBmzQqPxV027nXJzgq8rZaHf03waSUwlbS9daA?=
 =?us-ascii?Q?QlQ9fgXe7EmEVYxdVhvoibSpFISxR0Y9t7iNVuorekgReJwVkvOwIW1jF0lR?=
 =?us-ascii?Q?ELAzfd1bTqz974iXPpytz/FLNU4+xWmuW93NfxAx/WT6s90hk5FFyZCrjHNp?=
 =?us-ascii?Q?cRwZ1QgZ7aIN4EHZzaFmbLWmHPpLcwTBNgTe8pgrHF5i9roDF8jCx/HQq3wZ?=
 =?us-ascii?Q?CXGacxGZEfaPE3CJpbF3+NYi/Dud+odJlscvaDoLfp/5QJMOEpVLEIaOIqda?=
 =?us-ascii?Q?qmpgPAA20C9B75qybgHWx+uXEqF5lRPOcLlXynTms6FUrlGPxriYnNpt2wxe?=
 =?us-ascii?Q?u3QrubrDsRR89hyphZ5kxPqXfqV0EuSXEb2ue2HEa7KwQZOjCBO5PaPhIjD1?=
 =?us-ascii?Q?pe/AxK2A7oXMuCgHO8BzGyQSyMLHBbJmcldNHRPYYh2m7ibsy+AXjyXd5uRN?=
 =?us-ascii?Q?xQnuy9vL0nz6A9fK5nvMIIdmzfKXlqfTpCmFh8jjXdFASA4X2MPtSlCy181j?=
 =?us-ascii?Q?aitYnJE49XzgHfXd1SaaGVDRQGyPg+GDOtMYTo3MT9M3jv+7eUQJTCeiSSl7?=
 =?us-ascii?Q?I6Kx/JGGSa3FTApBqbFk3UiPw3eYaf5uqjysbeLw57di30/k13vBnGv/co1s?=
 =?us-ascii?Q?fShqi/xnVJdST/5ifdSdCMq9WC5rzq99LRgRY6KIqRclb51L79CTix+9mHNK?=
 =?us-ascii?Q?xAzzkJ2oL66hzfNMl5kqqQSekw9Flcosjk6j+U9gnaOBMwqCl0Ld57Ba4QZI?=
 =?us-ascii?Q?fYQJGDlLyXsR+RMLeJBtpLx/0nkPVLA+kHn23v+PRq5tTpwCDmW2L7afjAr3?=
 =?us-ascii?Q?ojtA7jHkEvpE4jy3cr/hwwNZeEz7IjfHSeB2RIBP+PPgSS+IQ+C6d7JdM+LR?=
 =?us-ascii?Q?wum8DyfxLpMPuS0UbMPI3SCpbJ8XeF6tZ86Bw1sg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4088e2-c0fe-4421-7aaa-08dc8c4e817a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 08:46:38.7167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ybt9EXk3CT/xQiBEA0RiFILno5agP1q22Rowkrj9/EieIlsJOPjhOg5KqE5pYvza3h7H/If7k6mirZDjIHsgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of B, Jee=
van
> Sent: Wednesday, June 12, 2024 5:01 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: RE: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
>=20
> LGTM.
>=20
> ACK RB already present.
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Bhanuprakash Modem
> > Sent: Tuesday, June 11, 2024 10:24 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Subject: [PATCH i-g-t 3/8] tests/intel/kms_pwrite_crc: Test cleanup
> >
> > Make sure the below points in IGT cleanup:
> >
> >  - Sanitize the state before starting the subtest.
> >  - Clear the states before exiting the subtest.
> >  - Update existing libdrm APIs with IGT kms APIs.
> >  - Other misc (Ex: update deprecated APIs/macros/enums, FB leaks
> > etc..)
> >
> > V2:
> >  - Drop igt_fixture form igt_simple_main
> >
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/intel/kms_pwrite_crc.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/intel/kms_pwrite_crc.c
> > b/tests/intel/kms_pwrite_crc.c index 12add5da6..338c92c3a 100644
> > --- a/tests/intel/kms_pwrite_crc.c
> > +++ b/tests/intel/kms_pwrite_crc.c
> > @@ -125,7 +125,6 @@ static void prepare_crtc(data_t *data)
> >  	igt_output_t *output =3D data->output;
> >  	drmModeModeInfo *mode;
> >
> > -	igt_display_reset(display);
> >  	/* select the pipe we want to use */
> >  	igt_output_set_pipe(output, data->pipe);
> >
> > @@ -161,7 +160,7 @@ static void cleanup_crtc(data_t *data)
> >
> >  	igt_plane_set_fb(data->primary, NULL);
> >
> > -	igt_output_set_pipe(output, PIPE_ANY);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> >  	igt_display_commit(display);
> >
> >  	igt_remove_fb(data->drm_fd, &data->fb[0]); @@ -196,14 +195,14 @@
> > static data_t data;  igt_simple_main  {
> >  	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> > -
> > -	data.devid =3D intel_get_drm_devid(data.drm_fd);
> > -
> >  	kmstest_set_vt_graphics_mode();
> >
> > +	igt_display_require(&data.display, data.drm_fd);
> > +	igt_display_require_output(&data.display);
> >  	igt_require_pipe_crc(data.drm_fd);
> >
> > -	igt_display_require(&data.display, data.drm_fd);
> > +	data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +	data.pipe_crc =3D NULL;
> >
> >  	run_test(&data);
> >
> > --
> > 2.43.2

