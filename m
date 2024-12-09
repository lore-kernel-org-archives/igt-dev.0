Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67FBE7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:05:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F57C10E4A0;
	Mon,  9 Dec 2024 08:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DvEgYRRu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96F010E4A0
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733731555; x=1765267555;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=EmqQDOV7sScdnIBaxJ/SknQPp4IiVMkWFS9xihlsjys=;
 b=DvEgYRRuqNNECdSQUDuxUwyTQZbAIwK66A0IWeogKYBi7Dnq6TzoRl2K
 d7C4LwDxn/ZF0LhM7VzxTReODab7jT5v8RMhlbfpql/Hix2vLMad/f2AB
 XW/rWmMqoP7wfLsNyfckl6/tEEbmkWNREDRRi2xMWididWgFdoPa/bZxo
 3SWbGAY/sAWFSpjOCiryJP0Ole2h7u/z2cf+lMLxlcjmHUs0gwOs71ZKr
 EM3x5ud9y9oUSWOy6Ns/M5D/dvxPX08sjxNc0l6iCN+5T1JkTik00XWsc
 8c+y2kK8QXsGtcJ7CMkKfHaUZTRaL+ffebpLYyJjtQ71iSEYDb4wlXZcM A==;
X-CSE-ConnectionGUID: xRgkuYjWQkukFv/0KwO9EQ==
X-CSE-MsgGUID: U1XWHRldQ5GMg5udUQ6y2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34250075"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208,217";a="34250075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:05:55 -0800
X-CSE-ConnectionGUID: +cS0Rie5TI6NeL1N/PizGA==
X-CSE-MsgGUID: Xz/k8eJYS/GsB7+doXdVng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
 d="scan'208,217";a="125877648"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 00:05:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 00:05:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 00:05:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 00:05:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwlf+RuWFkLp1xc0DsxHg15BFZeVyatR4cJLKzvToG36iNotBDTN9RXpW3LPldtuRGxqXm2N/qqx6qi/mwxFpytk8LLclE2JdP0P559E3pGNVGUcP44NMrGgLyZpqjmRI0OoAfohegkzjqtmIAU9qhjTInOZC+h0pwgR6pIThZ/PcSCTTsWSnodWP0La9al2eyQoTpawrRXMpFon7HQTL1qQ8ssfaGhyEFN9tgZ41x4Z8KmU06aD/OFE4W95gY07D1DD3CMoCBWMWA2a5eC9En4aYPb2k/SJL180e+hZaHfG2KhrJnBU9mGrhfW1UzOG0qDsXZRrchK1Wr+DkbmcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhnIJFd2ttvJhZADhOsz1h8Y8VhuR50PE1exGoL7FDk=;
 b=PZzpkMqPYykJ0QcDZV1kjem3/phI8XOsUFzeSwG0IkV8hp2/OFh8pQK6C3eIAWU0WE7zC5t1jn57VdZq6SoUzhpybNZunNbtLJdUkqOZbDaRuMvamV8Ce9W9jTvkmrEx4gpAgvzUop0ATyhTmpaJmt3l7sL6WgcRVDNrMKndBRYaNJvC3jC2PRVOFWXVprxy7fo3Ky7ItQfeJWHvq7CeWRnPkz3x3U25qoch0aFHekWz6vNPPBsjZEFjtu0Z5xLdFACoZ2k/lOrxG9s3B+mudSxaWBaQCw7KZLTnurQfV4UuSXvgRw5l5JsTaIESaWQVnU+fCTIqodyiNLVOCBNdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 08:05:51 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%4]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 08:05:50 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't unplug
 multiple times
Thread-Topic: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
 unplug multiple times
Thread-Index: AQHbRvexF25Uo9QFOEG061F5J9+iBLLYrYwAgATmdhI=
Date: Mon, 9 Dec 2024 08:05:50 +0000
Message-ID: <CY8PR11MB6889E20F8A97489D943DCB37DA3C2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
 <20241205094052.1259373-2-kunal1.joshi@intel.com>
 <DM4PR11MB631212A8CD3376CD2F3919D590312@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631212A8CD3376CD2F3919D590312@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|DM6PR11MB4660:EE_
