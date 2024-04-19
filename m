Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23529C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 11:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4E810FAD1;
	Fri, 19 Apr 2024 11:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWzsno15";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22CB10FAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713526272; x=1745062272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=OLcBpj6jqOpg02cBKtAQCKrogEKPmp+fSGT1pha5iNw=;
 b=SWzsno15yztFPm85l9QHbY2DrZQ4dwQiLZA8vqUmNHTSfO+MqdLrjk3T
 pAnC+Js9zR0MP5TUFO2Nc0oykPDoi7ZZBretd6PUj5AMCOq2RJAN2VDau
 zUds6/ncDUxiEgjcM8rTOBxngHpPoAomTs9e88toBroOfnBLpbrQxzUku
 lNx/8CeABS3NvJw5LsxJmNO2X2QQCU9OKETgpVA9SJwtxTCnixTX+3PmY
 7cC87DxXU9H/Xd5g+3KKJieAf9eM7XQ97Z5DAoYUeJEB3U8mhYS8V3cvY
 DjQKmnu9Q+cx2chSzcZncq3T/KyA1ezcJXKaJESPLHjhczBE2wDYIoy4K A==;
X-CSE-ConnectionGUID: 7QOp05HzSEmmAXVFdvZRiA==
X-CSE-MsgGUID: A6TJDoLETGuj4qhmAbzWrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="19732059"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="19732059"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 04:31:12 -0700
X-CSE-ConnectionGUID: Hb8RiAbwTg2HUsYJrwOLOA==
X-CSE-MsgGUID: kV1kJ5l5SSKAPQPZAYGFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208,217";a="27770352"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 04:31:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 04:31:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 04:31:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 04:31:09 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 04:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/vafz2JVD30c1m95H9wChHlvmkS0Y6XamcPJKbVrkOyR0HeKgNJ6Xy3N6izclMVfnjWGGZKztNcm8ajMnEr3FgZLQ/SXaQRQ/BpfmMTuavchlWYL9ijoTvCFOf3gv9w3RdChl6B0jUAsC0SmLJ0UqvHM05q23RChMbVRyc9gxQyGLho73DEpLRa8J3lnsUT2FlihOlUSZC7r3cw1qDRww34A7EUTK7rPjAwvFVf/qYFX9lfZEQGW6jElQLIbPK4BG+52TjCt1HZLdyFBp+KwO4VkUlRzaIRun6LJUDpcOfsv1fq3mBCviywEetX5WVkZ+XxwsiEK/0Xm6nQKS7oHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd/4CF0R/65JsDW2cDi8tF/uSO/5tf36BFmE2C0QSf0=;
 b=k7Bw/2+XfK2A7rjBhOtvEbKydnPmdLXhv9wOEzLJl7EKfVnsL/wHs/njCLVsDTqBabvNEOzVeMF+iw3T/vAyrrz1lU5Yht/MFnW0qrZSf3iTnzRRMpbh9XH6rp2Z8TVrhK8BqcOcNFoINC++wTiobFmYUT7Qeo/17UOgTFwVHMgf+iipRvn/C/OgigF8VSpsU+HsF1rs7EHGvkKqT3Ngp9bdDBEpFDtA2aYjpol+nnvCwrOupfwO+fAXpncq4grh45SlM8rzs6TttqqbK5chEzAHGVj/zskS3Oeoq5SJJpTR0ofxxb1vOzoDMYEaZp3duwT7Iln7SOcFIsGV4IN6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by IA0PR11MB7837.namprd11.prod.outlook.com (2603:10b6:208:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Fri, 19 Apr
 2024 11:31:07 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7472.027; Fri, 19 Apr 2024
 11:31:07 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
Thread-Topic: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
Thread-Index: AQHakiLrTnvKVe+PzU+AQREp7XaeFbFvVNYAgAAgUo4=
Date: Fri, 19 Apr 2024 11:31:07 +0000
Message-ID: <CY8PR11MB68898A25B9B2FF838DF702B9DA0D2@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240419064001.2401850-1-kunal1.joshi@intel.com>
 <20240419064001.2401850-2-kunal1.joshi@intel.com>
 <192ce4d6-5f3e-42b1-86f0-e1a040c27f4b@intel.com>
In-Reply-To: <192ce4d6-5f3e-42b1-86f0-e1a040c27f4b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|IA0PR11MB7837:EE_
x-ms-office365-filtering-correlation-id: a1188b7c-4215-492a-b4cc-08dc6064347d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eoWj9/VHlx3I0s31Z9SHSWgLgmJJ7G19PLs0KoXndSPNTPHNf+Y/tQQN8ciax+44Zaket+1HWyoyoBedcZZNjoie41iuiif6gWx7ljaHmm6MNP/JNkukhQqJ2qnZ8aADplUVCw1e3gVlle7yIAa7ZiXPYf5PZHGSKwD50ko0IuPqR4f17giPUye+O0iz+eUvgCf7o41zzl53yqu4fwV5gTN8clOJ6hU/Awu1QcYRLHB+Ir5DxcBk/xUWBGu1dvnAd+cpDc1UubEWhmfGkfKrG0iRtANaMKpL/r0tsGWjOdT7xjgxhu2/h9RAddPHyArRtyZlBIG/0FtesGDNkRhZFZ32agc6DS9tNuRzPfRlkQGDZO6zm8Z8H8BkY7OmCflj5UjQbFLPy8nlFHhkwzCrvUtzR188P5c4r27THeX3juBE/Glbyf+SoLP1/IZ9HfKu+bpKkM2RoyeSk3XhtJPKn0SrVQApN2vm1ZqYDurq1SONiu7Nrr2446DczvpGb13VlOExoi1SJmjgvy+vqt/us4Pqj+0D5bGwQ4ofLB5SZ/X9DVBJ+YQR7Pt82e6ZEHTkgNP4BEvIo7mCuOGJj9DRO5Wzp1W5wqt+kPZn3XZCuLHnae3VxCg7MCJFJhzqqL0NrlIXq6RagnCsLes+s6/uvBdDub9fbeJUEYElWPGE/nqW3PHsD48ov1Scbabg7IYVSbUDwWi27JUHvoRZOj06MqjPO3+2zlEUYzKja1yZvz0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QYJcXjVfaH6NjOT8ep8IsDVjHZHciUS/sObpEqvcYlreeXAPfIPvDorTgY?=
 =?iso-8859-1?Q?8g6ARweWuS62B9PGrSQ7ialr1yUtyqzsQ67bfElyhjdPuNPUWmron1CBtV?=
 =?iso-8859-1?Q?e6mQLSoKlFYTNdoAVLP5S3KPXe6mgKn0Qxud/6xnleWr8MKVLgqjss4AjT?=
 =?iso-8859-1?Q?/sk2cIivNpMhkd+Yx/PQJ4sk0cLWaAa/p+8Rr5t+9zSGQmPDRoa3INplIG?=
 =?iso-8859-1?Q?xXnM6wzlFfcaH47zonfip4vAMH4s1cdy1WVV3f8RDVWCHn78KaRmP3Hrx5?=
 =?iso-8859-1?Q?IC4swMAHjsiWudu1DzBWClm6Uw3POomeR2rK1/QGI6Ns2fBl91fnNrSXfx?=
 =?iso-8859-1?Q?NsXpYz74X/zsQtlF/ckLZJen0tnv0hH0/sWPNJsgfXqx2PUxjbrzuUh9Dp?=
 =?iso-8859-1?Q?h2rbmfVm4oBVd4hX2vQeTEhJjAhClCqR5cDw7FPQPqBN9+VAhIKF33BzBf?=
 =?iso-8859-1?Q?BjSqRGV5A0ZP1aPh0yMnISdSme2aDaQI2g417Ul7VUJT4XG3YpryUy7Px3?=
 =?iso-8859-1?Q?/uVmnzlYKxQ896AQ+JoM2zPL3ytgpzyFLNTKf+Wkw0uQrt6Me1lh+mTF8k?=
 =?iso-8859-1?Q?I91N+M+KzHaUK8fKmleBYmC5C11t3AW7T6AHrPzYN42Q4ISWjabrcpnAZz?=
 =?iso-8859-1?Q?ze58X5bBpBOelib5QZcM6fsYmtv/cDXSmKTXrKEVRDkhIdNy6+oQiqkTFj?=
 =?iso-8859-1?Q?jWf/jV2UAksobzItvtmwEdhf2ypj16lEDdDIAutTjOnYjh0m5OVskFDgUL?=
 =?iso-8859-1?Q?IIGutghWRJBMFCXMwn3ZmZAT6CsxOecisJVKMsst8l1oQeSkipjuS94aMB?=
 =?iso-8859-1?Q?jdmh5E87OT5H8YXaICf+qmjXQ4ue7ydkAHZ8iCDNYaREw9Tb90ubvbA5yx?=
 =?iso-8859-1?Q?s/IYNBURpc8Fd1sEIULUQVyY+Vl4vrL0Va+uFVytWu5UrkkwqSkUJoxfX6?=
 =?iso-8859-1?Q?Glj9jaV0gSFFXE0dd+0Cu+5fWs7UjRxpDKJUnnSN3NInQpEsVMJ4yqPSis?=
 =?iso-8859-1?Q?7TwPXaDCCHf7EuGceSY+LbCPosXb/+05gB+XZWcs/K426G9+UFTTfl+bi9?=
 =?iso-8859-1?Q?JVBQY6pUeLm9cJ0ruvQNWQZ0Bl8tHvzBtRt5hVay3nsLSyaV7XFXXLZfBv?=
 =?iso-8859-1?Q?u9cV+tfe98Nv/mQaZdOz6Bv8F3BrzA5eUWKxshtPuF5lQW1nXtf6WO9Adp?=
 =?iso-8859-1?Q?jCXgxhOo0/aQrxBmREhVJJ/E76MtGOpzHi2CPzPd5AT8MzSOpciVBB4u9K?=
 =?iso-8859-1?Q?QMVP8I0VtxrulyHm2edpaYIsjjmzoIogfAeRfG/gfCmjocE2CxbnvJJBXC?=
 =?iso-8859-1?Q?pNWJnE6OSpWEBSnW13Ylr0MuxXOriEYOknFwCGtD+N0/48DJA2TlEKHAA3?=
 =?iso-8859-1?Q?9M73CPXW4vafmxi0ejK9eSQ+GJosAPyQ4LSA/l77yucGrlS8VDKPb0KHB0?=
 =?iso-8859-1?Q?newtgeTHcv0eQzPjXE4Zt8MWTyN7ovGu2ywu1rViyfRE6cI+JQlXrW8DLD?=
 =?iso-8859-1?Q?FZC++gC1kjNkvR38nbXYKFlHCnZ3LJhOxrwMERLmk5giI/5lW24FJW+Dq8?=
 =?iso-8859-1?Q?GR1dCgZ4icMkSZ5Xt46MQa1pmHXDQCl4k56X2DnLlQIJctSmHVksas/Ay1?=
 =?iso-8859-1?Q?7gL1D2tvWisZa0AtM311NnzgHwjwscpQyb?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB68898A25B9B2FF838DF702B9DA0D2CY8PR11MB6889namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1188b7c-4215-492a-b4cc-08dc6064347d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 11:31:07.2986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01v/ayUQL8bZDKqOAVSWcFpZ6Sm9oUQEbE4lwhC7eA0XefAVyFqzZfctdbhbxeZAnF4OygyK2zrm8h5aTv9FVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7837
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

--_000_CY8PR11MB68898A25B9B2FF838DF702B9DA0D2CY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks bhanu for checking this out,
Will update the commit, but still we need to keep <13 condition,
As DSC is needed for <13.


Hot to know from Ankit

bool intel_dp_joiner_needs_dsc(struct drm_i915_private *i915, bool use_join=
er)
{
        /*
         * Pipe joiner needs compression up to display 12 due to bandwidth
         * limitation. DG2 onwards pipe joiner can be enabled without
         * compression.
         */
        return DISPLAY_VER(i915) < 13 && use_joiner;
}

But will edit comment.

Thanks and Regards
Kunal Joshi




--_000_CY8PR11MB68898A25B9B2FF838DF702B9DA0D2CY8PR11MB6889namp_
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
<p class=3D"elementToProof" style=3D"margin: 0px;"><span style=3D"font-fami=
ly: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, san=
s-serif; font-size: 11pt; color: rgb(0, 0, 0);">Thanks bhanu for checking t=
his out,<br>
Will update the commit, but still we need to keep &lt;13 condition,<br>
As DSC is needed for &lt;13.<br>
<br>
</span></p>
<p class=3D"elementToProof" style=3D"margin: 0px;"><span style=3D"font-fami=
ly: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, system-ui, &qu=
ot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Web&=
quot;, sans-serif; font-size: 14px; color: rgb(0, 0, 0);">Hot to know from =
Ankit</span></p>
<p><span style=3D"font-family: -apple-system, BlinkMacSystemFont, &quot;Seg=
oe UI&quot;, system-ui, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji=
&quot;, &quot;Segoe UI Web&quot;, sans-serif; font-size: 14px; color: rgb(0=
, 0, 0);">bool intel_dp_joiner_needs_dsc(struct drm_i915_private *i915, boo=
l
 use_joiner)<br>
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Pipe joiner needs compre=
ssion up to display 12 due to bandwidth<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * limitation. DG2 onwards =
pipe joiner can be enabled without<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * compression.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return DISPLAY_VER(i915) &lt; 13=
 &amp;&amp; use_joiner;<br>
}<br>
<br>
But will edit comment.<br>
<br>
Thanks and Regards<br>
Kunal Joshi<br>
</span><span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontS=
ervice, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0=
);"><br>
<br>
<br>
</span></p>
</body>
</html>

--_000_CY8PR11MB68898A25B9B2FF838DF702B9DA0D2CY8PR11MB6889namp_--
