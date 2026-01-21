Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A05AD262B2
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 06:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB2C10E6BF;
	Wed, 21 Jan 2026 06:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SjdTK4KL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523CC10E6BF
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 06:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768975883; x=1800511883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=62FEL3aQRKK9djkHr/9XMwi/rCCrTSdFKn5Mnzqg4a8=;
 b=SjdTK4KLLdB/y/9XIW3H4WEKhmRKd3kqRVBFLlz2aZu4Nm2zSR4Aa7CA
 LS8KOwPq+meAGuys8dFuXOs5UO3e22T+z5ufmCXi0PENLLKGUUrfp1aTI
 dPJNUiM2cG3UvYC9F8HNRdx1IRb7PZcKBKqst8dFb35eIOfebZ5KMC76x
 2gLKyyBFXZLfF4rHv/1oRzYTgOKQBq7PgC11KHgJQltNVu9mS+MLcjv6+
 CM+sJZXPKAOIYZfF9MFzY93e9eOxgfi+OFe0HrsY6kF2HCH984qrWFs0W
 VsQI7R4fj69AuERJEJ0X69IT0O8o8xpbqmlMEvGoidpPikDfFhR5XIpe1 A==;
X-CSE-ConnectionGUID: vvu+yo03SGql5lT1OxWvfg==
X-CSE-MsgGUID: zsjgR3y8Q4Ooz/3CviJSbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70108070"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208,217";a="70108070"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:11:22 -0800
X-CSE-ConnectionGUID: XYrbT579QA28dAqGRMi0vQ==
X-CSE-MsgGUID: dQ13Ep6/TcC4ZS6+uevFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
 d="scan'208,217";a="205983371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 22:11:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:11:20 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:11:20 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:11:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJYm4Ht6z48MOsOQIzPZBoAuhQ2ABJdmd+rAUldalXdaOGrEQn/5YsWlZyO6QzekKzINer3scj6uXIItGHY0whwo+4HIUW/v+Hzj48okhoZgK9t2ZNnHIXsOXacbocw8Jpwhq2loprTs/MZWw/0KpRxaHm7M7HV4WTAhxr/LGnXBA/16C7leqW3PBcC91yYrelr98QlaaulQ8Hlxc52I5sUvb61v3WRJ/WJpApX+sNADYAnhla96nw+XESeUKPykWIOQfOf1/UioCrbyc+J6s4HcAPOdDKxGdj+rHamnjYvJauf+TQ0WxpHopyakWOnRuXMYAbUKwunGxkOTPGKbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxC9Sjnby3SDvjUefLoPfqV11T2fim2j+OJxdky1+6Y=;
 b=jF1JwjtDwE6tdJUolu73ThgXizY2thhav9aD8rl2YKNRXgIWitAbV//1uwmtDIm537gkbeZbHzXauLNs5tr3lGqRrobeKi9Fx6pqQ+25GudNbYLQpW+E8qkAIkeFGQ9W82j4Jst4oLWjgw48xdE/wiNHXvAZqOefZsSEbgkHwHqbQ2A7Emn46azQYzAoSb+3Xf28QnGO3awkPSOSWC57HO5QCbW0AMBUelt506jWcbjBi+AdPrpzeg/vzQKBl6jLySmY6btgZd4jay2aibJtBx5GxXkqAZ0olu+Cfy0SFFUbIi6sA7bxEzuHGcUS2l8V7f8H/nbgEaWvhE6ZeDqAig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:11:15 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:11:15 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Santa,
 Carlos" <carlos.santa@intel.com>, "Badrappan, Jeevaka"
 <jeevaka.badrappan@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Topic: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Thread-Index: AQHchTAmGZobl9qsjEqU6WPrCWHrl7Va8jsAgAE7rQI=
Date: Wed, 21 Jan 2026 06:11:14 +0000
Message-ID: <CH0PR11MB542705A7E32C0BA28B5F399C9896A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
 <sy2d3ljcgissrqgexvvgkzmmtwcypbl3revdy3cor4q2izh55w@atgzhvyaezj7>