x-ms-office365-filtering-correlation-id: 8f391b3f-3cfa-47e2-04a6-08dd18284bfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?g+LiQcnz5Xge6vHtcRXrpVcNtqMOabnmBFM5ioHA//ym3U86yz8eOIqpK5?=
 =?iso-8859-1?Q?6yfyyoHZ8vgjxnpvdVK2oxhlLtvRXLdAd6lbPAvXXy7eeevev5pyHGDNP+?=
 =?iso-8859-1?Q?QklsfH13TC6VpsNZ26ScGIrdwYUmArsolpkZLINuPca4UQ6Vr67uklzFxg?=
 =?iso-8859-1?Q?Ce8qRevH37J6alEmNujn9cMfGdqN3MPmEojBG5rPKE8m67c79nw6LchwZZ?=
 =?iso-8859-1?Q?jTyN9HweToRuAevxG7bn/lcakCFW7dtIHOXbi/3bIEivHaFcjXxcBJdEk3?=
 =?iso-8859-1?Q?Ch9GobR3fqneGeNs2fFk/HJMHnQBbA9pRrjES0PAZ0rESyRvdKpPy/hfgp?=
 =?iso-8859-1?Q?RK8PBcb/79d4AQKUd5st/GA720E1cQozziu/EWpvrkhPK50OAk38STa4Lu?=
 =?iso-8859-1?Q?PwuVEHCLsLZeCWBCWML9VSza2YZbFwn4cCvXWP9mu68wHC8LutFkCmzpoG?=
 =?iso-8859-1?Q?XL4m+GEXWf3pv6Q15pUOAo0vXsEAHcKsa1Dlt+3YKptbBqblDRzcCpB3aj?=
 =?iso-8859-1?Q?gl9e55ev0vso6AR/j/wp8N0OIV9z4Ec8Fn7hrirnG2UR03kKyjHoZXVGuE?=
 =?iso-8859-1?Q?RrIuiz95B/v9Oat/AkBXrOzCWWazmFQ1BGOCPWU1h+A0s3nprZHaa5kiQO?=
 =?iso-8859-1?Q?RqeXl7kgrnvWDbtC3alSHabGAU+pXrKol5Lmn7cLyErQIN5adj0XEc9eIe?=
 =?iso-8859-1?Q?FKD3MhBmpHT8IodI+fLuFPfCoY/XmNNsBBuCwGVDTyi5KRKH1lY34yRHC8?=
 =?iso-8859-1?Q?d8AhNC5dUK3XEyWZB5xDNImS5/XAbIdf22LQtDMm+fgPdiwWEX7P99qAZb?=
 =?iso-8859-1?Q?LtduITiS28QFQHrw4GaA9GvyiyLXCcEFM3gmpjSOOhL9OimCMBbnze+oxI?=
 =?iso-8859-1?Q?y/kMml+D+5vrkIp3iZLZ6V8yRzovvQrm57vR6tsHSmyU4mwXIAImLRVD9E?=
 =?iso-8859-1?Q?ioT87abi0+zcrxWtj/hLYoiLSp4Zc4haq2vpFC37snqtT72YOuirfAvAnJ?=
 =?iso-8859-1?Q?k5SKtH5Hb9UFRTyTc+Lh1Pj4sOJTDd83dVIwLQq84oizOkNhPWqG6dM29i?=
 =?iso-8859-1?Q?UMAD8uLTOKBsCiPUADKxHn3utdeBCJ6yHnsMx4kPgHpF3n2WaRUQNScfqj?=
 =?iso-8859-1?Q?u/0TYaY2dUYPniGJ6+B00lvm/sMsFalEAzWgEMdEIxYpq7ekxUgjB6NWmf?=
 =?iso-8859-1?Q?9W/Fvo2D0GEy+YgsZc97xN/514zYnxBmcx2dzb8EH82Ea8cYl7I5eUfQy8?=
 =?iso-8859-1?Q?64v4LkMx4vkyqerUUI53Kii/uRWPWvqDTWcjJKRlztSntXeOgjx5Kjx2rx?=
 =?iso-8859-1?Q?SSAJW//Pjqp/wL1TEZVwYHmQ/y13vgx++iYHotjwGiaM3pi5sDdkFKQxlu?=
 =?iso-8859-1?Q?uNIkvDed7F2t0vv/1NWmjtLywUtOTUUGrASAjnE2zKTHiUECdxXN7grHy7?=
 =?iso-8859-1?Q?NCFaWFNGqHr8V863J6XFJJAh5fHjy3QyP7LHgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dVx6HR4wC7Wzv6vVm1Ix/Nlf0EgedUFrl8Fdb23+S7GS8ajSOsOGENXzTn?=
 =?iso-8859-1?Q?bCWde55mZZdNrQ+D7U5X22s9Ymwk9luwY80SCPMmXCFySUQ2ZLhy+/xOb7?=
 =?iso-8859-1?Q?PXJ92pk2leqnoJvplVmJS2g60ZFFcL05/4jvVk9xl48GF4MxhIczE3uxDx?=
 =?iso-8859-1?Q?2DnTFEO+6fW5HZoRze9ly17wKPo/jnfZaSRRx9ZoxzD/ri4X+JUIponfH4?=
 =?iso-8859-1?Q?1ngrMPMxVv+l4l1hHkxY7FTpnsqGX6Fl+k9caBXNF/N3MehVecaJWv0kPr?=
 =?iso-8859-1?Q?BdVuB5pFvogmfQVVoy7oo1+rg6gNx/RNMHugCPN3Xc7CqnSkIQV8I3dI/D?=
 =?iso-8859-1?Q?+PMP18cU0uFJYrNlgKTz+iVvpwEPyzi7+rkE3vY0S/eb9FmmQu55VrllXf?=
 =?iso-8859-1?Q?PD+k36RoeDC4hOqEgxqZWUczqcb4iyC7U+w4+7NnsZtATFGk1SLnfILaSR?=
 =?iso-8859-1?Q?E1Tog/jbA+4Gba/MIgnxiKowGrF9RaQ5DHOa6nit3a69yL7CS5G0p2+Y2A?=
 =?iso-8859-1?Q?XWgq0xsXjNQ1R/5Wvqur/9162OpkmRw0aUWIeENXUtw2mIr2mRx+dTfSYh?=
 =?iso-8859-1?Q?y1PGbHZT9HdeB80WrlgviUlKW8BR/yjM+IZXydHgc69fSXdA18uq1m1r8B?=
 =?iso-8859-1?Q?Mz3njaIjNt9D9oSk+1gTEkAjVRXFed8JcvXn88DIcfYdDt4lqY11bO1/Bb?=
 =?iso-8859-1?Q?PYqk3DJj56lI0Ca2wPRnTFi/g7/TsYmoCC3U334YxfaTiCKhY5VqiFGE9v?=
 =?iso-8859-1?Q?NaPzq4VEg1mdGFAw/XlFdFhsbeJ7NcUAqP192Rk3j3hwywV0OKqNs4YDCL?=
 =?iso-8859-1?Q?LpysFCrr+hnNDNmmnLECO2YmqWZzRtfQZKAK0tTjQrdAFwCtSXPMCHF1yY?=
 =?iso-8859-1?Q?lHUvVuaFGr76Aks07c1KOY1duX6qyb+oDjY3srfenPkxRTOQrzwlxK+XH6?=
 =?iso-8859-1?Q?IdtwiFOWfuNNBNg0N52zGOJfgzGslrGtQor3w2mvHYzKQ5Nb+QfVppv8Vi?=
 =?iso-8859-1?Q?3sV2It40Mn0CmJp4JUvAcgPwVtshHmteBcU7ExCO146hV1o4/RPFKVFeyG?=
 =?iso-8859-1?Q?NPd18y2SKpj+TqGL6tnqmCkV6CSrUiZ4JUiw7G2OAYPKQXYvr5X6+5GeQT?=
 =?iso-8859-1?Q?lV5K80YFi/CJ/RXJU5siEyc7sTIowFzJmgEFJoiz8rxnLwKKVH9fTC2SA6?=
 =?iso-8859-1?Q?djKS0wkkGvlnwFpefLe5cy0T7ISI0pfATM0kbHAakFpAjCRn6IqGXLROn2?=
 =?iso-8859-1?Q?yvapOty7EpB6Ev8pmh8B0U6RsyLYlTUZHxuRolgH5Y0hZIHoyOpmp5IBya?=
 =?iso-8859-1?Q?j3zte9I4Af+TRs0B3ikfD14xUOLVKHoS7dKsR/PqjBSeDoF/I0pl3AYiem?=
 =?iso-8859-1?Q?hQrTIXIRrsYgSkmxG3gkI+e3bMeIg+BmtTef1arGh/fcK5/0v6Q+SqZ4iG?=
 =?iso-8859-1?Q?KZWL4CM0THUepXDUGQx4Lqpf9nUm46DOD8ZY2p9rY/vYb1Jy7IVwPzpbKa?=
 =?iso-8859-1?Q?nvIQDpzaIzG3bEeO2AxddjJHzDwy6yCzf0VDvzhBjoL++bqAaqTGFQrDol?=
 =?iso-8859-1?Q?NEIluQeKeky6Ip4NuJQumeWDBpypZuDCLoLu9WWVe/wcZIbbkZoxXSEFNC?=
 =?iso-8859-1?Q?Hs8CaGYNDW6tUbdBQQUYnVTEtRDYiDsbnl?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB6889E20F8A97489D943DCB37DA3C2CY8PR11MB6889namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f391b3f-3cfa-47e2-04a6-08dd18284bfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:05:50.8922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HZQitJbpxG2mMec5Rv+MescbSeyn/XEHbzaIlHJbTJlNh+VHQb2Sfh1D3oZ79vKYc3Qd26LD9T3ZJAhbNRGOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

