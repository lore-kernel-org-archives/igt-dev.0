Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D693BC3ABC9
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 16:05:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9931B10E085;
	Thu, 15 May 2025 16:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyOOXnnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14110E085
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747325103; x=1778861103;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=A3kAlxOJHZ1bbeAS1+WjgnM7m8cU/PXa9at/91HGsIQ=;
 b=jyOOXnnRZ0U56bkxw7C2yjvcP6Ip3HJ0Z+I9KstrxjH3VrJfywL8g6jl
 jdIefg749UrKnmw82kAVeR1rxOrIDvdWzXdmOKn8paBH4eEojr7hTuD3d
 WwBWv/i8TYx17F643C6rEyQ1xmaotFqR0XPm4H7ocvXTwUebaOPmjns0/
 vMp6UcOGLgs0C/Wfh/k26LjsLkSIDWUbDtKGR3BCfSH6thzZObmii7m1r
 q8PSaG0BdbnvN1ViX+BXmi5Mb/fUFsvbDJTh0A2mBLfeteRwGfuHufMBX
 peGzRjuzsS8qG6PRKWExjsXp/nDH0w3gF4SET/ff8bN3RO6Jrdgl+SP+Y g==;
X-CSE-ConnectionGUID: ysySkWmES1mLjiGE51D3bQ==
X-CSE-MsgGUID: pe6sbzR+SpOeG9ImRAgEBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59925487"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="59925487"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 09:04:15 -0700
X-CSE-ConnectionGUID: Zs/iT4J8QmualprRFbx8Yg==
X-CSE-MsgGUID: CLTlnpQFTXe0S5QfTdv3Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; d="scan'208";a="143180129"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 09:04:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 09:04:13 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 09:04:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 09:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIWvpAXGknjUHWAPgzRITsYipC5/BkqKY6uTbCpK+U3K7Egcf6ICAoVTix3bvGBUJ7nyz6Pr4kKBzLFXDZ+Fj2g3OSufH4LlE0Athu0eP7/UKhEeCW/ZbUbYTdMaZ8rGsY8e6Dle+vDzOIj2kcsyAeAwYK5nLy4C6IXlp/0ZI2alYCB3gOHH6SE+KWr1bjTG469w3sD3IhsZgQFp7ReGmfJG+5JQUMuUCoMPOe0g3saqz0+l96EFKfSB82uwldeLsOa1sVbgDjixnoCufj1bWQHgUYgNuL8zEvrzEc9+SjyCfp94BhvGM1IboC5XXcr/avsGctBu3jiHmyep9UK5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stFuvr5f+i5LyqbgW+INMwIovMc1NadJMyA0Cr9vjrk=;
 b=IhAtT+U1PgfV4cKAGiwzoM6/muR+0qnQrXg+ZtBwlEZvQPrqUWSd5O9ajBnbPmTcvb73iKK7ztC1J2DSFkeqhzWNykkBI1Bh6QwTznLwSVQICHg/OlKVF7rLl4AGZEi5mkuEAIqxIjRcERZtKsi6wUnu9ZDpCoFho8nk1nj5j4dvtPd2kUVmZ3E2pMW0drBR5r5tyHmcKU3f/uDUB++uTHKFYVnLz1jSPvGveVlUUzfkwB4hJTSZY+SQMzyj87L5TjG9t82dzPIYvDz//Afm6E1RDjd/ViYn8inpVEHBdrmAncmzMzFSTPN7dN2Zi15TdctXdGPjjgSPuhxVCoUrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by CH3PR11MB7769.namprd11.prod.outlook.com (2603:10b6:610:123::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 16:04:10 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%5]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 16:04:10 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Topic: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Index: AQHbxCmADfMK2ABNo0mgF71RLg0F5rPSwNYAgAEbabA=
Date: Thu, 15 May 2025 16:04:10 +0000
Message-ID: <BL3PR11MB5747B3B98C3AB71B6508CFFED090A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-3-sai.gowtham.ch@intel.com>
 <aCUhjArfpwMyRfv5@lstrano-desk.jf.intel.com>
