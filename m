Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBC0C61DB2
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 08:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8A10E02A;
	Mon,  9 Jun 2025 08:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRMLI8Zc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495D10E02A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749457795; x=1780993795;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ak5n5nHR25wMJ52gqaPS1BzXCvT34XJyjdoSczBZiOE=;
 b=NRMLI8ZcYlB+Jrbciu2rxX26PxZMS+azSmK5PSLCtN2cYqlJXUnuqq/I
 4MMzSGMvxXoSoOkcbTL192ijpStY52rYwx77YIZoe4SiEHm4JwXdSKpAE
 ugVfERA9vdk5XynedtX+earTV2IPmZXpEVzzBycOyKtm6PMDonXtikaWF
 YiC1zhlJQqb6UKu6NbEtPnvjjICgOyulsqKuOAI5VX1JoAIbA4sNoaO7x
 wLUeoPrSg99zhBhfueZa1w5hWfdsRdmyX/Dua1WyD7/K4KoHbUcfa57fD
 EGczNf5RkNPI1T4EQRgoQCzNe7Lzy4PMlakg5PJfbiI1C8zTresdGV9sK Q==;
X-CSE-ConnectionGUID: MG+HZHx5SjSV+6NY72PV7A==
X-CSE-MsgGUID: GOQxNTlYSdCH8+V8/yGGbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="54160561"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="54160561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 01:29:55 -0700
X-CSE-ConnectionGUID: mzkUtNm0TKq2jx4T7m4AuA==
X-CSE-MsgGUID: vJpc/fJ+Qomw3ekwoa6HlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151602407"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 01:29:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 01:29:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 01:29:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.77) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 01:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U40Eia05tb02tV9XFUufpAK9eQC/6OaoDpcYDtrleBxgkRMLdYo2FnbL3B6/bKZID3+mfqBkDi6+frb42RUTJ54HKqlwUp3aDbh0mQtjh/3gh02Ynqt0976AcbIGyCgswBsJTSGFXd3/6f0WrHN+UCnxZLQNn0mUtEbLsICsTlodlMjnIpxYR7ViIBhg2skoIu6uh8K0zIOSyTltw/F5DqlpPH0tYcUYB3MIbQZTWJBJcvBYnn78ZO1lI+6M+09e40ukmngoHxT8aBNQSEJYhal2ZH9+9N9cVDvAyjfgh+DqkZYev8RuI9Rm4ssV590t7Zvw51J/0fJD9Bymwax6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHcsL3H/5steKyx5XzIFteo5k7bPUnTyef2hVR6yJaU=;
 b=QRN7t9Ve0/fuP2HItmpuGOSCRRhRrOtii67xuTX9hNwVtPhxdoeiEq0lUoepA2TMiFdlawPmlXyVY/of3wtMDdaUKE0waXtz2zn/bmhhrEuuw5aqRQem5RM8mGMTEvWbQwjuTOOvZFLem1jcjvoE2FY+hQsX291QfMPA2V0FSd9X9gSi2kcv8vQOU3+HX9lYqcIqkMjT2lLjPMLXfapTYWIzIL2bZclZ/AUAfYF/bYiy5JoU+zyYrcIeeXz0dZoQHQi5/5390e4EgJbMTzs/AqUan2CGy1/TaRNXdXnPOHODe7//j86ChV5r1TkvZ15+Bzn3/o3qEdXXKUx3S+DbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 08:29:32 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:29:32 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio,
 Daniele" <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot const
Thread-Topic: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot
 const
Thread-Index: AQHb1xHMTcWFEj38U06wHI4qPN9fI7P6gfOg
Date: Mon, 9 Jun 2025 08:29:31 +0000
Message-ID: <LV3PR11MB8695DF2397145A212A0A54C3F96BA@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
 <20250606183519.78736-2-jonathan.cavitt@intel.com>
