Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74EC61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 16:38:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8918C10E033;
	Thu, 12 Jun 2025 16:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q+mlfqtX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE1110E033
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 16:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749746300; x=1781282300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yUjkm5Q9UbUxAu/vk4SaSZFDzlcfZc51FwlffALKxXc=;
 b=Q+mlfqtXnNKLK8xkPmSGLOhbZDEHq659AE8a93ZEnaAHU3Zg/hbtBm+O
 Y/9UmlFcCQ9vtZ2rUSMy3zj19K7uzW8GPB8Wdk9QRu9KetzU3ks4uiGtn
 yXqvwzG2l6sMz0MSyujcPBk3BhmPNZGo56Isp+YvrxBcNpSKgTyLrmH+u
 GN1ytwsxiED5E1AY5on2GNxiOcTDvJAmxPJN2hubkFQw5WH18ilX8+/sM
 Fhj0VrNqS2m05OBOsiH9hyhu7XaG/Rxob+Ytp70nGeulW9pHS/DBTJUZR
 bb3v0qcPx4svqK7RJJs7hk/tKL/UDOl/YvdgnUpiTtXi20ay9W16DXh4W w==;
X-CSE-ConnectionGUID: XD/TTG77QDSlufGnkFE23w==
X-CSE-MsgGUID: R/WNotvjSRiT1K7LluzlHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="74471096"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="74471096"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:38:17 -0700
X-CSE-ConnectionGUID: VeSJ7fsKSySThpCjxL2hVQ==
X-CSE-MsgGUID: 4IEgNO0URqmFqn4ZJrqYxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152563149"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 09:38:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 09:38:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 09:38:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 09:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbTyrjQltQFiNoS32H0dNds3K6tQtmedIBWb4CSU6hHMppSPHHSSQJndErFyuuoAnWAZPToTOcEuccNz5/mNfHWmGV/+kw/YIPGMquOEF5UPQIxiINOVJ11vrvHzVNmrKpeK01B3Yq5y+90gKi20szLoRkNjoK0wQXtyLbJS1R4/kkz9zjGV0dOxtx9CN2+i4yV9D5l+VHuPNfo5A+BAFFbZRArFt52Ms0VV8Dvn5CdBgxwHuGAw5BZQYnXTpA+zQXPq4hafRjCCCYX8FBUselfn147pFy+oIwYUeeD3St5STycteHUIr5qqqmuxCLgtN0PevrqWqWS62xF7JafMcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bqzeYXT9w+RrxCh3xxdlzhAcPpwhR3xapJGIg0lYmP4=;
 b=sBPeQGYHpZ6sXkmcSIN46eEZPre0PnNkqCf5OO9QInXjBybK6aQ40DJk36DI6AQLGRkAVVLoaVxjDzO374UPhPU5IpAGvrbAXF1F/W2Won2WxyBPIs+SsJ4IQtg9wSK+0rQULyGRbj75TQ3T+C0DM0OcrIc+6dyMNsFRbRQvfbE72xgM1FR6wK4MgdWbuZB7mbUEKZ50J+2EZi3JB0irr94Na/5+CW0NVd8cxMg2qrMY2rPBh/duqKaCi+N3mSOgJ9kJFOh/m1Xmnl6K4GA4kEb1kGGjwE6g0+kG7tTtgBvQH1XLlRasg6M7wUV5tAl656XyiTeMcIr7cyC+S8qwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21)
 by CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.21; Thu, 12 Jun
 2025 16:38:00 +0000
Received: from DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932]) by DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 16:38:00 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Topic: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
 dumps during fault injection
Thread-Index: AQHb22/h9viASJmIAEutguJAsBY1y7P/k1AAgAAi/3A=
Date: Thu, 12 Jun 2025 16:38:00 +0000
Message-ID: <DS0PR11MB86868FA7D9CBD35DF0371430F974A@DS0PR11MB8686.namprd11.prod.outlook.com>
References: <20250612081524.26153-1-satyanarayana.k.v.p@intel.com>
 <CH0PR11MB5444419E64DD6CDC14D13ABAE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444419E64DD6CDC14D13ABAE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8686:EE_|CY5PR11MB6366:EE_