In-Reply-To: <sy2d3ljcgissrqgexvvgkzmmtwcypbl3revdy3cor4q2izh55w@atgzhvyaezj7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS0PR11MB8717:EE_
x-ms-office365-filtering-correlation-id: 4a541e2f-cd89-4e8c-4fb4-08de58b3e23f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?n8unUjsLOBAwseFTXkZJ0ffjz+peEmPhs5WtW/tOITOEnKGlu3LShvNpem?=
 =?iso-8859-1?Q?RnOYdXL28P/0I+l43oCB+d4VcgfovWJlNAcTS0i/narybxI6q5cbRWYo5T?=
 =?iso-8859-1?Q?XBl3UitteIojWPP4KgsPY9L+vTL2d4tghVsaIioK87L9PTpbb3yMsNmSBZ?=
 =?iso-8859-1?Q?i11F30mJ5mpOO/LL6vsENX4gk0q7f369IPIUwuc9OTNwzmBnk/ORoRrJ1C?=
 =?iso-8859-1?Q?4Yj8MissTn2Vc69PK3ghBSOC6rGo8/6N3uUwskdlGSE8HZKQA+qT7v5ymA?=
 =?iso-8859-1?Q?EEjALC0LhjMtmfkDWbw/zkQEWpWe0daI8RrLuh5l4oSln70R+tXleFFeqL?=
 =?iso-8859-1?Q?LWj1frF8vsE+Qamh3SBxkD6utZXgVoc3+8dtMWWAJRxPIlplr+XSJGMaXO?=
 =?iso-8859-1?Q?D5OZiK4AVSuZf3Ky6nds7ALaUP2vZACMcL/18efkTxUo16M4Z+gIwTE+Od?=
 =?iso-8859-1?Q?uJmeO3UE66dho1dh7HzJ7YniU91FcBI+XWdeFeDpQucPOy311x6FHGs4YV?=
 =?iso-8859-1?Q?cuoVcW/ru53ShJ3XnMt4JVeZ0l84lmXeh5UZDm+oEHfOhf+7SbYS1nrVGN?=
 =?iso-8859-1?Q?St+viKr1eZ8RyuMlCwlRzRZZn3SGGDRz6Av7Z1CnTbvvoOMNYQ/9u6Ft2e?=
 =?iso-8859-1?Q?GuCsD+7jcrbiZLjavK6e6GDlAxngCaw1+IA5FWFVQfxgwyTGpbTBuFeyGN?=
 =?iso-8859-1?Q?TJY9U7tLZuXZG6Wgi+5JQoyDmXw0/bObB09DMdXXP5gUj9E5H0xc8cLIem?=
 =?iso-8859-1?Q?NGr564KK23f/Z13LivVQ0plbu/Mp50raOydXEhkeYmdCrUXRj/eowixzlZ?=
 =?iso-8859-1?Q?texBLh/ILzBgejuIwNC4Yv1hSY3Bx4ouu+neBo8NH1eubJlzqZqccEljxC?=
 =?iso-8859-1?Q?9cReIntdT8+mPRvDY/Ec2Zw5fvGZaric+EOjJfLogvl5xpsugWuODootdG?=
 =?iso-8859-1?Q?G3wOfJcDHUv5Fp3dOw3CdYo5dO8sf4iwU4+Af6iduaP4Jhpt+TZYThYVYW?=
 =?iso-8859-1?Q?w6rPvYb2RNSy/da8D4278ycOsD0hcmPnmcfXA5PLD38LEUHYb9Bbl57Isj?=
 =?iso-8859-1?Q?dQAwNgq3utTgAwBPDihgshKWt1wvm+gtEeKdDduyNx+5QLrviMwpc4WZJb?=
 =?iso-8859-1?Q?yT9ve9b3yH0Aj81DWW8/4rCIxnnJ8C2ZBk1ihQqveVX//qGMkwQAuWaSOo?=
 =?iso-8859-1?Q?16KFWoZQc/LROPInA3lziI4bLzG4vB6snbidY8keZXaHwhStqDB9tmyET8?=
 =?iso-8859-1?Q?Ku0HgqAJe91jFrTXNOeDC5edgfzAuAbOY2AdgQx9oHyfNS0/TqD/UPxQbN?=
 =?iso-8859-1?Q?sSV59/P14XkbRKq5eCbQE9lUz41/w+v7+40vb0GygtMbCfrWvms+dYuCsU?=
 =?iso-8859-1?Q?beX83bFoAQBhw95jz5BqgTf1QYPNX4t7w1gwSNwXs8qdESs3VasirG8S2I?=
 =?iso-8859-1?Q?AuDJ9OwfGSosTmqw5s5hOBa5N8TiGblGmsi+hVS5A3bVsUjGtHBh7M11aC?=
 =?iso-8859-1?Q?nWlHuZ3nO62sNK54aJG0NnfIYv5zuVKcMSf/l6xhIDj6KJHMe6JZZ5ozyS?=
 =?iso-8859-1?Q?rsPUS8gPDqcIibWUPqHvJC3iq3gfw0B/Du5oVdcXJGHPbpkaMmUN6Gd2PF?=
 =?iso-8859-1?Q?EY1Ixp+3JKhMKhvOmRj4rHz580xir2e8H3uSY08yr8HTK0P6jAsujI9Ejk?=
 =?iso-8859-1?Q?VD0xpNqkwJ3jdCjtmQY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mRoVUWuQQoXh1Qeu4L2cxLDhsMQncs0nsO82dos8W3IT1TvqJrKToemDcV?=
 =?iso-8859-1?Q?AWejoyihJUbkIFv1zis6JOhyLcE33/b/JALF3j3eWI9Yy81xaBzvPwCVYC?=
 =?iso-8859-1?Q?WJ6+tGUWEMR3IR8q7snOgViwjiH3tllNFYjq7JQzKJSML3vJ7YYMhpWevo?=
 =?iso-8859-1?Q?y28KCDzqvdcUDNDAdEnIgL69LHvmydBZjcCoI+ezYUww3d0XcCc7ZsE6Sh?=
 =?iso-8859-1?Q?rLv8EOSXtWo9aDIgYaA6oAeS2K7dxhhgu9StzBChyQdWsn/Fsh8AxripAP?=
 =?iso-8859-1?Q?DX18uxybGoOa0iw6k+f7EIQmOLR1iqtTFO9U4/Hh39D3n/VWfOVNd4ASVI?=
 =?iso-8859-1?Q?u7VAPTBEIJatUr/yjQUgn4Sa62JZC5xqh7cCu124wXHXyEPdzXeUxY3BMd?=
 =?iso-8859-1?Q?+9dbSx3fHbXIltbNM2ali0Noi5EYOCtyn1JyjIrSbzgk+3Z5bW6g+nD0Ir?=
 =?iso-8859-1?Q?BDGkY0AvkEgAQi9rjCZElAPgKQx8outkJZLxT7jA3GbUWF5OoufNPZe/QM?=
 =?iso-8859-1?Q?ysnbQSNbkn1LX/VJmPwU20ZXjE3SZRp3JBm57Gx0IMBD9O0yvEX1a+V4kC?=
 =?iso-8859-1?Q?D5qaVnXmPmpQgCq4eJMwBe9u5SFKOPou0TmULajSX4ysAaOqnppybkDK3G?=
 =?iso-8859-1?Q?QmgHDQ6I8Kf38YZeBGoeyQxbZYbF1ZbJma1jsQfovdBKRvBc5SKO2GUbR6?=
 =?iso-8859-1?Q?ePMLZ+2OyrvZf74ZzBsBQ8QTLF8Dw22LuhvmfVcCPg6T6Eyd6yDdfq1Oat?=
 =?iso-8859-1?Q?Yq/+rRgN/CxBe37wUmcn0QgdTMAj6scYmgrU6tzMLaZlpJ4SG3uM9wKWQk?=
 =?iso-8859-1?Q?S2Ili1JwWjnxpViIiU5AtnjIC2JdAZoISkDsJk3558P43knWqkn/51nE0b?=
 =?iso-8859-1?Q?KKMJCSUQ8vMQjnh+gDZgUc4Zy8fyej24kg3BA4P0+2etkenoB1VV5faGXh?=
 =?iso-8859-1?Q?55gyL+ygmpl1itQhZFw8tHelAh5831/MNumQVz/h5Q6Sk7EK/VNFrKma6J?=
 =?iso-8859-1?Q?nnCYGyG0TA8PRADsI9V1dvADQg7lakekm4yfDZHE/JaMIVL0/lQ4mzwsof?=
 =?iso-8859-1?Q?SiKeAcIJtcpqbjzdg/JtxmVyJsL0BTS6vVa+6mRKDxUZNN9JWFSzNjCk9M?=
 =?iso-8859-1?Q?0minMYLx3obCnBy8zGsDNi9Kj6ggaOCBA63rtuQRe7Z1rCyB8ZPQCIIlrW?=
 =?iso-8859-1?Q?iKuBcke/ZulCTc6RtE0wxU+limJ88L1GBom1dGxEpexqAfzp/2XIyHLQn7?=
 =?iso-8859-1?Q?ZprKA6pXPG+fHnHKn/D0QFiBNWaG1TLrJchSbc6ZYvc1pSXO8DuJfH9Yy/?=
 =?iso-8859-1?Q?m3i2ZKJc3gaIZ4Drr53ZHq2h4OydFEih9jlN9rDZxO8njVxnSFkZL7+v1P?=
 =?iso-8859-1?Q?bv0OHotMz7VWIQpIlksW+no7SyTx8UdaS6wC4YPHcUQpebhikGetSYmNVC?=
 =?iso-8859-1?Q?UYDRx/ZNwUHjU5+zPiyC5QphTznQE1BNW7HpdlBOOp98j7fxAJ+0Ew+7p5?=
 =?iso-8859-1?Q?haLiyQQaY5sZfa0rk+ZfNJNimwhJGhcc8Mc8NDh1qxbK/f3NqFyejAi6cd?=
 =?iso-8859-1?Q?QaQaVhTiEk8Kfsxwa1YHqegdalitUbQ3OcDh8DIboIw3eAKG60XT8gLf7v?=
 =?iso-8859-1?Q?4WMxaa3v+uOVHlEGOeFFJpn5w0AneBU2To52B9+nimkeatzVhkJ57cGOTv?=
 =?iso-8859-1?Q?RbtPycV/U57lLWHSnLRFT2K5OXE9u3NWqON8/WkycpQ+FXj4PHWX2fhS/r?=
 =?iso-8859-1?Q?A+kwb9IVPPsMSVMfMR1J+8bo/oMeio8TAH/YKqW3TgvkBL?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB542705A7E32C0BA28B5F399C9896ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a541e2f-cd89-4e8c-4fb4-08de58b3e23f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 06:11:14.7268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NYebvlT1rGmA/HT6299zEmihvCKsqsFRAHTfT5A7hgUeIVzjk8+jlDdYkj4sAhDq+gDqPLchD6pIXPpQ6Akowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
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

