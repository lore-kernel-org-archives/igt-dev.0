Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8361ECF043F
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 04:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3292210E288;
	Wed,  9 Oct 2024 04:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WL+c3x/s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A86010E288
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 04:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728448405; x=1759984405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=6KHzundJLg+jUaQlQZpcuNTrF+4XTofBEuzD8I/sSc0=;
 b=WL+c3x/s4zJIuj76XSoXtQWibla9SEC0bwql/vqCMhQuCdlHFVivYBTn
 XKzz7FDSr+ADJud/aFKcIVENXxwr2uB5r9RosuWxc/VqPZRXeHSpSNCyN
 xD+IYKuK7x6XtxuzC+kNGnYKh60ygnF+1/tNTAffRHXEHpKRnKGBFMtd7
 NlbXE7fi2FZuASqvjb+L7AIOvwFl3/epKl6o1A1Qhd4XCCX/c0yCC2utH
 9r7Aa64gzMwzNBsBIf3Nkm8fLDhQHF5CM1RZrlzS2SAwDoLZdikwleanD
 S86+viZXoRMfLNvLAw7p1N4ke48yG8MATRY8E8uaVVYSH2aNklVabglMb Q==;
X-CSE-ConnectionGUID: DmaT7EGFQzu/PNHyA6skYQ==
X-CSE-MsgGUID: yGF+9HHLSYy9WIQfC83JYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27174133"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208,217";a="27174133"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 21:33:25 -0700
X-CSE-ConnectionGUID: pPpddSqoRuS1BCElkVHRBQ==
X-CSE-MsgGUID: e+qLyG7pQhaYhhMg/2fRYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208,217";a="76126254"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 21:33:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 21:33:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 21:33:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 21:33:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 21:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU01KkDedH9I5Mh+dz6QxMthRm8+3k7F8wc9n8lXoact1eiMSt3HnvnbAYKbYQlXyz9zuJl6CcFs6rxgzHtKaCLfY+RuXdEmvgqcfktt1fKZ1UzM0D7PulQU62f9KYqG4njit4zDFUkopceC0fgwptRZMUwgWaYGDgdAiSp19qHLjVAkc+NGDEMtYbMcpip0bJi6yYRr+btYLpPU+FKiVuYMwbs45wJ6LFgTy4uSrtb+ef7qBWbM6mR1s3Hn24bqk/L/P8ExP8W7vDTMTM6eqCoc1VCuxwH6cqtAcwq4lkq2yxMC3z0zVdvqjOl2MrTov5ITrP+OZDs4E8DSVeTevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30/npnm769KFH41Tozbsja59vK90orWl772vNwSo8pg=;
 b=o+f52MPvuuq783LUI4UbZrAZcoKFk15+FUkoiRW45slJOKU72LwBTqmlnttfmqc7szgCtAbXTdv3FFftQFg1pA4UeksmjEAWk2zbUnUdNCqql++ni0ZG9u52osmAQQCHUd8L8PiiGmED6auvpSV/MlYcInFkAeEyZOtYqbbRt9gJsyl/mHUl5koeIUtsBlUfF4gibZNDYXhscKDEerHmnxfymfiu0+E3B5vSEvcYuDRlzJxac/Vz+oB1GgNm0o9G4zw0liO5dSVq97e2LdZbSCYU5VBU/KyKePAaVE0mGyoEOQC+9KSQ1dSbtrCj+jjIwxjrnve+dzSPUshv0mwl6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by IA1PR11MB7891.namprd11.prod.outlook.com (2603:10b6:208:3fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 04:33:21 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 04:33:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
CC: "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Topic: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation
 in HDR mode
Thread-Index: AQHbFNtF8WL1idnY80qJByEWkXMYLbJ2EE9JgAADoYCAAALWUoAHx7wAgAAAT+A=
Date: Wed, 9 Oct 2024 04:33:20 +0000
Message-ID: <SN7PR11MB6750D1F3B50ECC79FA88D342E37F2@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241002145503.910536-1-santhosh.reddy.guddati@intel.com>
 <20241002145503.910536-2-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB675059F459088B309491341EE3722@SN7PR11MB6750.namprd11.prod.outlook.com>
 <SN6PR11MB27045F424115435C60CC64D9DB722@SN6PR11MB2704.namprd11.prod.outlook.com>
 <SN7PR11MB6750A1BADDB0334F62DA5420E3722@SN7PR11MB6750.namprd11.prod.outlook.com>
 <SN6PR11MB27047F18FC2823284053C086DB7F2@SN6PR11MB2704.namprd11.prod.outlook.com>
In-Reply-To: <SN6PR11MB27047F18FC2823284053C086DB7F2@SN6PR11MB2704.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|IA1PR11MB7891:EE_
x-ms-office365-filtering-correlation-id: ce8c76b0-0016-4cf5-0562-08dce81b813f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?m01yHKEQBAHO7SYs08xvgbJ1jXM8QN33en8deVqrH1W1nZhRa9EdI/cGZnQ5?=
 =?us-ascii?Q?chURJqf8d3HWLUS6wGzdfpIMOvuGLZSZgS0g3CRV6K3AXJNeVtk+kzrVKzdg?=
 =?us-ascii?Q?Fwykcx0Tf0GHww6dXpb0X32U9uxV1oQPR7iUr3W/JjGEP5icA13KS5UbvZMX?=
 =?us-ascii?Q?uW+/Lrwpih8hutib0tu88m5ecFZGB9k4aV4eJWWxH5H8SIFHdn/AgKqo9SvI?=
 =?us-ascii?Q?MlafA0sxX6o8rsqDmiA7+aANV7eCXvmBkNxj2Wim69sPZphqUhf4SwUwXacj?=
 =?us-ascii?Q?DL2RzYAAsKRsDR8A431dpPdjdlmXi/PPk6Dvu22g2fGawgpHANhF6XfLPlOD?=
 =?us-ascii?Q?0615AbxBZPFf8O+H8HANuA7wNMRxGbHMBQgi6RV2dbjFKuwRa9ssAbHJcu0j?=
 =?us-ascii?Q?7XiwgSv4EQ6/kIEL/3OjIx7ctn7z2UClQd3fsBfD4lpwbF33tUVtbRXdGMpT?=
 =?us-ascii?Q?2thTDvoMjKNmcieoRkdRwysHn5wyAhDhA3MpDfN5HO6HFmiIhB2+SUvqgfum?=
 =?us-ascii?Q?alwNEKUBWeq8iJy6V1iSwDXU8N/rb4/twcbhHoeH9QXYIGmfUToJYapmDab9?=
 =?us-ascii?Q?ZQnqjLpztzUALZk8fW5x3sg2mE9hAcB9bLO+aCFc79lStUlL9fi5BS4cnjPt?=
 =?us-ascii?Q?wuJcDSqZ2XbXNNvjwONoy97jQ2YG9w0Ymr7A3nCNijXwz6lWC/tHiGbeTk+S?=
 =?us-ascii?Q?OslMhw2piZTwa1vasvgaPVXq+dNGRvU+zXPDwU534kHGM08BIPvQQz2hcNIP?=
 =?us-ascii?Q?NOzz++zJQ6AH2PqgUUuM2Hl7FPTCbsr0uzqwYK4ZeiaJvdFa17yiLmoOLSqD?=
 =?us-ascii?Q?F8n9DAWTuXAyjHZ4v3JvzIZagA49Um85y3vtZk7iTXH/JFUzqDfuvw4Pftex?=
 =?us-ascii?Q?pYJnnBrCTSvjcPM+enJ+jveIYuw72MivIMQm19BEBoEdJa3Y5vTHHwV3+yK6?=
 =?us-ascii?Q?xD0MgFFD78piphTmY7fhuDcx2APsv12ZqDLKpYi5VdEgBKWUZtlCNW2TRhPe?=
 =?us-ascii?Q?Qc10O15xbkkWYp3C3jyGvtqykjWPzitgD4ilH0CKYim1VzoBnEUZHHNQHjPi?=
 =?us-ascii?Q?2hQfYBf5U3PlzeSLVIB73uzniEkYeFW1za4xgYkni0BP7i41HApTcU/s1m3P?=
 =?us-ascii?Q?6/HjEnEse/oJAGsGUBjRRBxtXtaRFSFMBFnjtPOOSOOZocT/XOHm55ZaG8yn?=
 =?us-ascii?Q?ZDvp80DMgxqoYE2BKhIxPNo1sLISRJLudYAuvQEWNAl1aCp+u+Pe4sv4jufw?=
 =?us-ascii?Q?7X3XCfoIbTxTjGrnnp/5NiPgprljFxpOHxvCVSFYTB3sAT4VU21TRuDf3bEi?=
 =?us-ascii?Q?RU8sXmSvsyuTTAeWjjqHSiO4JaI8K9aCzrhSsSeymQSwbQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?k+kVx/xZFYtW9SBnugkHjiy1RoL6Li/7sbF+9oBWqyH7+l3vxVMSFhfzkxh3?=
 =?us-ascii?Q?C/Gi+JmHipaPlWaXQW6o7lyLOyFAbe2y7HVdQihsTodhsrzATRzW9Q2sW33N?=
 =?us-ascii?Q?+eO0EwKgsSqIXvMoC4xoOIbpxk9L/sXvVmP4QzUFVGh75cXdugQR1LBj55nj?=
 =?us-ascii?Q?Rexpp/SOQPEWBeOyx654GhXHtFy/WvmfItkEN5DjaKOIosKa4r7j2LnE5UHg?=
 =?us-ascii?Q?8eQtckiocKfpgxwXecbfBNZBkoN8/GeLx6ItoWxQnzDtqaBoxvQzRQQSLF8h?=
 =?us-ascii?Q?E1a7CKDQMgBQIHBkym6SRbpTPdF+aTKRBe4Mez/hk2bjAeO80VK1nuw7WiOL?=
 =?us-ascii?Q?MSDHxleDP+1gkrGlBVA+KGdWGRlylfSMymAJgrSIqZQvZ6h9mWLruG8rEC8y?=
 =?us-ascii?Q?BEuloUv9UwzSUTIn7Hi3yiWQ44yU3HK4jaySLj1ya/t+6x6cwZqDacwpgeHm?=
 =?us-ascii?Q?SWYtwA0/AipvIjpwAwIcvSkZb3pRuJixPSUo9A0Z/Dzp35vB8MG/2Q9AmcS1?=
 =?us-ascii?Q?FeCVzBbt2epE9244Gg76Zx4bJYOdYQMuBymThD2QFJ2zodMP1PYM0CmG82Ms?=
 =?us-ascii?Q?mcWDZK8LGJvcRe6Ci7x+tG/nj6PZKGIPwZiqOCmMgjJBU+NNbxTYx8xVscHd?=
 =?us-ascii?Q?ytV4VB/vcYryj7PHOK+Hjz7j2c+3djXaEqrh27aCjA/EC8BB6Ya/tpIEp3rw?=
 =?us-ascii?Q?xxkgsa0NPEbvUnhqUrXacDMzQx0ZXTE13WbK+x8kr9A61B+H49CzhHRtuHFz?=
 =?us-ascii?Q?lZXr+DYKaoUqno4CodT+lzRrZ31umFczHKbO3Kx42lmYgqyA6Dh2d/XZ57sn?=
 =?us-ascii?Q?DNqlrBtk2vkrcz8atL0RSxbM9iOByDPws+3LJTr+5dtUAwV5IN8VgzSxCjP1?=
 =?us-ascii?Q?XFZL4iNDo5Ybgkdp9Ton7+9qc73kCFgUzB0tYnuCXOa2s88wy2KV8aGtDwt8?=
 =?us-ascii?Q?6wXVt4gccgK+DwmeNW0BbXsiXPHLmeFd5+j2AMyy08bmJgVsUJiiPqZi/ENu?=
 =?us-ascii?Q?lVTlG0eEzMCADPcuF87kYT/G7eKyXuEe4KFE1r5uHCoektVqbw8U5AXz5/aQ?=
 =?us-ascii?Q?sW94JWtjXZiMO2U96vpRFIUoI0FF1edlSd18LVdeqqxnRbZ3NmQYGffOTJXR?=
 =?us-ascii?Q?sBB2YzxYK2FyjJhbBtXBc5aFe6oQJz9WHa39veDbCo8xxSk8EzLiBZibW6X2?=
 =?us-ascii?Q?XFSwddlr7Z0E/wppP/XBGcFrXmFBCOPX+/8DOq7q07rJTjbwMTaf3lUHS4wO?=
 =?us-ascii?Q?w6d+rie7awqnSEmtatHB9dvW4Xh8ip/nUCTeBXr7l26wBPty4il9rX2xRio2?=
 =?us-ascii?Q?6sl3DsPIoyCClwFJmgdNQ/n850ZbbkWry6XrjOLH07yNv1d+tlAEu+/NQLO4?=
 =?us-ascii?Q?syObTM9e5r7IWrlBZFv0N8VS//Fe/cUQo4ixXVhAyiy9VvN1WZQrX2Emw1+p?=
 =?us-ascii?Q?BrpTQCMH9h5nYOkfcNA/yaBA+gYedsAecP+6ORXwfNd3oXlm07FpSpx2At9w?=
 =?us-ascii?Q?RYpDBd2pAOv67PCyGhnAi2Gd9RyrQ5fGUVPXuxrIAQEWBoocNEyVCP4KVYuK?=
 =?us-ascii?Q?olzNtrZbTDUzaq7gJ5TtvWoVBRQf3EfByIeaLtgO?=
Content-Type: multipart/alternative;
 boundary="_000_SN7PR11MB6750D1F3B50ECC79FA88D342E37F2SN7PR11MB6750namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8c76b0-0016-4cf5-0562-08dce81b813f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 04:33:20.9371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13e88mnVBkg4OK69LbKVOi/sev6Zf7U77ZHxQnxOCULTFbXfmhV/PV1HXVUgUwJ8hkihcMFMfE9A5X21oV3vng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7891
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

--_000_SN7PR11MB6750D1F3B50ECC79FA88D342E37F2SN7PR11MB6750namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Sent: Wednesday, October 9, 2024 10:02 AM
To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.org=
; Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
Cc: Samala, Pranay <pranay.samala@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode

++ Bhanu

Hi Suraj,

Thank you for your suggestion regarding code sharing via header file. I hav=
e tried to share across the test files unfortunately in the current igt  se=
tup, we cannot re use with importing the header files.

@Modem, Bhanuprakash<mailto:bhanuprakash.modem@intel.com>,

Could you please help if these functions can be moved to lib/igt_sysfs or l=
ib/igt_kms ?

Or have a separate file in /lib
Igt_brightness


Thanks,
Santhosh
________________________________
From: Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.co=
m>>
Sent: Friday, October 4, 2024 11:14 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santho=
sh.reddy.guddati@intel.com>>; igt-dev@lists.freedesktop.org<mailto:igt-dev@=
lists.freedesktop.org> <igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.=
freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode



________________________________
From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:sant=
hosh.reddy.guddati@intel.com>>
Sent: Friday, October 4, 2024 11:02:42 am
To: Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.com>=
>; igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <igt=
-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>
Subject: RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode


Hi Suraj,

Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .
I plan to move these functions "backlight_read" , "backlight_write" to lib/=
igt_sysfs and make the necessary modifications at a later stage.



Please provide your thoughts on this approach.

_____________



Why not just some simple code sharing via a header file rather than the who=
le lib/igt_sysfs complexity.



Regards,
Suraj
____________
Regards,
Santhosh



From: Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.co=
m>>
Sent: Friday, October 4, 2024 10:50 AM
To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santho=
sh.reddy.guddati@intel.com>>; igt-dev@lists.freedesktop.org<mailto:igt-dev@=
lists.freedesktop.org>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santhos=
h.reddy.guddati@intel.com>>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulati=
on in HDR mode



From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:sant=
hosh.reddy.guddati@intel.com>>

Sent: Wednesday, October 2, 2024 8:26:33 pm
To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org> <ig=
t-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>>
Cc: Samala, Pranay <pranay.samala@intel.com<mailto:pranay.samala@intel.com>=
>; Kandpal, Suraj <suraj.kandpal@intel.com<mailto:suraj.kandpal@intel.com>>=
; Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com<mailto:santhosh=
.reddy.guddati@intel.com>>
Subject: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipulation i=
n HDR mode



Add subtest for backlight control on hdr enabled edp panels
by changing brightness via sysfs.

v2: adjust brightness range, refactor and restore brightness (Pranay)

v3: reuse functions, add flags to avoid duplicate code (Suraj)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com<mai=
lto:santhosh.reddy.guddati@intel.com>>
---
 tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f123c6b36..0f07e770b 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -64,6 +64,10 @@
  * Description: Tests static toggle with suspend
  * Functionality: colorspace, static_hdr, suspend
  *
+ * SUBTEST: brightness-with-hdr
+ * Description: Tests brightness with HDR
+ * Functionality: colorspace, static_hdr
+ *
  * SUBTEST: static-%s
  * Description: Tests %arg[1].
  * Functionality: colorspace, static_hdr
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bp=
c switch");
 #define HDR_STATIC_METADATA_BLOCK       0x06
 #define USE_EXTENDED_TAG                0x07

+#define INTEL_BACKLIGHT_PATH "/sys/class/backlight/intel_backlight"
+
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
 enum hdmi_metadata_type {
         HDMI_STATIC_METADATA_TYPE1 =3D 0,
@@ -100,6 +106,7 @@ enum {
         TEST_SWAP =3D 1 << 3,
         TEST_INVALID_METADATA_SIZES =3D 1 << 4,
         TEST_INVALID_HDR =3D 1 << 5,
+       TEST_BRIGHTNESS =3D 1 << 6,
 };

 /* BPC connector state. */
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)
         meta->hdmi_metadata_type1.max_cll =3D 500;   /* 500 nits */
 }