x-ms-office365-filtering-correlation-id: 652f8711-a463-437b-90e0-08dda9cf7e7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jNfLajn2bGuaR+VYw9Fa6LJNZjHK2XhZPg6MLRUDzASsFUR334+1sq+0TdrW?=
 =?us-ascii?Q?aHZ0BPiPLO9ZTCSyfKpMM378sONYFOBfY/3qj7AczoOpydZFHxZeJ2ZJ2nK8?=
 =?us-ascii?Q?yb5P/GaNWlV+S+wxCz0yzA4aPvb1qxWbFSzE7qxTcbhgQmVgnNodZiRBx8AW?=
 =?us-ascii?Q?iiN6rCjy4ufgljfeQ3l+CqNpu0bk98ifkadAiWyMN0gkveEiFUPbfIfYR7cj?=
 =?us-ascii?Q?TTiMnRXB8cgNoQ6AwJuYcRt329607oFpB3PkequVv2dYDLYoMofKDh/tB1Xb?=
 =?us-ascii?Q?JZhu7H3kgxqeU2aa8NXjyWomxjgidU1cyIHbLATqebJo5DGITZeyStyx2gGp?=
 =?us-ascii?Q?jDfp+Sk8wbTSu/oIG+iXRe0e6n3VXQpOVG79XIBSdrJpyIZJxJ7wzU243+bR?=
 =?us-ascii?Q?XJFRdmferz3ieqn6gwXKY1Z4909T0uCgXwPuoilXyOhKGMoH4+fDJ+WoXeTG?=
 =?us-ascii?Q?JhqNa9Bk3OzVrKBM7epcf2bGfb2Mo92aEZ+AGyX/dl0ERpRHCYcTl2p9bkXX?=
 =?us-ascii?Q?o0vDaQmN4kvb8kDEx0dOz3Md9mCjOBn0nDpKu4b/FNYP/V7eZKWPjX0Ppxoo?=
 =?us-ascii?Q?/XuMNHQoWZwX3Vq6oSfmPsWgs+rCGE64hA8RK/I6eFtZaBd8pr2k9NeSfcj1?=
 =?us-ascii?Q?EwGaJhScBZksDPym9UTxJCv68viakR+04VBJpv7tztr5GyXxUnoTrOSgmDlI?=
 =?us-ascii?Q?8T1VJC0MN3MxFb8O/GXS71zlP/qTFrzi+5mgx/BAyDQHG4M2K958idd1c9R6?=
 =?us-ascii?Q?55As75bi8z7Vm+2s9ndGMbeY0sMR/MtwjvG+UBb4+/QWKVSQYn2nEZbbbWwA?=
 =?us-ascii?Q?8GB4bmyXcwcsjaZqjkYEJv28yuWZkm+snHbWlnqU0PAxpCNTbVfOKPKCCA2d?=
 =?us-ascii?Q?BC++TzDApjm+3a+8EcnbeN4fwqVOvvmlSIkuJb/S53K3Y7b5uQILG2vIlm2P?=
 =?us-ascii?Q?GtdFQvUBGSK97XeMpZ8CNr9RXC8vYUZ+L7k/NuanmT9GouRJcPE1rItsK/54?=
 =?us-ascii?Q?YsLwMuYo35aGrz8G9hAwPB5bHuoRM73pM+L+RWPDrD+6gjGYOZE7bcHHCIch?=
 =?us-ascii?Q?thf5M1LAOskWrCKO4rL5gwZPJUXThGHV48f4WxBaHKvFIzfcGKnWBSR47wXi?=
 =?us-ascii?Q?G0S/jLHE6qe719F8zO/qzQEWpxSeRWMWFxnXgqkoJs4p9BsV8x1bZWLcahbY?=
 =?us-ascii?Q?gz/N32DNWJJyjQeuBn5BRfOTsZKX5YBd1XAsqyqiWCMlTpIwE/zul3gE2V8W?=
 =?us-ascii?Q?PmnSU0gulInIfzQEuAmhQIfpcNfelFw1rsCSTf4/kJ0/0GCL8oSp7S7OvPLk?=
 =?us-ascii?Q?I2G0XhOvepT4+6rNpn9EIVL75NlIb9GCOabr2TCsrFH2gqpdZyd/bQ9HKE7L?=
 =?us-ascii?Q?Kqi4i+l0Ya3G/kq2eSOMqaREBNIu/5o4yq+7ZD8bd1Rfd67ljYnaD62AIq+Y?=
 =?us-ascii?Q?jH962elQ7XA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dCeEAEeT8XtyYkHHN0psXR4T4d25Jbx69CqZNoc81AyFrtKURXxuRAvbXssr?=
 =?us-ascii?Q?dFsyEG3x3V/r2SGSGTf0hwLm0qbZVw6wiwWPr8rBhEnnrrBOTefVKx6YJYwx?=
 =?us-ascii?Q?ITjVItHY5xUPNfQbpMhcIE2Dj+GFuF0QaycesBL+AbMVE445n8gSBqgNnccu?=
 =?us-ascii?Q?5Mp17CbABBFxaClZPXAk6P6bxJg3VWpWWSIf8X+xaUVOehAz6TDUi58Ij22T?=
 =?us-ascii?Q?rOMntnmw8FrKrrvJXPeHFKE57AXbM9DdAR+2+ksRsXne5HI7VAO0t5V2WMZO?=
 =?us-ascii?Q?3H6YL8qX/6jEoLPK7pef0CaD2ThHyjzWqm/C6GgBvX3wDGAtUdxfjgtDijUC?=
 =?us-ascii?Q?AA7QcV7QPwP/T3hYstr4nyNEMf/b8z5JtRddBQ1MoXeE71Un0yoz3H62uF9T?=
 =?us-ascii?Q?mPXaJOeOEKgRCTuS9ommYt7Dx+v9Hpbm0fMzLJ7M8jFEmO2IPcE45cPVhu33?=
 =?us-ascii?Q?9GkN046J9S9d+nFOABvTPT85a8eXxKamtHHbkkRxfTc3ycDrIOaN2gzUF46q?=
 =?us-ascii?Q?glcRHW+xmqkjsYSuppjfja4E3WLBTSdk1AwxxU1eE4QYcbTsy1RJMdlaKJA3?=
 =?us-ascii?Q?w6o6YHuKuxGCMdZuQYIYDiRi8NFCYLnAXDUO7uhocG2uS41lIQyU3yOu83ty?=
 =?us-ascii?Q?UuifmrLFiJgIZ/Kp8g+3hCEJwwHi3sS9+rXfoIgvulHXv6thiZIw/piDC0ga?=
 =?us-ascii?Q?dJVYDBTG32rUY3YswhSmaZm/XAiwLsmLY2U80VXnTPBnnQEDtD4kJrir4xYx?=
 =?us-ascii?Q?o9WZR4OdVLW4XbWpoYD7o9Zfl+TY31+QRP0+oP6LV55spca7HTcm/+clB2wE?=
 =?us-ascii?Q?enfdBNKrMicolU2m5VtbxllB85OqDL1CedWGyJI3Q78rYE0K+zqfq29nJJHQ?=
 =?us-ascii?Q?KOcbIZdtM37/GCyuVsP1oSbmXHY/gh3rVG6kL9/yY3onQuPilblO7b+Ks3lR?=
 =?us-ascii?Q?+ebkoiCk82Y0UJVLKfIEvb4/dH1Vh4XrCzCp8G3pQ9bpw1hqG9Le/zC2Nvtf?=
 =?us-ascii?Q?W+cWt18PCNj1ndnXQ1jvXV3/9QuRYGin2UbvKiBYQBwYVW+7i+Jl7PXfgHD0?=
 =?us-ascii?Q?R6JLYySJdFQmmQwmBWrr8O0ujpf0u58Hmg2jpJPaJF5fSEltvjXwNpzNEnqp?=
 =?us-ascii?Q?NW2sJ/Ejyh4NcT4H3QxLm1jgUMvHLC/ST8LQab+cXh5fJndNBVtnG+dJj51Z?=
 =?us-ascii?Q?Bcn+6Iz1PeCEcEMmfLx7poelNeZZCuqqRt4Ai8O3bYsfGpphiBtWzENRiNGJ?=
 =?us-ascii?Q?7ymyUWNgzW1r6/bc0V74P7WZp7Xkelutpvw9U9PB3MIkHVGq3wQRb0tEO3Qz?=
 =?us-ascii?Q?/DD0CyY1Kii+BBN9m6lSvjumYdGQpoyztGoYXqfD2AEWpTiFlA9OJzoHBBjb?=
 =?us-ascii?Q?8zS947LOWSUTxbsLDRVyA9f9fbtH/3HzEPTgcuY9of6yUHlIGO9zKSH4wycV?=
 =?us-ascii?Q?JRY6EbR9qpAI9u781CrgBc0foE1/LNURBonoY04QqG0fBNgxPBoFXsOKcXRR?=
 =?us-ascii?Q?mGWIxXu0qZjrZtnclHrqbXmK73DNXvybWsSiWY+1Mm6YUptEm6PfA8iI0EMi?=
 =?us-ascii?Q?mv+50LpUS5GiZSJrzUjvw1Lts6alqRJGKN9d4nxXfraanbKbsfpFdx7eNHD/?=
 =?us-ascii?Q?LJv8MKR2vkgOviLoOCts95qZmkbiVu8cksUgfK6RXjfodUTyrKkSQCgbIu6L?=
 =?us-ascii?Q?NiwTRQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652f8711-a463-437b-90e0-08dda9cf7e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 16:38:00.1392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9o1DOYYVUrJZCLDKGCbdD1db00V0XmM3OoyDDxGDJBG1m+MOUy7Ja69+J4ZYxSW15UMKQI7eJgIUN6IsbuQqM3OndRT1Zo18ahuOmjcMXWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6366
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
> Sent: Thursday, June 12, 2025 7:50 PM
> To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John =
C
> <john.c.harrison@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
;
> Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Subject: RE: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Gu=
c CT
> dumps during fault injection
>=20
> -----Original Message-----
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Sent: Thursday, June 12, 2025 1:15 AM
> To: igt-dev@lists.freedesktop.org
> Cc: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; Harrison, John =
C
> <john.c.harrison@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>=
;
> Dugast, Francois <francois.dugast@intel.com>
> Subject: [PATCH i-g-t v5] tests/intel/xe_fault_injection: Suppress Guc CT
> dumps during fault injection
> >
> > When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> > functions, the CI test systems are going out of space and crashing. To
> > avoid this issue, a new helper function is created and when fault is
> > injected into this xe_should_fail_ct_dead_capture() helper function,
> > ct dead capture is avoided which suppresses ct dumps in the log.
> >
> > Inject fault into xe_should_fail_ct_dead_capture() function along with
> > xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct
> dumps.
> >
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > ---
> > Same as https://patchwork.freedesktop.org/series/148416/ which was
> > reverted due to change from XE was still in review.
> >
> > V4 -> V5:
> > - Fixed review comments (Jonathan).
> >
> > Test-with: 20250612080402.22011-1-satyanarayana.k.v.p@intel.com
> > ---
> >  tests/intel/xe_fault_injection.c | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >
> > diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_in=
jection.c
> > index aa3a3a7c2..8245c558c 100644
> > --- a/tests/intel/xe_fault_injection.c
> > +++ b/tests/intel/xe_fault_injection.c
> > @@ -113,6 +113,22 @@ static void injection_list_add(const char
> function_name[])
> >  	close(dir);
> >  }
> >
> > +static void injection_list_append(const char function_name[])
> > +{
> > +	int dir, fd, ret;
> > +
> > +	dir =3D fail_function_open();
> > +	igt_assert_lte(0, dir);
> > +
> > +	fd =3D openat(dir, "inject", O_WRONLY | O_APPEND);
> > +	igt_assert_lte(0, fd);
> > +	ret =3D write(fd, function_name, strlen(function_name));
> > +	igt_assert_lte(0, ret);
> > +
> > +	close(fd);
> > +	close(dir);
> > +}
> > +
> >  static void injection_list_remove(const char function_name[])
> >  {
> >  	int dir;
> > @@ -192,6 +208,18 @@ static void set_retval(const char function_name[],
> long long retval)
> >  	close(dir);
> >  }
> >
> > +static void ignore_fail_dump_in_dmesg(const char function_name[], bool
> enable)
> > +{
> > +	if (strstr(function_name, "send_recv")) {
> > +		if (enable) {
> > +			injection_list_append("xe_is_injection_active");
> > +			set_retval("xe_is_injection_active", INJECT_ERRNO);
> > +		} else {
> > +			injection_list_remove("xe_is_injection_active");
> > +		}
> > +	}
> > +}
> > +
> >  /**
> >   * SUBTEST: inject-fault-probe-function-%s
> >   * Description: inject an error in the injectable function %arg[1] the=
n
> > @@ -227,11 +255,13 @@ inject_fault_probe(int fd, const char pci_slot[],
> const char function_name[])
> >  	ignore_dmesg_errors_from_dut(pci_slot);
> >  	injection_list_add(function_name);
> >  	set_retval(function_name, INJECT_ERRNO);
> > +	ignore_fail_dump_in_dmesg(function_name, true);
> >
> >  	igt_kmod_bind("xe", pci_slot);
> >
> >  	err =3D -errno;
> >  	injection_list_remove(function_name);
> > +	ignore_fail_dump_in_dmesg(function_name, false);
>=20
> This is better, though I think there's a stigma against giving a single f=
unction a
> boolean
> mode switch like this.  I don't know where that stigma came from, but it =
might
> be
> preferrable for you to just break the "false" case out and run it here di=
rectly.
>=20
> Perhaps something like:
>=20
> """
>  static bool ignore_fail_dump_in_dmesg(const char function_name[])
> {
> 	bool ret =3D !!strstr(function_name, "send_recv");
>=20
> 	if (ret) {
> 		injection_list_append("xe_is_injection_active");
> 		set_retval("xe_is_injection_active", INJECT_ERRNO);
> 	}
> 	return ret;
> }
> ...
> 	ignore_dmesg_errors_from_dut(pci_slot);
> 	injection_list_add(function_name);
> 	set_retval(function_name, INJECT_ERRNO);
> 	ignore_dump =3D ignore_fail_dump_in_dmesg(function_name);
>=20
> 	igt_kmod_bind("xe", pci_slot);
>=20
> 	err =3D -errno;
>  	injection_list_remove(function_name);
> 	if (ignore_dump)
> 		injection_list_remove("xe_is_injection_active");
> """
>=20
> If you do that, you can have my
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>=20
I do not think, I am going to implement above method as it increases LOC co=
unt=20
and not seeing any benefit with implementing this.
Let me know if you see any benefit with suggested approach.
-Satya.
> >  	return err;
> >  }
> > --
> > 2.43.0
> >
> >