--_000_CH0PR11MB542705A7E32C0BA28B5F399C9896ACH0PR11MB5427namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Tuesday, January 20, 2026 4:47 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Santa, C=
arlos <carlos.santa@intel.com>; Badrappan, Jeevaka <jeevaka.badrappan@intel=
.com>; Konieczny, Kamil <kamil.konieczny@intel.com>; Kempczynski, Zbigniew =
<zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit F=
encing

Hi S Sebinraj,

[...]

> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT 2
> You could use NUM_PLANES - 1 whenever you need to get a number
of overlays.

Sure, I'll change that.

[...]

> +static void setup_output(data_t *data)
> +{
> +     igt_display_t *display =3D &data->display;
> +     igt_output_t *output;
> +     enum pipe pipe;
> +
> +     for_each_pipe_with_valid_output(display, pipe, output) {
> +             data->output =3D output;
> +             data->pipe =3D pipe;
> +             data->mode =3D igt_output_get_mode(output);
> Are these values changing throughout the loop?
If not, then perhaps for_each_pipe_with_single_output() or
igt_get_single_output_for_pipe() could be better suited,
depending on which values remain constant in this loop.
Otherwise, writing the same values over and over again will
work, but only the last loop iteration dictates what remains in
this struct upon function return.

I'll keep it to for_each_pipe_with_single_output as we are interested in
Only one output per pipe.

[...]

> +     /* swap overlay colors to see visible change from the previous scan=
out*/
> +     igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +     igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS=
_Y);
> +     igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +     igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSE=
T -
> +                             data->overlay1_fb.width, OVERLAY1_POS_Y);
> As Karthik alrady mentioned in his review, this is most likely
not going to be utilized in CI, so could be removed or run with
special debug options.