+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/
+static void adjust_brightness(data_t *data, uint32_t flags)



-----------------

 Do we not have a function in kms_brightness to manipulate brightness let's=
 reuse that rather than writing the whole function here



Regards,

Suraj Kandpal



----------------------
+{
+       char brightness_path[1024];
+       int brightness_fd;
+       char brightness_value[64];
+       int current_brightness;
+       int max_brightness;
+       int read_brightness;
+       int fd, i;
+
+       /* Get max brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "max_brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       max_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       /* Get current brightness */
+       snprintf(brightness_path, sizeof(brightness_path),
+                "%s/%s", INTEL_BACKLIGHT_PATH, "brightness");
+       fd =3D open(brightness_path, O_RDONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       igt_assert(read(fd, brightness_value, sizeof(brightness_value)) > 0=
);
+
+       current_brightness =3D atoi(brightness_value);
+
+       close(fd);
+
+       for (i =3D 0; i <=3D max_brightness; i +=3D 50) {
+               fd =3D open(brightness_path, O_WRONLY);
+               igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_p=
ath);
+
+               snprintf(brightness_value, sizeof(brightness_value), "%d", =
i);
+               igt_assert(write(fd, brightness_value, strlen(brightness_va=
lue)) > 0);
+
+               close(fd);
+
+               /* Verify brightness adjustment */
+               fd =3D open(brightness_path, O_RDONLY);
+               igt_assert(fd >=3D 0);
+
+               igt_assert(read(fd, brightness_value, sizeof(brightness_val=
ue)) > 0);
+
+               read_brightness =3D atoi(brightness_value);
+
+               igt_assert_eq(read_brightness, i);
+
+               close(fd);
+       }
+
+       fd =3D open(brightness_path, O_WRONLY);
+       igt_assert_f(fd >=3D 0, "Failed to open %s\n", brightness_path);
+
+       snprintf(brightness_value, sizeof(brightness_value), "%d", current_=
brightness);
+       igt_assert(write(brightness_fd, brightness_value, strlen(brightness=
_value)) > 0);
+
+       close(fd);
+}
+
 static void test_static_toggle(data_t *data, enum pipe pipe,
                                igt_output_t *output,
                                uint32_t flags)
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,
                 igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown=
 EOTF [0-9]+\""), 0);
                 goto cleanup;
         }