--_000_CY8PR11MB6889E20F8A97489D943DCB37DA3C2CY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks Jeevan for taking a look,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Thursday, December 5, 2024 3:11 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
> unplug multiple times
>
> chamelium_reset_state will unplug all the ports, prevent unplugging multi=
ple
> times
If this is fixing any issue ?? or Just a clean up ??
>
Yes  this should fix xe#3505,
Will add a Fixes tag, let me know if any other issues,
Will send all together in v2.

Thanks and Regards
Kunal Joshi
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index 52e758087..76a691043 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -329,10 +329,6 @@ static void
> test_hotplug_for_each_pipe(chamelium_data_t *data,
>                              data->ports, data->port_count);
>
>        igt_hpd_storm_set_threshold(data->drm_fd, 0);
> -     /* Disconnect if any port got connected */
> -     chamelium_unplug(data->chamelium, port);
> -     chamelium_wait_for_connector_after_hotplug(data, mon, port,
> -
> DRM_MODE_DISCONNECTED);
>
>        for_each_pipe(&data->display, pipe) {
>                igt_modeset_disable_all_outputs(&data->display);
> --
> 2.25.1


--_000_CY8PR11MB6889E20F8A97489D943DCB37DA3C2CY8PR11MB6889namp_
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
<div class=3D"elementToProof" style=3D"font-family: Calibri, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
Thanks Jeevan for taking a look,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, sans-serif; fo=
nt-size: 11pt; color: rgb(0, 0, 0);">
<b><br>
</b></div>
<div id=3D"divRplyFwdMsg" dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-size: 11pt;">&gt; -----Original=
 Message-----</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">&gt; From: igt-dev=
 &lt;igt-dev-bounces@lists.freedesktop.org&gt; On Behalf Of Kunal<br>
&gt; Joshi<br>
&gt; Sent: Thursday, December 5, 2024 3:11 PM<br>
&gt; To: igt-dev@lists.freedesktop.org<br>
&gt; Cc: Joshi, Kunal1 &lt;kunal1.joshi@intel.com&gt;<br>
&gt; Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't<br=
>
&gt; unplug multiple times<br>
&gt;<br>
&gt; chamelium_reset_state will unplug all the ports, prevent unplugging mu=
ltiple<br>
&gt; times<br>
If this is fixing any issue ?? or Just a clean up ??<br>
&gt;<br>
<span style=3D"color: rgb(0, 0, 0);">Yes&nbsp; this should fix xe#3505,<br>
Will add a Fixes tag, let me know if any other issues,<br>
Will send all together in v2.<br>
<br>
Thanks and Regards<br>
Kunal Joshi</span></div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">&gt; Signed-off-by=
: Kunal Joshi &lt;kunal1.joshi@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/chamelium/kms_chamelium_hpd.c | 4 ----<br>
&gt;&nbsp; 1 file changed, 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; b/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; index 52e758087..76a691043 100644<br>
&gt; --- a/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; +++ b/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; @@ -329,10 +329,6 @@ static void<br>
&gt; test_hotplug_for_each_pipe(chamelium_data_t *data,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;ports, data-&gt;port_count);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_hpd_storm_set_threshold(=
data-&gt;drm_fd, 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* Disconnect if any port got connected */<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; chamelium_unplug(data-&gt;chamelium, port);<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; chamelium_wait_for_connector_after_hotplug(d=
ata, mon, port,<br>
&gt; -<br>
&gt; DRM_MODE_DISCONNECTED);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data-&gt;=
display, pipe) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_modeset_disable_all_outputs(&amp;data-&gt;display);=
<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
</div>
</div>
</body>
</html>

--_000_CY8PR11MB6889E20F8A97489D943DCB37DA3C2CY8PR11MB6889namp_--