Okay got it, but I guess the same is needed for crc check from initial mods=
et
As to check if the display was updated prematurely.
I'll make those changes in the next revision

> +
> +     /* Request OUT_FENCE to track when display update completes */
> +     igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->=
pipe));
> +
> +     /*
> +      * The atomic commit should succeed immediately (NONBLOCK mode),
> +      * but the display should NOT update any plane until ALL fences
> +      * (including the unsignaled overlay2 fence) are signaled.
> +      *
> +      * A buggy driver might:
> +      * - Show primary and overlay1 immediately (wrong!)
> +      * - Cause visual corruption
> +      * - Fail the commit
> +      */
> +     ret =3D igt_display_try_commit_atomic(&data->display,
> +                                         DRM_MODE_ATOMIC_NONBLOCK,
> +                                         NULL);
> +     igt_assert_eq(ret, 0);
> +     igt_debug("Atomic commit SUCCEEDED (non-blocking)\n");
> +
> +     /* Get the out fence to monitor completion */
> +     out_fence =3D igt_crtc_for_pipe(&data->display, data->pipe)->out_fe=
nce_fd;
> +     igt_assert(out_fence >=3D 0);
> +     igt_debug("Got OUT_FENCE_FD=3D%d to monitor display update\n", out_=
fence);
> +
> +     /* Verify overlay2 fence (last one) is still unsignaled */
> +     igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +     igt_debug("Overlay2 fence still UNSIGNALED - display should be wait=
ing\n");
> +
> +     /* Verify out fence is also unsignaled (display hasn't updated yet)=
 */
> +     ret =3D sync_fence_status(out_fence);
> +     if (ret =3D=3D 1) {
> +             igt_warn("OUT_FENCE already signaled - this may indicate th=
e "
> +                      "driver is not waiting for all IN_FENCEs correctly=
!\n");
> +     } else {
> +             igt_debug("OUT_FENCE still unsignaled - display correctly "
> +                       "waiting for fences\n");
> +     }
> Most of these igt_debug messages are excessive. igt_asserts
should be enough to signal what went wrong. Furthermore most of
the CI runs use debug flags, so this test would produce a large
number of messages that bloat our logs.
Please leave only the logs in failure paths.

Sure, I'll remove those which are not needed.

[...]

> +     /* Cleanup: close test-specific resources (fences and timelines) */
> Just "Cleanup" is enough, reader may infer what you are cleaning
up from the code.

Sure, I'll change accordingly.

> +     for (int i =3D 0; i < NUM_PLANES; i++) {
> +             close(fences[i]);
> +             close(timelines[i]);
> +             igt_plane_set_fence_fd(planes[i], -1);
> +     }
> +     close(out_fence);
> +     igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd =3D -1;
> +}
> +
> +static void test_fini(data_t *data)
> The name could be more descriptive. You could rename this to
"reset_display()" or "reset_display_state()" and skip the
comment two lines below.

I'll change that, Thanks for pointing out

> {
>       /* Reset display state */
>       igt_plane_set_fb(data->primary, NULL);

[...]

--
>Best Regards,
>Krzysztof

With Regards,
S Sebinraj


--_000_CH0PR11MB542705A7E32C0BA28B5F399C9896ACH0PR11MB5427namp_
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
<b>Sent:</b>&nbsp;Tuesday, January 20, 2026 4:47 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Santa, Carlos &lt;carlos.santa@intel.com&gt;; Badrappan, Jeevaka =
&lt;jeevaka.badrappan@intel.com&gt;; Konieczny, Kamil &lt;kamil.konieczny@i=
ntel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;<=
br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test fo=
r Explicit Fencing
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S Sebinraj,<br>
<br>
[...]<br>
<br>
&gt; +/* Test configuration macros */<br>
&gt; +#define NUM_PLANES 3<br>
&gt; +#define PLANE_PRIMARY_IDX 0<br>
&gt; +#define PLANE_OVERLAY1_IDX 1<br>
&gt; +#define PLANE_OVERLAY2_IDX 2<br>
&gt; +#define OVERLAY_COUNT 2<br>
&gt; You could use NUM_PLANES - 1 whenever you need to get a number<br>
of overlays.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Sure, I'll change =
that.<br>
<br>
[...]<br>
<br>
&gt; +static void setup_output(data_t *data)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display =3D &amp;data-&gt;dis=
play;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum pipe pipe;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe_with_valid_output(display, pip=
e, output) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;output =3D output;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;pipe =3D pipe;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; data-&gt;mode =3D igt_output_get_mode(output);<br>
&gt; Are these values changing throughout the loop?<br>
If not, then perhaps for_each_pipe_with_single_output() or<br>
igt_get_single_output_for_pipe() could be better suited,<br>
depending on which values remain constant in this loop.<br>
Otherwise, writing the same values over and over again will<br>
work, but only the last loop iteration dictates what remains in<br>
this struct upon function return.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">I'll keep it to <s=
pan style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
for_each_pipe_with_single_output as we are interested in&nbsp;</span></div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><span style=3D"fon=
t-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetic=
a, sans-serif; color: rgb(0, 0, 0);">Only one output per pipe.<br>
</span><br>
[...]<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* swap overlay colors to see visible change=
 from the previous scanout*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1, &amp;dat=
a-&gt;overlay2_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1, OV=
ERLAY1_POS_X, OVERLAY1_POS_Y);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay2, &amp;dat=
a-&gt;overlay1_fb);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay2, da=
ta-&gt;width - OVERLAY2_OFFSET -<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;overlay1_fb.width, OVERLAY1_POS_Y);<br>
&gt; As Karthik alrady mentioned in his review, this is most likely<br>
not going to be utilized in CI, so could be removed or run with<br>
special debug options.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Okay got it, but I=
 guess the same is needed for crc check from initial modset</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">As to check if the=
 display was updated prematurely.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">I'll make those ch=