+       if (flags & TEST_BRIGHTNESS)
+               adjust_brightness(data, flags);
+
         igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);

         /* Verify that the CRC are equal after DPMS or suspend. */
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)

                         igt_dynamic_f("pipe-%s-%s",
                                       kmstest_pipe_name(pipe), output->nam=
e) {
-                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND | TEST_INVALID_HDR))
+                               if (flags & (TEST_NONE | TEST_DPMS | TEST_S=
USPEND |
+                                            TEST_INVALID_HDR | TEST_BRIGHT=
NESS))
                                         test_static_toggle(data, pipe, out=
put, flags);
                                 if (flags & TEST_SWAP)
                                         test_static_swap(data, pipe, outpu=
t);
@@ -734,6 +811,10 @@ igt_main
         igt_subtest_with_dynamic("static-toggle-suspend")
                 test_hdr(&data, TEST_SUSPEND);

+       igt_describe("Tests brightness while entering and exiting HDR mode"=
);
+       igt_subtest_with_dynamic("brightness-with-hdr")
+               test_hdr(&data, TEST_BRIGHTNESS);
+
         igt_describe("Tests swapping static HDR metadata");
         igt_subtest_with_dynamic("static-swap")
                 test_hdr(&data, TEST_SWAP);
--
2.34.1