In-Reply-To: <aCUhjArfpwMyRfv5@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|CH3PR11MB7769:EE_
x-ms-office365-filtering-correlation-id: 0d8c0644-6e50-417c-3067-08dd93ca2109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?J5FVUiMvpqkuFrSlgPd+tWbUOVUKjylIvjaZXMzwts2EEyjSAMlNACxJA28m?=
 =?us-ascii?Q?fSHQ42QhCqe5G81Vg05uCfff36f6PNBjgOu21T4VDtrztKo5A6kZe/Lx+RA6?=
 =?us-ascii?Q?cXteddtZ25FeatND6PFiesTegz0KFnpn14y1aHSXW7EF3sKic3UTsxGMRWb0?=
 =?us-ascii?Q?j6i6XW3OaIlJgjQXQXe+MaNtZ9X2aHYk+nd5ugEDYeY+VR9NGKdXju2uQmY0?=
 =?us-ascii?Q?pmy0uS/7Yy/h0SF3kAcp9EphrX7Ov9zxvXM0fWulb3HJXXy9iJ8aIf9r+jub?=
 =?us-ascii?Q?CIhuCQTGn7aSu9Mn0HSSnsoWwaPH6t/ha0K8fR/W4pVCgQP9SKFzkG9rrAFD?=
 =?us-ascii?Q?9Uzmll2bx8XwPk5jPrK+eWa34HBQdHt2+TfMZwrGBvcLpeWTeUyAeZJjuT3F?=
 =?us-ascii?Q?h9lTWouIofXS0BYw6ae/wVBxxHNzLAZJBev/krEKKcDv2Y5OTDpSSlAF3/H0?=
 =?us-ascii?Q?QmILK9UQ8o5vhLjmdjALSPXkCh+RF+UY0tifCpF+tTpliNqhm8iwND/rNTU3?=
 =?us-ascii?Q?wUHloWuwxJTp6OYyDbPD9L6/abgk2FeV853p3dImy4Ret9NLiWyLLbbvFgcZ?=
 =?us-ascii?Q?kKlfWT3awyGwEYO7NBvihOJDe9CVMnUkmi3KhGKkHwLDiy6PeGBxQvzZADfJ?=
 =?us-ascii?Q?lxhsPrr6AFVTaZog4zbsJxbgZZLR3lMvhq1mPzIDDxm7InTNJ8CqLymCd5Qu?=
 =?us-ascii?Q?jHm9aKBamtse9n1BoXcrqrOlqADAEMqnQs+otCczzTOGHNfarU2yg6uwz2tQ?=
 =?us-ascii?Q?AaEvNWaPGzkLmggCx41kJ8+7h7hbuPY29raWapQAFDf9/tR51LSULLlXOyXB?=
 =?us-ascii?Q?KMpFzwcB6rEOMTPxnp7NXqKSIV2ZgA4Z6rMTd6vWu8ohVlY0nLXWhxbujH7u?=
 =?us-ascii?Q?156GRB4I9sP9yxzWGnJKIKuI9188Vx6zJ8ERLDossi2pjdl9y1YivRfq1s1T?=
 =?us-ascii?Q?UCRXFx2G2ZQSZYVueyJP7u6OIxCq95PWUYIBl1eCgo/AAldwwofJwZNSqV2s?=
 =?us-ascii?Q?OQHTaZ/WKBUp8luyywZf1e1G2KF73XPAr8zybf8h6PZ6vGAlF3O6UKCxlpjs?=
 =?us-ascii?Q?HsraiD2IAvwHIWnNMynIQJUtyWOIGXNgl+8VqIph/XJ7Ya2ZLfq91N7XkKvr?=
 =?us-ascii?Q?iqQJmwxj5USmxbngkEfhp98WU0zmEp099jyccAt0KJlkU2jJFGNEoO++FeH/?=
 =?us-ascii?Q?zaz/VIFhNg5F3oEIBvz5TOzJdaOf7OPoGXCBZshFfY0fHY8nJoln9d91T7Az?=
 =?us-ascii?Q?5AmcepCuvE7WlRuJf9eJfQGiIX6E6ePMEvzinQWVNIPn05TQ5R0a7Ja/Urlk?=
 =?us-ascii?Q?BCHUEp6rqHG4lAU6Nx0Tm6Jauvl3ZwJe+veZRUKg98fx/IP7WLzKeineH2Vz?=
 =?us-ascii?Q?Cjdupn7UjZFeaEMp+R7p7thyW0E3siYsqrNGBjnvfAJW2ZzNbR4GEcuHardP?=
 =?us-ascii?Q?1zsVQAlo0u638FwXrQEIhvJhadNOVPadyBWPFdUzJYBISNbPLVy1qoiuYAsu?=
 =?us-ascii?Q?dT2gc/yPzirrnXQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z8Acb0iPXJgw1xh031qqdDGe3e7YcM3PBXbvFbDBv1SnQhsiMKkQYDtt74b9?=
 =?us-ascii?Q?wAuLLOmJiiRGH4yG7GLZ7uPIzTBpxSaS/QWoWNysf5UMd5CWuHJJ1VtJtb2t?=
 =?us-ascii?Q?ujrUGkniD+24nc1ASk/57idFOKkyLIHJzUrnqFfE9A50qaVgkmufEvud/0qz?=
 =?us-ascii?Q?zteZFIpF6RqIy2DzI6xvL5cgTkB9naj/u/SCjuOf2ZBbMumRqMGZ2djBJbJj?=
 =?us-ascii?Q?pq5gOagUg54/US/dQoGvWolx1Vw5V0ob8S7cmf7rTbqT8VdXiSu0o4DvGGQ3?=
 =?us-ascii?Q?AN22oBKpnxpuNNvKAmiPbl/B+SvypQhU7Uc2uTQVd46icE7YWA5dYcdrbSuZ?=
 =?us-ascii?Q?vPCZHguVhxz4uoLpjL2waHAt5Txih/lRoqVUuDugTuyqAdjnirQ1rUt5UM4i?=
 =?us-ascii?Q?N/+JF6Ta/Ybm2MpeXjdT7akEVOAp5WMdgAv/EUPqsvJ++y052xXLvJk62eD0?=
 =?us-ascii?Q?2C+aOiAHafqroIB/y69sxxzjxHZux2zJ9wnGyyKH6DllYUmxFtbeTWJ3N0eQ?=
 =?us-ascii?Q?CWPEHqbSWX5ki1oBS39MAAY2nCVG81Z6PQJWtDvolJ2elIG/VGLr8Gm7wdTt?=
 =?us-ascii?Q?PyYibXTlPGvy6sT5UaWqh3wlnuj4LD2dV8t2oHfEe9JueacJt/XZCZujImlL?=
 =?us-ascii?Q?NhRj0h1cchah9C6AoaUa4Hx776H1HyueaKeDZGBiQdU1NNCqFG3RkJ0tHqEj?=
 =?us-ascii?Q?gHOdqydjaI95PMXxoFn/oggrXHgJliZLM7/tb2TK7iZAfqSa7zqs9rEpOLar?=
 =?us-ascii?Q?JrJQ6nQ7MQytS7YPSP6/11DiWgyJtqC9HjgplVhMC3SK0C9x1rphIIRlz4rP?=
 =?us-ascii?Q?jmf1E3/GKvVgdn28Mji77bX/EQrMZYTVQ4wk5cs3cXr+yGcQdbcifH3XSINA?=
 =?us-ascii?Q?O9rtuJtBntf/u8PGMNUQrz2F01gRzlKcFV1/ZNMhIyS51UVLQQUQjW0xKTVC?=
 =?us-ascii?Q?CcJ3qTjmFZEYYhCXN2xJecPj2xgGDESfMtYDJkM1igwyPiETAsVGue32crhM?=
 =?us-ascii?Q?Pu6kdSChKSX5ytkr14fe7zagZs4G87iz/iU7WCwiOALnQDNWhNDM/QJ6K5KV?=
 =?us-ascii?Q?1Vtj6wz+YG9YDW0EYHSlcoQnSeqSHszJsXBzetAva89OX31VMdER/fxH7RnM?=
 =?us-ascii?Q?VzX8qsSAHsR+7olkTyHp0H3x56MkCmbE5/Y/ptNzyeNcUAYEB4DxryIh6gbi?=
 =?us-ascii?Q?J9IjvSVoampzeIdULbm1tE2ZKmbhFYgIai2xnh9msavLBWIeLhbXHed8PjpP?=
 =?us-ascii?Q?JKVaxzznXBfJcO3/lyB36lHEnxjCOE6Xyl7JPNphKuAeTLq0lpprwDFFXbEB?=
 =?us-ascii?Q?zvlnUmrTVxND0Xq47tjqI5LVOef20LlWfkASHzl1SU0Ghsq+vfQ7IgSk7UF4?=
 =?us-ascii?Q?dPB6bbPM6Y4EZOVsyMud2isA4EUnhVO9Q+hAiRXFMC5h5Tw/Nms4a/mdGcV8?=
 =?us-ascii?Q?upcOXFnWOKrTbXf/8NMudEzmN43YrefLGvoiEZNQzrvgZzYbJE9/cg97hrEJ?=
 =?us-ascii?Q?/EPPjFI86nH2Xn15H+S4Y1UTk7dbJR7QL/I/EUdQtHXjP3dyzvnMx6dCW7Cd?=
 =?us-ascii?Q?kr+5mejScohLBt+o8xJHy0ez5zhG+VlApx9AM289?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8c0644-6e50-417c-3067-08dd93ca2109
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 16:04:10.3328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zuAW/+Y4+l09qWJudvGz7QENFplK++ycaB5sBt7ZPlHEngXzK/rDCCwrTBxi+JHKu5dKPe6XzCap/r+1K+rASCWxz3CLa1C2cVDq7g7JpZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7769
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
>Sent: Thursday, May 15, 2025 4:35 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad
><himal.prasad.ghimiray@intel.com>
>Subject: Re: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate pr=
eftch of
>svm with single and multi ranges
>
>On Tue, May 13, 2025 at 05:07:10PM +0000, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Tests validates Prefetch of SVM with single range and multiple ranges,
>> with different range of sizes. checks if not svm pagefaults are seen
>> while prefetching the ranges of svm.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 126
>> +++++++++++++++++++++++++
>>  1 file changed, 126 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index ba11ed834..c3f0e61f3 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -20,6 +20,7 @@
>>  #include "lib/igt_syncobj.h"
>>  #include "lib/intel_reg.h"
>>  #include "xe_drm.h"
>> +#include "xe/xe_gt.c"
>>
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> @@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
>>  #define CPU_FAULT_THREADS	(0x1 << 2)
>>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
>> +#define VRAM            	(0x1 << 5)
>
>These flags are for 'many_alloc' as indicated by the comment in the good.
Sure will change it.
>
>>
>>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t stri=
de,
>>  			  unsigned int flags)
>> @@ -464,6 +466,106 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>  	xe_exec_queue_destroy(fd, exec_queues);
>>  	xe_vm_destroy(fd, vm);
>>  }
>> +
>> +/**
>> + * SUBTEST: prefetch-smem-%s
>> + * Description: Test to validate functionality of Prefetch using SVM
>> +of size arg[1] at smem region
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: prefetch-vram-%s
>> + * Description: Test to validate functionality of Prefetch using SVM
>> +of size arg[1] at vram region
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-smem-%s
>> + * Description: Prefetch of mutliple ranges within arg[1] size to
>> +validate multiple ranges are created
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-vram-%s
>> + * Description: Prefetch of mutliple ranges within arg[1] size and
>> +check if multiple ranges are created
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @SZ_4K: SZ_4K
>> + * @SZ_64K: SZ_64K
>> + * @SZ_2M: SZ_2M
>> + */
>> +#define MAX_BATCH_DWORDS 16
>> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
>> +		     size_t bo_size, unsigned int flags, int num_dwords) {
>> +	struct batch_data *data;
>> +	uint64_t target_addr;
>> +	uint64_t addr;
>> +	u64 *exec_ufence =3D NULL;
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
>> +	size_t slice_size =3D bo_size;
>> +	uint64_t batch_addr;
>> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
>> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>> +	const char *stat =3D "svm_pagefault_count";
>> +	int b, svm_pf_count_pre, svm_pf_count_pos;
>> +
>> +	bo_size =3D bo_size * num_dwords;
>> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +	data =3D aligned_alloc(aligned_size, bo_size);
>> +	memset(data, 0, bo_size);
>> +	addr =3D to_user_pointer(data);
>> +
>> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
>> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>> +	bind_system_allocator(sync, 1);
>> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	data[0].vm_sync =3D 0;
>> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
>> +				 PROT_WRITE, MAP_SHARED |
>
>MAP_SHARED can't migrate to VRAM so I don't think are testing what you thi=
nk
>you are.
Will do the necessary change.
>
>> +				 MAP_ANONYMOUS, -1, 0);
>> +	igt_assert(exec_ufence !=3D MAP_FAILED);
>> +	memset(exec_ufence, 0, SZ_4K);
>> +
>> +	for (int i =3D 0; i < num_dwords; i++) {
>> +		batch =3D (uint32_t *)((uint8_t *)data + i * slice_size);
>> +		target_addr =3D addr + i * slice_size + 0x100;
>> +		b =3D 0;
>> +
>> +		igt_assert(b + 5 <=3D MAX_BATCH_DWORDS);
>> +		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
>> +	}
>> +	sync[0].addr =3D to_user_pointer(exec_ufence);
>> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ?
>1 : 0);
>> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	exec.exec_queue_id =3D exec_queues;
>> +
>> +	for (int i =3D 0; i < num_dwords; i++) {
>> +		result_ptr =3D (uint32_t *)((uint8_t *)data + i * slice_size + 0x100)=
;
>> +		expected =3D 0xDEADBEEF + i;
>> +
>> +		svm_pf_count_pre =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
>> +		batch_addr =3D addr + i * slice_size;
>> +		exec.address =3D batch_addr;
>> +		exec_ufence[0] =3D 0;
>> +		sync[0].addr =3D to_user_pointer(exec_ufence);
>> +		xe_exec(fd, &exec);
>> +		svm_pf_count_pos =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
>> +		igt_assert(svm_pf_count_pre =3D=3D svm_pf_count_pos);
>> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE,
>exec_queues, NSEC_PER_SEC);
>> +		exec_ufence[0] =3D 0;
>> +		igt_assert_eq(*result_ptr, expected);
>> +	}
>> +	xe_exec_queue_destroy(fd, exec_queues);
>> +	unbind_system_allocator();
>> +	munmap(data, bo_size);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>  /**
>>   * SUBTEST: unaligned-alloc
>>   * Description: allocate unaligned sizes of memory @@ -1658,6
>> +1760,16 @@ igt_main  {
>>  	struct drm_xe_engine *engine;
>>  	struct drm_xe_engine_class_instance *hwe;
>> +	const struct mode {
>> +		const char *name;
>> +		size_t size;
>> +	} mode[] =3D {
>> +		{ "SZ_4K", SZ_4K},
>> +		{ "SZ_64K", SZ_64K},
>> +		{ "SZ_2M", SZ_2M},
>> +		{},
>> +	}, *m;
>> +
>>  	const struct section sections[] =3D {
>>  		{ "malloc", 0 },
>>  		{ "malloc-multi-fault", MULTI_FAULT }, @@ -1931,6 +2043,20
>@@
>> igt_main
>>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>>  	}
>>
>> +	for (m =3D mode; m->name; m++) {
>> +                igt_subtest_f("prefetch-smem-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> +1);
>> +
>> +                igt_subtest_f("prefetch-vram-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size,
>> + VRAM, 1);
>> +
>> +                igt_subtest_f("multi-range-smem-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> + 10);
>> +
>> +                igt_subtest_f("multi-range-vram-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, VRAM, =
10);
>> +        }
>> +
>
>In general I'd strongly prefer the existing test_exec function was updated=
 with
>prefetch rather than unique sections for it. The power of this test is how=
 it scales,
>we should build on that.

Unique section was added just for better readability,=20
easy to debug any issues, However if you think other wise sure thing this c=
an be moved under test_exec.

---
Gowtham
>
>Matt
>
>>  	igt_fixture {
>>  		xe_device_put(fd);
>>  		drm_close_driver(fd);
>> --
>> 2.34.1
>>
