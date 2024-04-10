Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C576BCD1296
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 06:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E841131D1;
	Wed, 10 Apr 2024 06:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KDxN3MkX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3911E1131D1
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 06:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712731095; x=1744267095;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=2nJQIYYP16Xzh0MUKes3/Ky0Rxukzri01l0o+O4Yiek=;
 b=KDxN3MkXtNBjztziiOl3ObdaWbq4316FtNVIWW9logn2x0tKKgCJ31mK
 BZVfwUJSg6SUzPUD5VPcbZWxvrqAFHtKrW+jO14ZnAl6lxvLqfZea2f4+
 AKQkvaaj+fxdVx+UDXHsUPWSLnTntxjUy+voQl1MuE/qKByA+3nQm129x
 Zqngiko+6aX+6oRQVPgaXQrZHS9u+lz44KTmbfqTvKiB6DTXa7n1uh/gO
 vjYC+94ufB5+MfBV6fecU9IY5FG1BBhZsfIOL7yB8WE6v9bn4cSmd25lV
 qhPmjg1tAvrKk7Tj5ix46Sr4uhnx8auKZy5LxaitFAVqoauU5ffizQMNy Q==;
X-CSE-ConnectionGUID: FKPI+NrQRDeOnJ5EQ+DQLA==
X-CSE-MsgGUID: q7V1OjVyS32hy/H93+uQIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7948765"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="7948765"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 23:38:15 -0700
X-CSE-ConnectionGUID: pAQLlKgeSxiTQd7yseNOpQ==
X-CSE-MsgGUID: 3H/qxjQsTbmF0iCiDW+HjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="25139937"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 23:38:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 23:38:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 23:38:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 23:38:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmxlCY9/Xhi6PskWwH00nIXQFxOs3tZrzD08JXVJdLQOI4gDMw8dDa9ngTKgARQlRa7BGJcLkTgUxzSTt8W6i571cbRrNsd5WBxiuYhbxYRAadAuDhBUG4GC8WhgPujbz8obus3vIlWA4QeW2qwc1gVcKzqdAWb8hcNM8Y7VESVf83f4FpaKPiT/THvKEFZPE3KMKQeqtpNhTAeFG7t11QIgti/tToExoTkYBEG3OoydD0M+35ugCk9MueCHGkPOpz1RrahRDHY5sgZYdz7z2EXd6/pWSqG6kCUv4mtRU7Tl+NWhS3/MjEf9OTKSuTRNgV6fkaNpFaIafhkMDjL5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nJQIYYP16Xzh0MUKes3/Ky0Rxukzri01l0o+O4Yiek=;
 b=iMCmA9uFK5PycEB5cRXL+tiXkH7jRZMMJJEnslY08erfGbOqhdzcJqQGdwNJpbiVxq3nDoNdJ8G2C+xzStvFdoKKX6+o2snQG6bQ4uH7E9SM4LKlbGs/soHon28aEfxMRDIOxjFiMWR/m/WDqc7tAFWv5KK99zizrqd7HjtUGGdHx4Ain0AqUG9iLXVLZw0HZrTIOaFHDXzXkVS+lswGDHTKDu/DN9VJSCmE6jagAfdoPHK47J5Wq8L1P91TIG8CDHaYfiGRGq8dhr3nfb0CrPVj7cTyLnJ/j9SJliZkIJbTbSTH4xY/UQb0W6VwgktwgTYK8P65M/+AFLoS8em9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by DS0PR11MB7765.namprd11.prod.outlook.com (2603:10b6:8:130::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 10 Apr
 2024 06:38:12 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::c4f4:e3f2:80a1:51e6%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 06:38:12 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_big_joiner: cleanup force joiner
 debugfs state
Thread-Topic: [PATCH i-g-t] tests/intel/kms_big_joiner: cleanup force joiner
 debugfs state
Thread-Index: AQHah0kPZd85fr+2Ukag8RePQ6i8YrFaB9GAgAcMQ2c=
Date: Wed, 10 Apr 2024 06:38:12 +0000
Message-ID: <CY8PR11MB688941BA1A2AAEE9F746CDD3DA062@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240405111525.1748544-1-kunal1.joshi@intel.com>
 <ZhBJv1sqXOU78bGQ@intel.com>
In-Reply-To: <ZhBJv1sqXOU78bGQ@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|DS0PR11MB7765:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yFaLsBaj6mPWKn3QX+IPJmw/z1781UZMwzZ1pg3s0Eul8+7PaqJs35LIMEKshSiMo9mfHTbyRDTMfPLgMLtpae9Albz+FdHiMVEAj1ro0vgzk2+B0JUohAIlrlBHybpV6iYzzJDVJjG5a/edh4u91PCeJVkHNUrRgFUonGYwk+1zd4x5Lq7f1NqrZ3JPkocYHY+vG+XLQYkrTZ7aLG2srWx5GaFUgQZGK3O3xt5fP4994l2uYueQyiWt/+dgNbd6ErAbJCTAWqBlQornctChWkRWgB/rzg+XJwIQ3tSqQTcg4GZ9JPXYpKf7kAeynBpAnu2voe40+aswahAGonpj6t3l1niVVuA0Xhw0nQfnsQJrfrP1sBOfwEgoeG8xE4RM7nBtqZ03VkeYSib3N3RVFUE7RpM1K7N9oEOYiuC5hr3yWM9hg38Pu67qLdlLbeispfHzmPhTqmIfh+UpYc1aVqFlv0CP3vaPc2ClKzIl9GoJaY2H0bJqhOTrEPjV2hQR+hy5M0Vk/UNXl6+pJ68P8fmxC1HidB810rgGL+3ulSIrfhGCW1c1Xh8wjTwFsvgdT73+MApo79n3EsK8Orc5PpxMqZNBr2bs6oZzZ1igalQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?yIDEjy79DInd1f286KQ7UGQf+4uEfUVvcIr19IKJbeCsf1Z2kzNPuidD6b?=
 =?iso-8859-1?Q?SO977OTMhv3z3o95jKmLCXu9WSgaMEEdYm6Ng05g69CNetOFbvZisMvnvu?=
 =?iso-8859-1?Q?z+kqVZ0mAafkzK+qutMdBdbwJ9EDTyLHjQ6XMFLX9J8F6xFG3g051E4If2?=
 =?iso-8859-1?Q?EWDBkPW2AzCJf7+4Wak1it1Ajfhg8uQuKeoGj+tJohrpuLG/HbhSJAz3IT?=
 =?iso-8859-1?Q?5lofSDUC181Wum1Hty5VoL+V0sr/B7NPXaXQAp/lTGR94uZKzv0aYGOUjQ?=
 =?iso-8859-1?Q?AJUfQddEMkKxMuM3D7xkRfgK7L5tBWf6hGrmZkaE8fEsqonrd7yuNHjaqL?=
 =?iso-8859-1?Q?oNlejqgOwVDLhobztmkbLyiNz4/gcdrtifZewVcv/Y4zIPmNrkwZxOM60Y?=
 =?iso-8859-1?Q?FDgl2SICVbrwB6l+sqq9C6yjYvKX1DLGfyXofkOCSz7HnI2heDFFlmc1Yy?=
 =?iso-8859-1?Q?proG2FUxRqCekjCpVljE3TQFLZ/6uIBYzecwdp1VaI+nlEjiEYvgl3ETSI?=
 =?iso-8859-1?Q?Mc9KIPQfLd9ESA4ydiYa6m2PVmmnwUvKU3W7q6b8s46fELAJhmfQ8X2AwI?=
 =?iso-8859-1?Q?IeZIJzYVe+YavY//msgLy3H1cVlN8g7Mtu+sknkBfu6cs7A8x6vgxweiAS?=
 =?iso-8859-1?Q?YL2f9l9dgRIzbjeJ9YIqmOWsShLehADdRtOEmy6jRTGnHqDcb/3Vw7hsHR?=
 =?iso-8859-1?Q?j2Ah41gjdqzaxzKAQmVfia9U6FG2qXTjTPEfOA6gP+0EbHX6fJwHOdPfwW?=
 =?iso-8859-1?Q?uEFvJTcHVQxRZuoktXZFTRpgPVVgfK77dHPLRefhuVEBrzkI4qPNl80gRF?=
 =?iso-8859-1?Q?CBgS6cwsePR14NZbBrAM7ZYoC8q5p6j0V16vWoWgVRtU6ONdS3uKmGYl9G?=
 =?iso-8859-1?Q?Nzo5Irni4ICmZyuf6VfmBZVrzFHz8wfWY1pqEy8+YTNGY41B4ptw4hjmZz?=
 =?iso-8859-1?Q?sLbjHah4reVHWx9n0QMDz+W3g9dHXNoUwWR5+C6TEvqrsiI24atacU+TsF?=
 =?iso-8859-1?Q?t6Oi+UMtPKr+a/pTRNqX2sAELVa9BvZp12HX/B/96/0u1nUG4qlbeFPxT7?=
 =?iso-8859-1?Q?ccxlAQw1v76S/U6F7YKV413MTT6/0Cnx1fczNmFvGFY3dBw3tGEfoRT7dn?=
 =?iso-8859-1?Q?C+5IIasTTCirCcH8ykxmOlKAj0g2F1oufJ1qtunDW+56p0KSfrExbrHBxn?=
 =?iso-8859-1?Q?7Ys8d9ZSwhqp4KBsHR5jBUsBkfmnWruNhoj3mB97AcoIDKoVH4ey/JKCZi?=
 =?iso-8859-1?Q?Deeo7xnRGlwVgSHsWoXSPBqMjZmqaiOetQNwFjSc+B35ly+aNi4rf8Ly16?=
 =?iso-8859-1?Q?D+RhFq4CGDWWF5rb/A9Y4IS+oJvEARZre6Gj0wCdrrU2gp2dJQ5prLSAt7?=
 =?iso-8859-1?Q?Ql7NMQ+FS6Ew3C38Ncx1mkMifWyTZHjcZD255xa6pqe2VFXByWw7x4FYIN?=
 =?iso-8859-1?Q?gX2LdSbOmQI1DSAKK7hQJFtsc+thdz5Ki2Bz+KLI+fw24otLKW0x85+10T?=
 =?iso-8859-1?Q?VvzmD4meTrAWHO7aCTSFveyAJHvSydeTnSrcM6gemddQ71apOcJZvCl/hu?=
 =?iso-8859-1?Q?Y4R7ZsF996qh3v1oY5Y8yNDDkyvJzdSf1kVNRBjsN4WZnJgnU1fgku1/P/?=
 =?iso-8859-1?Q?PSu+BAD3yaCasmbR7+zban+j+inNzYpROO?=
Content-Type: multipart/alternative;
 boundary="_000_CY8PR11MB688941BA1A2AAEE9F746CDD3DA062CY8PR11MB6889namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c15aa0-62f4-40ea-61bb-08dc5928cb3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 06:38:12.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+TMQNo4qApsJPbgsyizp0mOS3wVFd9DbKIsL7gxevBo5BR1zo7PZWNKDF2c+L8+wn3bfKSx5uFXztzT0DsdUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7765
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

--_000_CY8PR11MB688941BA1A2AAEE9F746CDD3DA062CY8PR11MB6889namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> We have igt_reset_connectors(), which seems like the place
> where *all* force knobs should be reset.

Hello Ville,

Thanks for the suggestion,
igt_reset_connectors is getting fd of the sysfs path, have
made a similar flow for debugfs as well
https://patchwork.freedesktop.org/series/132249/

Thanks and Regards
Kunal Joshi



--_000_CY8PR11MB688941BA1A2AAEE9F746CDD3DA062CY8PR11MB6889namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;We have igt_reset_connectors(), which seems like the place<br>
&gt;&nbsp;where *all* force knobs should be reset.<br>
<br>
Hello Ville,<br>
<br>
Thanks for the suggestion,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0=
);">
<span style=3D"font-size: 14.6667px; background-color: rgb(255, 255, 255);"=
>igt_reset_connectors</span><span style=3D"font-size: 11pt;">&nbsp;is getti=
ng fd of the sysfs path, have</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
made a similar flow for debugfs as well</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://patchwork.freedesktop.org/series/132249/" id=3D"LPlnk258=
408">https://patchwork.freedesktop.org/series/132249/</a><br>
<br>
Thanks and Regards<br>
Kunal Joshi</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
<br>
</div>
</body>
</html>

--_000_CY8PR11MB688941BA1A2AAEE9F746CDD3DA062CY8PR11MB6889namp_--