--_000_SN7PR11MB6750D1F3B50ECC79FA88D342E37F2SN7PR11MB6750namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Reddy Guddati, Santhosh &lt;sa=
nthosh.reddy.guddati@intel.com&gt;
<br>
<b>Sent:</b> Wednesday, October 9, 2024 10:02 AM<br>
<b>To:</b> Kandpal, Suraj &lt;suraj.kandpal@intel.com&gt;; igt-dev@lists.fr=
eedesktop.org; Modem, Bhanuprakash &lt;bhanuprakash.modem@intel.com&gt;<br>
<b>Cc:</b> Samala, Pranay &lt;pranay.samala@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">++ Bhanu<br>
<br>
Hi Suraj,<br>
<br>
Thank you for&nbsp;your suggestion regarding code sharing via header file. =
I have tried to share across the test files unfortunately in the current ig=
t&nbsp; setup, we cannot re use with importing the header files.<br>
<br>
<a id=3D"OWAAM179493" href=3D"mailto:bhanuprakash.modem@intel.com"><span st=
yle=3D"font-family:&quot;Aptos&quot;,sans-serif;text-decoration:none">@Mode=
m, Bhanuprakash</span></a>,<br>
<br>
Could you please help if these functions can be moved to lib/igt_sysfs or l=
ib/igt_kms ?</span><o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Or have a separate =
file in /lib<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Igt_brightness <o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><br>
<br>
Thanks,<br>
Santhosh<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Kandpa=
l, Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel.com">suraj.kandpal@intel=
.com</a>&gt;<br>
<b>Sent:</b> Friday, October 4, 2024 11:14 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.gud=
dati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt;;
<a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com">pr=
anay.samala@intel.com</a>&gt;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div id=3D"x_mail-editor-reference-message-container">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"MsoNormal"><strong><span style=3D"font-size:11.0pt;font-family:=
&quot;Aptos&quot;,sans-serif">From:</span></strong><span style=3D"font-size=
:11.0pt"> Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.gudd=
ati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Sent:</spa=
n></strong> Friday, October 4, 2024 11:02:42 am<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">To:</span>=
</strong> Kandpal, Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel.com">sur=
aj.kandpal@intel.com</a>&gt;;
<a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.=
freedesktop.org</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Cc:</span>=
</strong> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com">pra=
nay.samala@intel.com</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Subject:</=
span></strong> RE: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness mani=
pulation in HDR mode<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"xmsonormal">Hi Suraj,<br>
<br>
Agreed, we do have similar functionality in kms_brightness, but it requires=
 some adjustments .<br>