anges in the next revision<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Request OUT_FENCE to track when display u=
pdate completes */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_request_out_fence(igt_crtc_for_pipe=
(&amp;data-&gt;display, data-&gt;pipe));<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The atomic commit should succeed imm=
ediately (NONBLOCK mode),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * but the display should NOT update an=
y plane until ALL fences<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * (including the unsignaled overlay2 f=
ence) are signaled.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * A buggy driver might:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Show primary and overlay1 immediat=
ely (wrong!)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Cause visual corruption<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * - Fail the commit<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D igt_display_try_commit_atomic(&amp;d=
ata-&gt;display,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_MODE_ATOMIC_NONBLOCK,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Atomic commit SUCCEEDED (non=
-blocking)\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get the out fence to monitor completion *=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; out_fence =3D igt_crtc_for_pipe(&amp;data-&g=
t;display, data-&gt;pipe)-&gt;out_fence_fd;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(out_fence &gt;=3D 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Got OUT_FENCE_FD=3D%d to mon=
itor display update\n&quot;, out_fence);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify overlay2 fence (last one) is still=
 unsignaled */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(fences[PLANE=
_OVERLAY2_IDX]), 0);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Overlay2 fence still UNSIGNA=
LED - display should be waiting\n&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Verify out fence is also unsignaled (disp=
lay hasn't updated yet) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D sync_fence_status(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret =3D=3D 1) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_warn(&quot;OUT_FENCE already signaled - this may indicate the &quot=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;driver is n=
ot waiting for all IN_FENCEs correctly!\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_debug(&quot;OUT_FENCE still unsignaled - display correctly &quot;<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;waiti=
ng for fences\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; Most of these igt_debug messages are excessive. igt_asserts<br>
should be enough to signal what went wrong. Furthermore most of<br>
the CI runs use debug flags, so this test would produce a large<br>
number of messages that bloat our logs.<br>
Please leave only the logs in failure paths.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Sure, I'll remove =
those which are not needed.<br>
<br>
[...]<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Cleanup: close test-specific resources (f=
ences and timelines) */<br>
&gt; Just &quot;Cleanup&quot; is enough, reader may infer what you are clea=
ning<br>
up from the code.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Sure, I'll change =
accordingly.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; NUM_PLANES; i++) {<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(fences[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; close(timelines[i]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; igt_plane_set_fence_fd(planes[i], -1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; close(out_fence);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; igt_crtc_for_pipe(&amp;data-&gt;display, dat=
a-&gt;pipe)-&gt;out_fence_fd =3D -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void test_fini(data_t *data)<br>
&gt; The name could be more descriptive. You could rename this to<br>
&quot;reset_display()&quot; or &quot;reset_display_state()&quot; and skip t=
he<br>
comment two lines below.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">I'll change that, Thanks for pointing out</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Reset display state */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;primary,=
 NULL);<br>
<br>
[...]<br>
<br>
--<br>
&gt;Best Regards,<br>
&gt;Krzysztof<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">With Regards,</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">S Sebinraj</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
</body>
</html>

--_000_CH0PR11MB542705A7E32C0BA28B5F399C9896ACH0PR11MB5427namp_--