In-Reply-To: <20250606183519.78736-2-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SJ0PR11MB6576:EE_
x-ms-office365-filtering-correlation-id: 0f292917-521e-4606-2530-08dda72fc228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?NBHrxekmpkIYnjHbj/oS4Jdpm6yS26993OSQwlN3RESGHz25gkBWNm/VMHyz?=
 =?us-ascii?Q?LC50PEX2AJKtl1MA4b4Q1ynidb4Im8tQYlqkZGE7j54nzQAxZSU3ToEG87/i?=
 =?us-ascii?Q?c8Aa9l5/D0Pa4/URjuNb/kVYHFWFGPdHlm+rMwk1eXmWr+zszLgJ+1aDlOoD?=
 =?us-ascii?Q?g6XXD1SFPpis6xuKjyg+wI8sLXCsWqh2eG9TBWYrcFhZs84wOVP9cR/T+VJ+?=
 =?us-ascii?Q?HKFM7U9TNkqKsOWzhZPeDbtTaI5Ebie5K5Cy17k8YNq7wrDDPkN19PNfJDqw?=
 =?us-ascii?Q?Zvh0pF1cSs7MudONkJfVsHUJvdITWYxSC2ORsj3l27Eq8Bp3tF5o/Xyp7G8n?=
 =?us-ascii?Q?1YDVwtpmpNGQY3mstqPcIR/sJ68dBpSsbzFxxzqUQCSnRc1WgOPQw2g3FBqB?=
 =?us-ascii?Q?ZcIzDjk7QqHp4oMOyjo9NUvds/FmplaICfx2D5AYoKefzCDrOI7WbwaZomR9?=
 =?us-ascii?Q?PPEwlIAOxizjCG4+WCWCVaiOTkuofX6GOKeA34cseNCdHGloEg1n73atQaxQ?=
 =?us-ascii?Q?06q56pvT+GWs2LsgdApCtPXQ7TmGUB8JG4TvXQVHFf1LILX1weUZIl1B7xA5?=
 =?us-ascii?Q?Dv+zsbOdWNlQgdCgl1dAZr5dCkoQqdruxd+whhkERrcz+udJHSSDkZ6o+1PX?=
 =?us-ascii?Q?gKO1e3TcGiyrnA3mP/1jsC7RFAlFbHiMBelWYbopQygfeSw9sxiSwLrRlF3j?=
 =?us-ascii?Q?S30G4vRMTQrRLE2/jJHE8T5kwxqqRHC78H4MTm25XNFWQh6EK6BXvQNHKmPj?=
 =?us-ascii?Q?aCogNNui4l0BYtVnwxO7/+B5MhjNgebmpecnccJsLPnmPcNjgLrcWBjg38FX?=
 =?us-ascii?Q?zvPlMCWkae4F8DnpgFPcOOIpu5ohaPiTpyGK0rDQjmgcak3usX6jMhqhPjut?=
 =?us-ascii?Q?+wNyV9HKaJeIEviQj4ujyscn4eX7oJVUsdKfRO7TOBotVU7eGd3N7bw6GV4A?=
 =?us-ascii?Q?+IV0CGm70pOcLC44270+bANAxBdaFqY8oqay7nCBMGuUamDnm+rnfZ40rIzu?=
 =?us-ascii?Q?S+pdbExwX44wkDMpCd0ypQYO9hS/RtQd3EaAZKOPbPiJcr0SyXidDh12l+Ej?=
 =?us-ascii?Q?MgVhtfuLiCDYVCSOFYd6ULf1QKHkTLhjva55V1FdzyATBAieLjHE+gWnrJwA?=
 =?us-ascii?Q?tMRxbVmqmRiaPmUjoAHWkqcAOaNq3yBjqLqFtpNzL+Prixsq41B+u8pDMfeY?=
 =?us-ascii?Q?4HEaneFn1Shu77OtoGWyErn2ruUSdXLS43BkezKIcbc78UDManEXV63/GTeo?=
 =?us-ascii?Q?FHCOF65VJfeD0ScIQbsBhCdgJpn836lxNVEqHSkqGVVieNqL5Q+nCOx8uGdB?=
 =?us-ascii?Q?dCq/87Qhfz29ojLBuYkgkhpSgyJW7zEXwOaKv9sRNt3sMdAf3VOVdOhJxYu7?=
 =?us-ascii?Q?Fa4OMLDcNluZEreBElDt5+VQ8WFgd7DSaKJkywCvnhQRYuCMECHfrjR6lans?=
 =?us-ascii?Q?c5w95XJezZbYjjGoTRA04pnlIj3/VzAm/8I5OX3OXoyRqQKUQcl/ySuK5Srp?=
 =?us-ascii?Q?y8OcvzXHSpX/zqI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GKUXWPS0UYhmyHmapxsTFQs4kOuUxkmF+rrY+GqR8NoLEut2NzbNPnmMAoT3?=
 =?us-ascii?Q?pxZgzbznO/GpP270U9cgUe6ZydWCRLwrPk51C5Dhg17M3xzJGDDPSTvqwvve?=
 =?us-ascii?Q?G76w59viS5ObtnEcL6Ujvl4MGa0G21OL5djuPdDBlnSKzGAniLQm9wyAaZY2?=
 =?us-ascii?Q?P8K5Fjot9P/OTv1SuPht1UChJzbkprZ3Pn6PehY8+yxvxcgkrnbgAOFbnAK3?=
 =?us-ascii?Q?A4GplSw3jcjR/BsEeXQLXazVmLB5i1wE0+8qKFcrqR2QNAoKztnkG//hXeav?=
 =?us-ascii?Q?yXoz+r0Q2H1e0lgAa4kBBTOq2MmZgq8QlhPH1IyxqLW7iZBTUn4P4WYC9wgk?=
 =?us-ascii?Q?r0ttxYVUCkJJNCnKJM5OvZJ2mNIIMCE4xcZb5crEHmofkuL9LJ70O4N0PkMY?=
 =?us-ascii?Q?gTdHmcpeZi+qvGEIFeGOTGT8ih3P5sHttnNVwwPe0Qh2KinSHc8IUClhuDv/?=
 =?us-ascii?Q?XNzyGSquJua+xgUbiZbQbzXhPtWWCuSxpzPN1kiJsEUeT1aV3E36KBMyNby3?=
 =?us-ascii?Q?kS/rKsnVxQTP4SQq+k7GVoXVRLd+dCPLZZb5/9xH1FCLzsjEqBNHDhLmIVUI?=
 =?us-ascii?Q?96e8AUdU1qyubFrOJPNGxnfGi42e2o7bcDYCXVhpdJFTePf+Rooe13+QyLI7?=
 =?us-ascii?Q?0KfdpbPfZaFmUBz0f35m70Y3oMPXbc/FEYkuM7gdXb1hQx2o47kaCtQsvp2q?=
 =?us-ascii?Q?blL7aiRN0eZQLuUFbRRhDsXm/TW4B8rsJoaDI40gdpOow6HVVKYDsD2k9R5m?=
 =?us-ascii?Q?CKP0MPlV0HE9iyIsy7NMKJ367UzJrU5VpKaRMZCImNvFnZwkoyxBKLeH7Ns/?=
 =?us-ascii?Q?FIBuU3jJS+P1CqO2wcmgdv3SWe/1FbqsEi5n9BWOmbTPGyyR9j2aDFd79YOD?=
 =?us-ascii?Q?vwV31mf4uF3pEkQ/ezJ/AzNol7iJQRFvzAY3CyMUJmQcwcyanQV3nWtFH8Qu?=
 =?us-ascii?Q?ykBsKqKNGr4oqDMTHJSUSIuhTVPwOY/5IZdwqiaYLwp3LcY1pI98HHH/o//S?=
 =?us-ascii?Q?2Yh3GQNTUuUehg9XCw3wCE3uoSqtKxA5DDvHKv5fmjep7N0CQW4gwyLjtfOD?=
 =?us-ascii?Q?4IVdM2zVevu1JV3h3dRTUpkyAdN2YrgOQcKrxa/bSOu0ZquFGjBsSoYr81k2?=
 =?us-ascii?Q?0ILFvLvjLlbOC8FdfUHxlbVsxoZFyZQNM9+NuQLUp/pOP+QosZAx9kwjrLFy?=
 =?us-ascii?Q?/7406TBmqIro355dnVMfx8NMa3j8BCYc99FTLt5bEZ+mBu+VpdhjSwLVdd30?=
 =?us-ascii?Q?YFvk0XAlzAxF/5gSAE6pQgsK38GQm2aDdx4bNjlN/jinH27VcoKOwJzSlmkH?=
 =?us-ascii?Q?AFyLq3Gm7mBachpngjqOQAUIjAwZsc2mMAtHjssyP8pzXFDjmpVsOL3pUGVs?=
 =?us-ascii?Q?aSMzDwJOFpWkreUBgseU00pDqAfOyxpoBrdxTbFtvs7tDTISPLap6tgzDgNP?=
 =?us-ascii?Q?akbQJBB+hqbq3xYdezKNv7XJ1Y6Mf9vECpl0PgVU1qTGMLPg4ha1p+JyqaAi?=
 =?us-ascii?Q?DveTkkaJeAlQHd0dwtZX3X2atQl8CQ4CXsRU0b/hrm5ukpPLR5LV/oru1i1+?=
 =?us-ascii?Q?6PG69jViZ+APWWZkUgc6o5w72ltKQzuZNeRIlbCCjw7aCH/yYaEeOU+Tj/Iv?=
 =?us-ascii?Q?QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f292917-521e-4606-2530-08dda72fc228
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 08:29:31.8554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R+Q+At1lGe2gcGd8JpZtY7a8AEWpLwWAvQi5mHtIVQ67zGTttNSW2+kbNM+slnOR4kG03Sj+xMB9La5XE/G4cIcbyVePcwtZWemPDDlrffc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
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