I plan to move these functions &#8220;backlight_read&#8221; , &#8220;backli=
ght_write&#8221; to lib/igt_sysfs and make the necessary modifications at a=
 later stage.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Please provide your thoughts on this approach.<o:p>=
</o:p></p>
<p class=3D"xmsonormal">_____________<o:p></o:p></p>
<p class=3D"xmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xmsonormal">Why not just some simple code sharing via a header =
file rather than the whole lib/igt_sysfs complexity.<o:p></o:p></p>
<p class=3D"xmsonormal"><o:p>&nbsp;</o:p></p>
<p class=3D"xmsonormal">Regards,<br>
Suraj<br>
____________<br>
Regards,<br>
Santhosh<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xmsonormal"><b><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt=
;font-family:&quot;Calibri&quot;,sans-serif"> Kandpal, Suraj &lt;<a href=3D=
"mailto:suraj.kandpal@intel.com">suraj.kandpal@intel.com</a>&gt;
<br>
<b>Sent:</b> Friday, October 4, 2024 10:50 AM<br>
<b>To:</b> Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.gud=
dati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt;;
<a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.=
org</a><br>
<b>Cc:</b> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com">pr=
anay.samala@intel.com</a>&gt;; Reddy Guddati, Santhosh &lt;<a href=3D"mailt=
o:santhosh.reddy.guddati@intel.com">santhosh.reddy.guddati@intel.com</a>&gt=
;<br>
<b>Subject:</b> Re: [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness man=
ipulation in HDR mode</span><o:p></o:p></p>
</div>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"xmsonormal"><strong><span style=3D"font-size:11.0pt;font-family=
:&quot;Aptos&quot;,sans-serif">From:</span></strong><span style=3D"font-siz=
e:11.0pt"> Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.gud=
dati@intel.com"><span style=3D"color:#467886">santhosh.reddy.guddati@intel.=
com</span></a>&gt;</span><o:p></o:p></p>
</div>
<div id=3D"x_mail-editor-reference-message-container">
<div id=3D"x_divRplyFwdMsg">
<p class=3D"xmsonormal"><strong><span style=3D"font-size:11.0pt;font-family=
:&quot;Aptos&quot;,sans-serif">Sent:</span></strong><span style=3D"font-siz=
e:11.0pt"> Wednesday, October 2, 2024 8:26:33 pm<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">To:</span>=
</strong> <a href=3D"mailto:igt-dev@lists.freedesktop.org">
<span style=3D"color:#467886">igt-dev@lists.freedesktop.org</span></a> &lt;=
<a href=3D"mailto:igt-dev@lists.freedesktop.org"><span style=3D"color:#4678=
86">igt-dev@lists.freedesktop.org</span></a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Cc:</span>=
</strong> Samala, Pranay &lt;<a href=3D"mailto:pranay.samala@intel.com"><sp=
an style=3D"color:#467886">pranay.samala@intel.com</span></a>&gt;; Kandpal,=
 Suraj &lt;<a href=3D"mailto:suraj.kandpal@intel.com"><span style=3D"color:=
#467886">suraj.kandpal@intel.com</span></a>&gt;;
 Reddy Guddati, Santhosh &lt;<a href=3D"mailto:santhosh.reddy.guddati@intel=
.com"><span style=3D"color:#467886">santhosh.reddy.guddati@intel.com</span>=
</a>&gt;<br>
<strong><span style=3D"font-family:&quot;Aptos&quot;,sans-serif">Subject:</=
span></strong> [PATCH i-g-t v3 1/1] tests/kms_hdr: Test brightness manipula=
tion in HDR mode</span><o:p></o:p></p>
</div>
<p class=3D"xmsonormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p=
>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">Add subtest for ba=
cklight control on hdr enabled edp panels<br>
by changing brightness via sysfs.<br>
<br>
v2: adjust brightness range, refactor and restore brightness (Pranay)<br>
<br>
v3: reuse functions, add flags to avoid duplicate code (Suraj)<br>
<br>
Signed-off-by: Santhosh Reddy Guddati &lt;<a href=3D"mailto:santhosh.reddy.=
guddati@intel.com"><span style=3D"color:#467886">santhosh.reddy.guddati@int=
el.com</span></a>&gt;<br>
---<br>
&nbsp;tests/kms_hdr.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 82 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c<br>
index f123c6b36..0f07e770b 100644<br>
--- a/tests/kms_hdr.c<br>
+++ b/tests/kms_hdr.c<br>
@@ -64,6 +64,10 @@<br>
&nbsp; * Description: Tests static toggle with suspend<br>
&nbsp; * Functionality: colorspace, static_hdr, suspend<br>
&nbsp; *<br>
+ * SUBTEST: brightness-with-hdr<br>
+ * Description: Tests brightness with HDR<br>
+ * Functionality: colorspace, static_hdr<br>
+ *<br>
&nbsp; * SUBTEST: static-%s<br>
&nbsp; * Description: Tests %arg[1].<br>
&nbsp; * Functionality: colorspace, static_hdr<br>
@@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION(&quot;Test HDR metadata interfaces a=
nd bpc switch&quot;);<br>
&nbsp;#define HDR_STATIC_METADATA_BLOCK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x06<br>
&nbsp;#define USE_EXTENDED_TAG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07<br>
&nbsp;<br>
+#define INTEL_BACKLIGHT_PATH &quot;/sys/class/backlight/intel_backlight&qu=
ot;<br>
+<br>
&nbsp;/* DRM HDR definitions. Not in the UAPI header, unfortunately. */<br>
&nbsp;enum hdmi_metadata_type {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HDMI_STATIC_METADATA_TYPE1=
 =3D 0,<br>
@@ -100,6 +106,7 @@ enum {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_SWAP =3D 1 &lt;&lt; 3=
,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_METADATA_SIZE=
S =3D 1 &lt;&lt; 4,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR =3D 1 &lt=
;&lt; 5,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_BRIGHTNESS =3D 1 &lt;&lt; 6,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;/* BPC connector state. */<br>
@@ -448,6 +455,72 @@ static void fill_hdr_output_metadata_st2048(struct hdr=
_output_metadata *meta)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; meta-&gt;hdmi_metadata_typ=
e1.max_cll =3D 500;&nbsp;&nbsp; /* 500 nits */<br>
&nbsp;}<br>
&nbsp;<br>
+/* TODO: Move adjust_brightness to lib/igt_sysfs to reuse in other tests. =
*/<br>
+static void adjust_brightness(data_t *data, uint32_t flags)</span><o:p></o=
:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p>=
</o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">-----------------<=
/span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">&nbsp;Do we not ha=
ve a function in kms_brightness to manipulate brightness let's reuse that r=
ather than writing the whole function here</span><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p>=
</o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">Regards,</span><o:=
p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">Suraj Kandpal</spa=
n><o:p></o:p></p>
</div>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:11.0pt">&nbsp;</span><o:p>=
</o:p></p>
</div>
<div>
<p class=3D"xmsonormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-=
size:11.0pt">----------------------<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_path[1024];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int brightness_fd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char brightness_value[64];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int current_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int max_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int read_brightness;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int fd, i;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get max brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;max_brightn=
ess&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; max_brightness =3D atoi(brightness_va=
lue);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get current brightness */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_path, sizeof(brig=
htness_path),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; &quot;%s/%s&quot;, INTEL_BACKLIGHT_PATH, &quot;brightness&=
quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_RDONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(read(fd, brightness_value,=
 sizeof(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; current_brightness =3D atoi(brightnes=
s_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt;=3D max_brightnes=
s; i +=3D 50) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_WRONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Failed to open %s\n&quot;, brig=
htness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; snprintf(brightness_value, sizeof(brightness_value), &quot;%d&qu=
ot;, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(write(fd, brightness_value, strlen(brightness_value))=
 &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Verify brightness adjustment */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fd =3D open(brightness_path, O_RDONLY);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(fd &gt;=3D 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert(read(fd, brightness_value, sizeof(brightness_value)) =
&gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; read_brightness =3D atoi(brightness_value);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; igt_assert_eq(read_brightness, i);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; close(fd);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd =3D open(brightness_path, O_WRONLY=
);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(fd &gt;=3D 0, &quot;Fail=
ed to open %s\n&quot;, brightness_path);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(brightness_value, sizeof(bri=
ghtness_value), &quot;%d&quot;, current_brightness);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(write(brightness_fd, brigh=
tness_value, strlen(brightness_value)) &gt; 0);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; close(fd);<br>
+}<br>
+<br>
&nbsp;static void test_static_toggle(data_t *data, enum pipe pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_output_t *output,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags)<br>
@@ -483,6 +556,9 @@ static void test_static_toggle(data_t *data, enum pipe =
pipe,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; igt_assert_eq(system(&quot;dmesg|tail -n 1000|grep -E=
 \&quot;Unknown EOTF [0-9]+\&quot;&quot;), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto cleanup;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_BRIGHTNESS)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; adjust_brightness(data, flags);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_output_bpc_equa=
l(data-&gt;fd, pipe, output-&gt;name, 10);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify that the CRC are=
 equal after DPMS or suspend. */<br>
@@ -685,7 +761,8 @@ static void test_hdr(data_t *data, uint32_t flags)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_d=
ynamic_f(&quot;pipe-%s-%s&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; kmstest_pipe_name(pipe), output-&gt;name) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND | TEST_INVALID_HDR))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; (TEST_NONE | TEST_DPMS | TE=
ST_SUSPEND |<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TEST_INVALID_HDR | TEST_BRIGHTNESS))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_toggle(data, pipe, output, flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (flags &amp; TEST_SWAP)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; test_static_swap(data, pipe, output);<br>
@@ -734,6 +811,10 @@ igt_main<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-toggle-suspend&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SUSPEND);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests brightness w=
hile entering and exiting HDR mode&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&quot;bright=
ness-with-hdr&quot;)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; test_hdr(&amp;data, TEST_BRIGHTNESS);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Tests s=
wapping static HDR metadata&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_with_dynamic(&=
quot;static-swap&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; test_hdr(&amp;data, TEST_SWAP);<br>
-- <br>
2.34.1</span><o:p></o:p></p>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_SN7PR11MB6750D1F3B50ECC79FA88D342E37F2SN7PR11MB6750namp_--