> -----Original Message-----
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Saturday, June 7, 2025 12:05 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Ceraolo Spurio, Daniele
> <daniele.ceraolospurio@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com>;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C
> <john.c.harrison@intel.com>; kamil.konieczny@linux.intel.com
> Subject: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot con=
st
>=20
> The pci_slot string is passed to multiple functions in
> xe_fault_injection.  It is also unmodified in those functions, so should
> be passed as a const.
>=20
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 9fe6bfe351..7a14ad1729 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -228,7 +228,7 @@ static void set_retval(const char function_name[],
> long long retval)
>   * @xe_wopcm_init:			xe_wopcm_init
>   */
>  static int
> -inject_fault_probe(int fd, char pci_slot[], const char function_name[])
> +inject_fault_probe(int fd, const char pci_slot[], const char function_na=
me[])
>  {
>  	int err =3D 0;
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> @@ -255,7 +255,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r
> function_name[])
>   * @xe_guc_mmio_send_recv:     Inject an error when calling
> xe_guc_mmio_send_recv
>   * @xe_guc_ct_send_recv:       Inject an error when calling
> xe_guc_ct_send_recv
>   */
> -static void probe_fail_guc(int fd, char pci_slot[], const char function_=
name[],
> +static void probe_fail_guc(int fd, const char pci_slot[], const char
> function_name[],
>                 struct fault_injection_params *fault_params)
>  {
>  	int iter_start =3D 0, iter_end =3D 0, iter =3D 0;
> --
Why to create a separate commit for this?=20
Can't we add these changes in the other commit? I see pci_slot is added for=
 many functions in other commit
"tests/intel/xe_fault_injection: Ignore all errors while injecting fault" a=
nd this is also related to the same.
Any specific reason to create this new commit?
-Satya.
> 2.43.0

