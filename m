Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558ED58B36
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 05:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9334B10E2F6;
	Mon, 16 Mar 2026 05:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffFw6EG0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1AF10E2F6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 05:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773639668; x=1805175668;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=I0Gkadl6O/OCKzcPWdxd6c0Y1/dm11xijmWdzlcmpuQ=;
 b=ffFw6EG0ZqAc6dL2YXcjv/w03AlXrr2BVkdrrp7JxZFOAUYfoTNLgINu
 +Q//Ao/NOkjFvS5N7UvIzzWgG4rxTFZ/r2v8EjNx5+ZiMXG0AvjiEO/+T
 V3osZ1FHIET/Nkqpder96rKAUS/r9w1qVQd/ioSnqcXf4BZh/LU7zRDQ4
 YMt8KiGvFVqoll0kqR29ow4eL//4WTHW04+aXlwr3qznASg1rhCXY538V
 sktQdHxJZB4d+ye6xsvfnMuV5QoEbRBjmouAxnjHkHkMQVpOilPw6grDQ
 i1qvEjfzegN5qLbKhJ95eaUCDQZBgDMsumPeRZQpl0Kwro53QV/xGtLIN g==;
X-CSE-ConnectionGUID: WLwVB5opRoeH5JO8qAEweg==
X-CSE-MsgGUID: jVFl+DoMRJ67noc5y7ijkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="86126440"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="86126440"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 22:41:07 -0700
X-CSE-ConnectionGUID: S3NkbqPTQ0CcKRmeAM0eMA==
X-CSE-MsgGUID: pWhhkHMERtalnDAj1pb//A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="259702473"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 22:41:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 22:41:05 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 22:41:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 22:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIIcLizOJSvmvVvTFc7GE4MwE00XdpAr0ywTkFdxNtDcApReSy8D+dHsquM/qymq4inrgstaqShU5YxApE00r3Je05+HREGTqAdy+meUV/CaDGwg1SHXJsFvTJwWDec4pMyzPWD9kZAfqdD64NHIUQIwtjYCXO6REoemwh0URUibh0wQPLnTRz7BXJYslRflwor7/dMXoLIHtbllyfUCwH66ZmhjKesIfgrGCGvTFD2dpXnZ4aivJRkp7EYthc3rq09lEwceTha95f1HNzlJjk/xbxUSBmDaRcfwrn133KL2AIpqCZx8msS5IH4cOhHCV5HvdGflTuk8CU+J/8Or0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XHjQMq5sr0rUgELyNVwahBHI2ooC5K8V8cCXTHG+/s=;
 b=l5AVCBTKutLQgyFhCc9/I4hGbeliBUVuan2Mob32elYMBNQHgF7mwzlNbMmHVtkcRh4p2jBcA4Wof9HEmzgCEMaDyP5A9aCgm/Hfdfc71H2T2keSkvb9C2kcJZ5JD1DOFOqSwp8CE0lWnhJEDnjedhP2svgM6ogBj2APmsXcn+UX+lTRpdGjY8ndY8DK1zxjgx8Yn+zg1590wzLyJc4+SxFEWPTiNsKBWbn65M8Ji7gBttgjco9bTVf1nJHK8a+057Jg9GTV7ITr/zSgnD700k0yXh3BixD6n8ZvNqWfueiYK2FaOCU5Bt8CTQO/DdGNlBEA0Wcs4RYLZkVR0R3S+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:41:03 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 05:41:03 +0000
Message-ID: <7516189e-9038-46d1-89f3-b771c37d16a9@intel.com>
Date: Mon, 16 Mar 2026 11:10:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,3/6] lib/igt_serial: add generic serial communication
 helper
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20260225212859.876713-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0041.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 29796628-fde7-4b3b-39fb-08de831e9c4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 2AVj9KFFGwSn/RIJ3hgW25VR8WW3qABYXWRZKCkYQnaTJ6Ii6eVTNObFZHi4ovlx8eOrFQvSSd6USd6pS3zyaDqFCFDXW+hSDNyhBofhuXGFJiFh+8gHOQn61Ka5XqQGQz4wpqTkRZApV9aWulVuoMjctM5+vUgmcQQwbC2H/n5QeWXW0MmJ+MKBf3nXVDe0UaAbCCVOfOL++Q543ycDQeYyyTwFVC2YcSo5NXYeaqiVQiKU415IOQGU5w+oHEufPSe/2x3vILCbLXSq/Y8ETH4tmaVO8yyVV4b17gEf3ZmUqX6fmqExoxX2TAPh6czS24DBTO8X5qhqEi+WbB1tCClr1VFon1WewIrwOMFaqxvCMOd/vNwq1YGk2QMd49mZZXomXyny+OG8tIjKNdfySBL2DbkPerpST+WpHM3o+uB6s8INmbPybZqgFg2mn3M0HEJubQ+hs7SHZmK6qYLL3oy7REaCJegSCTKSo0UMfxDVfKg9nPAWD0W/r1E3TbrZdulhOzazA9TW72JYBFTZ9Ra3Fnwdr2gvYQKVuUfrJb+VePAo7ik44eEym3gKe8rD5jSik3idXKfojL2XUJM+5ESWGckBKeL6J8Rhn/g2PAsQ8c/k1bwrhc6uiHWT8nBgIgh76fYts+vn4N3wgFzPIdQikgGjpIFqaTLb7L2+yTv3W/u2sRvRD1bzfljiJPvVD6tCBSGagD3brrhluHgZW7LqayIlR7l5kYFlm67zSFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OThDWFFTVDRUTVRKN1NXY3hJT1J4OGdHZ3dpaXpicGtjLzBtTm5qclFDVXNO?=
 =?utf-8?B?L1J3bktHdFNCNWIwQzNZRVluZHk2K2FyZzlZbjFoS21ITzJ1cERXVXRYVkxS?=
 =?utf-8?B?TkJyR21xYTVzNHJ4eWF1OGh5RklyaUs1ZzVZZ2lHSTJ2ZEMzamVvQzBtZFZj?=
 =?utf-8?B?TUVmWmJna0lUTVM2enp0VldxSk43Vm0zbDRpNUs0K2NITTY2Qkpac0RjUkpN?=
 =?utf-8?B?dDFDREUyanUrT21NK1FUQXI4SFdZTUlDT0tDUFlPenh0eWo4QjhzbHJ3RTJJ?=
 =?utf-8?B?N2o4ekNnNzk1RlFsbTNmdHJDT1pHY1RUR3E3SS82eU5WVXhHcTJYcExxT2dE?=
 =?utf-8?B?WHFEUjhMNjBSdlRwZlRqQmtBUk5SS2NLMVJ3bmc5VG5PWGx0ZUlBYnBOYXJi?=
 =?utf-8?B?WmxNTmF0eHpCSzQxdzhFdFQvMGh3QTBTT1c4dWhZU1p0NVFoV3lzcW41bjc4?=
 =?utf-8?B?U2F6Njl0SWg2T05RdUwwS1hmdjVCd083dnM2cFdhYTB1WlBwY2NZemN6eFZV?=
 =?utf-8?B?N1dDOW05dU9acmxpNUk0TXFGdmFSZzZaOXZ4WENnRC8veXRjbjhyRk1tRlVy?=
 =?utf-8?B?RFRFdEhpOVhLc1VvMDNCTHluKytvaEttYzM5T0lLUmljc0htYzFBMzZZQkNn?=
 =?utf-8?B?L0drUXoxbFgrTWVIS3c0d1ZONHlGMGtsdGF4Q0tWTFViT1Q4UFA0ajU0cnZu?=
 =?utf-8?B?V2NaWmFGd1VyUnVTU1h5eUMxNXViKzhVUG02ZVFpMjlHbVI0MVMyeE5vQkYy?=
 =?utf-8?B?MEo1ZUd6cjdlTzdXdUlpWExEaGk4cnRSYndON3pkTXQrb0hEa01ZdHVxekd4?=
 =?utf-8?B?czBNbXFRQ0ZoeDFkZjl3b1FMS3FmZW90YjRFRXhQTTJEVTlvODlsZmdyb3g3?=
 =?utf-8?B?ZXRGN3orMVRsSlE2YnBuR2tlSG1NY2Q5dHRXTXVjcVZIMmJRUUpFeFJvMCt4?=
 =?utf-8?B?WG1USnlleSsxbzdhMWxmUjZNdUdiZEtJWjlIeHQxUE04ekFpTVFZQi8wb3h0?=
 =?utf-8?B?eWtvVEh4YzlEWUxHOENmWVFaYVp0R05uSDUyTTQ1VUQxRWlEeklYU0xPYmxv?=
 =?utf-8?B?QWNBWGh5cUxPSExJWW9vRnlmeGVmT1ZEQWtsU3h0N1dqeFI3aWw1Z1ZKMDdU?=
 =?utf-8?B?YVczS0pNOWlPUmlpNm52TmFaTnhWQnhkTUNEaVpDNHA5OXNDOWppb2xYT29B?=
 =?utf-8?B?U0NBT01UOHZUaVllTjduYldRUFRMNDFib0NWK1d0Q3NwM0l6S20rVGw0TnZF?=
 =?utf-8?B?Qm5odGtjdnFPaFUwWGtKVFZBMG90MnJyOC80aXliSUR0ZWE4cmtmVUVmSmNs?=
 =?utf-8?B?UUVrdG1lUVJoU1RPQVUrQlJwd1F2bDJiT1J3K2xSaHBBejJXZGN3V1A3NnZS?=
 =?utf-8?B?S3NPcHcxcVRwWTMwZ29jQ0UrN1orNDVJdlFMbnNlSWMrQXVUWHF0dWc3NG15?=
 =?utf-8?B?NUQ0a2I5TlI2MWJqdnh0ZDBNV011ZG1ZVHdRaklnL1JXRWR6ZngzVmlLZ3d3?=
 =?utf-8?B?cDNFdzFoZFNiem9WNm96bTRwVDVtQ0VxMHkrVlhNM0t0S3pRZ1dsbzZEdzYw?=
 =?utf-8?B?S25tS0EzUTRYSFk1dVlWQmltdWNDZldRZllEeXBHckRMRGcyUmFkWnhlb1dE?=
 =?utf-8?B?OVZtSC9vYzM0cWVxZ285SGZSY0hGRjUwNllQU0lNOXFVcTJMVWtrZEIxZWtZ?=
 =?utf-8?B?NmNoTnVEbFpJb1BtVDBLU0wrNDg4QkJqd3BrbzNxaTRPc3Znd1N2UVV5akNh?=
 =?utf-8?B?azZxbHlnTmlHUmhwUllnM2hSYXNXdEtLem1ab3pEM0tIQmxqUTZwdXlpck1L?=
 =?utf-8?B?TjNCRzB4dXMycCt1aEwxOXdVOGhOMFBKM2NnVTZtdjcybVMxaDJMNWV4dnlu?=
 =?utf-8?B?TzhNQWhZdjNja0JENmV4cGh6dm03cDBVV0h1K2VGMzZoMmZmb2VYQlowQndj?=
 =?utf-8?B?ejVESi9UbnZaeGhUanQzeVpwTG10TGovSnNsajRmY0IzRjNKVVBPRVl3RVQv?=
 =?utf-8?B?OVloR1ZFdmkydEJwNzhrSWNBMlQ5Y3o4TEpyWVJWSElKUVdubmdxekxNVytz?=
 =?utf-8?B?dE5GRWIvaE1VaFhPWXpVNmI5TSs3aXJmT0V0RDhrMGdONTlyaG5LMmNMTy9h?=
 =?utf-8?B?OUVUSDh1eWhRWDlud2kzMFp3YzFkN0RCMnR4SGlNM3huRDF1eTZ1SjFpWGcy?=
 =?utf-8?B?V3EySUFaMEN1L2FaN2NacElqWDNTZjhpMDd2UmxPaTBIenlyci9xeVNLc3JN?=
 =?utf-8?B?algrUWVuYWNWT3RQdG1WbUtTSnA1THA2RFhHMXNZT3ZDSXpwSnJ3ZTZ4cWFy?=
 =?utf-8?B?b1R0cjh3WlFpR0xUYmE0ODY2cXpyVEZWNi9CQjk3YWNicEg3Umo3dz09?=
X-Exchange-RoutingPolicyChecked: j/4SrcDKYofs02rXQmG/ZdmbYdAdQZ9zuNHYpNUBdWmosklWkaZbEYTZqkxHWYTKGbr1pIDhHtSPhaOjflqAuWIQq9tdzh+2xI7/vf/7HsalfkqDFbFhTNPFe8pCj/RXG0lwyCrUvSDj2V3ZwS2ynXyBTCgCP9Ejt4VxiQb/mlnv7tcdDynSn/B++M2A/QE0OUvZVV2Z9C2i5AkjLHchUpdiVwGcWTHi91rA8EA36lIksq/e17F2yLcLui7mPI3JpUm/d1EFAVdwNlmflQrVHaz9DOcsnc6XVH1HtKGCoZoQGW8FHVEKK3EFwW1EJpQh5rbKoCx4zCNGXvGtUTdN+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29796628-fde7-4b3b-39fb-08de831e9c4d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:41:03.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ1vBfYZimjTh+r9azJxcH8cySmC/8XBOx78VW1FwLOT2yRG23feXbP+qJiWKFuAVtfBSv6Jbusg70fkTcmIpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

Logic looks good to me.
  Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

On 26-02-2026 02:58, Kunal Joshi wrote:
> Add a reusable serial communication library for host-to-device
>
>   - igt_serial_open()/close(): lifecycle with configurable baud rate
>   - igt_serial_send()/read(): raw data transfer
>   - igt_serial_command(): send command and capture response
>   - igt_serial_flush(): drain stale data from receive buffer
>   - igt_serial_set_timeout(): adjust per-operation VTIME timeouts
>
> Used by lib/igt_usb4_switch to communicate with the Microsoft USB4
> Switch 3141 over its serial/USB interface.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   lib/igt_serial.c | 435 +++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_serial.h |  32 ++++
>   lib/meson.build  |   1 +
>   3 files changed, 468 insertions(+)
>   create mode 100644 lib/igt_serial.c
>   create mode 100644 lib/igt_serial.h
>
> diff --git a/lib/igt_serial.c b/lib/igt_serial.c
> new file mode 100644
> index 000000000..35fbadd7c
> --- /dev/null
> +++ b/lib/igt_serial.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +/**
> + * SECTION:igt_serial
> + * @short_description: Generic serial port communication library
> + * @title: Serial Communication
> + * @include: igt_serial.h
> + *
> + * This library provides a clean API for serial port communication,
> + * useful for test equipment that uses serial/USB-CDC interfaces.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <termios.h>
> +#include <unistd.h>
> +
> +#include "igt_core.h"
> +#include "igt_serial.h"
> +
> +struct igt_serial {
> +	int fd;
> +	char *device;
> +	struct termios orig_termios;
> +	bool termios_saved;
> +	int read_timeout_ds;
> +};
> +
> +static speed_t baud_to_speed(int baud)
> +{
> +	switch (baud) {
> +	case 9600:   return B9600;
> +	case 19200:  return B19200;
> +	case 38400:  return B38400;
> +	case 57600:  return B57600;
> +	case 115200: return B115200;
> +	case 230400: return B230400;
> +	case 460800: return B460800;
> +	case 921600: return B921600;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/**
> + * igt_serial_open:
> + * @device: path to the serial device (e.g., "/dev/ttyACM0")
> + * @baud_rate: baud rate (e.g., 115200)
> + *
> + * Opens a serial port with the specified baud rate.
> + * Uses 8N1 configuration (8 data bits, no parity, 1 stop bit).
> + *
> + * Returns: A serial handle on success, NULL on failure.
> + */
> +struct igt_serial *igt_serial_open(const char *device, int baud_rate)
> +{
> +	struct igt_serial *s;
> +	struct termios tty;
> +	speed_t speed;
> +
> +	if (!device) {
> +		igt_debug("Serial: NULL device path\n");
> +		return NULL;
> +	}
> +
> +	s = calloc(1, sizeof(*s));
> +	if (!s) {
> +		igt_debug("Serial: Failed to allocate memory\n");
> +		return NULL;
> +	}
> +
> +	s->fd = -1;
> +
> +	s->device = strdup(device);
> +	if (!s->device)
> +		goto err_free;
> +
> +	/* Default timeout: 1 second (10 deciseconds) */
> +	s->read_timeout_ds = 10;
> +	s->fd = open(device, O_RDWR | O_NOCTTY);
> +
> +	if (s->fd < 0) {
> +		igt_debug("Serial: Failed to open %s: %s\n",
> +			  device, strerror(errno));
> +		goto err_free_device;
> +	}
> +
> +	if (tcgetattr(s->fd, &tty) != 0) {
> +		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
> +		goto err_close;
> +	}
> +
> +	s->orig_termios = tty;
> +	s->termios_saved = true;
> +	speed = baud_to_speed(baud_rate);
> +
> +	if (!speed) {
> +		igt_debug("Serial: Unsupported baud rate %d\n", baud_rate);
> +		goto err_close;
> +	}
> +
> +	cfsetospeed(&tty, speed);
> +	cfsetispeed(&tty, speed);
> +
> +	/* 8N1: 8 data bits, no parity, 1 stop bit */
> +	tty.c_cflag &= ~PARENB;
> +	tty.c_cflag &= ~CSTOPB;
> +	tty.c_cflag &= ~CSIZE;
> +	tty.c_cflag |= CS8;
> +	tty.c_cflag &= ~CRTSCTS;
> +	tty.c_cflag |= CREAD | CLOCAL;
> +
> +	/* Disable canonical mode, echo, and signals */
> +	tty.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
> +
> +	/* Disable output post-processing */
> +	tty.c_oflag &= ~OPOST;
> +
> +	/* Disable software flow control and input translations */
> +	tty.c_iflag &= ~(IXON | IXOFF | IXANY);
> +	tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP |
> +			  INLCR | IGNCR | ICRNL);
> +
> +	/*
> +	 * Blocking read with timeout.
> +	 * VMIN=0, VTIME>0: return after timeout or when data available.
> +	 */
> +	tty.c_cc[VMIN] = 0;
> +	tty.c_cc[VTIME] = s->read_timeout_ds;
> +
> +	if (tcsetattr(s->fd, TCSANOW, &tty) != 0) {
> +		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
> +		goto err_close;
> +	}
> +
> +	/* Flush any stale input */
> +	if (tcflush(s->fd, TCIFLUSH) != 0)
> +		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
> +
> +	igt_debug("Serial: Opened %s at %d baud (timeout=%dms)\n",
> +		  s->device, baud_rate, s->read_timeout_ds * 100);
> +	return s;
> +
> +err_close:
> +	close(s->fd);
> +err_free_device:
> +	free(s->device);
> +err_free:
> +	free(s);
> +	return NULL;
> +}
> +
> +/**
> + * igt_serial_close:
> + * @s: serial handle
> + *
> + * Closes the serial port and frees resources.
> + */
> +void igt_serial_close(struct igt_serial *s)
> +{
> +	if (!s)
> +		return;
> +
> +	if (s->termios_saved) {
> +		if (tcsetattr(s->fd, TCSANOW, &s->orig_termios) != 0)
> +			igt_debug("Serial: tcsetattr restore failed: %s\n",
> +				  strerror(errno));
> +	}
> +
> +	if (s->fd >= 0)
> +		close(s->fd);
> +	igt_debug("Serial: Closed %s\n", s->device ? s->device : "(unknown)");
> +	free(s->device);
> +	free(s);
> +}
> +
> +/**
> + * igt_serial_set_timeout:
> + * @s: serial handle
> + * @timeout_ms: timeout in milliseconds (0 enables polling mode)
> + *
> + * Sets the read timeout for the serial port. VTIME has a granularity
> + * of 100 ms (deciseconds); non-zero values are rounded up. Setting
> + * @timeout_ms to 0 configures polling mode where reads return
> + * immediately if no data is available.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms)
> +{
> +	struct termios tty;
> +	int new_timeout_ds;
> +
> +	if (!s || timeout_ms < 0)
> +		return false;
> +
> +	if (tcgetattr(s->fd, &tty) != 0) {
> +		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +
> +	/* Convert ms to deciseconds (0.1s units), clamp to cc_t max (255) */
> +	new_timeout_ds = (timeout_ms + 99) / 100;
> +	if (new_timeout_ds > 255)
> +		new_timeout_ds = 255;
> +
> +	tty.c_cc[VTIME] = new_timeout_ds;
> +
> +	if (tcsetattr(s->fd, TCSANOW, &tty) != 0) {
> +		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +	s->read_timeout_ds = new_timeout_ds;
> +	igt_debug("Serial: Timeout set to %dms (applied %dms)\n",
> +		  timeout_ms, s->read_timeout_ds * 100);
> +	return true;
> +}
> +
> +/**
> + * igt_serial_send:
> + * @s: serial handle
> + * @cmd: command string to send
> + *
> + * Sends a command string to the serial port exactly as provided.
> + * The caller is responsible for adding any required line endings.
> + * Handles short writes that may occur on USB-CDC devices under load.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool igt_serial_send(struct igt_serial *s, const char *cmd)
> +{
> +	size_t len, total = 0;
> +	ssize_t written;
> +
> +	if (!s || !cmd)
> +		return false;
> +
> +	len = strlen(cmd);
> +	if (len == 0)
> +		return true;
> +
> +	while (total < len) {
> +		written = write(s->fd, cmd + total, len - total);
> +		if (written <= 0) {
> +			if (written < 0 && errno == EINTR)
> +				continue;
> +			igt_debug("Serial: Write failed: %s\n",
> +				  written < 0 ? strerror(errno) : "zero bytes written");
> +			return false;
> +		}
> +		total += written;
> +	}
> +
> +	if (tcdrain(s->fd) != 0) {
> +		igt_debug("Serial: tcdrain failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +
> +	igt_debug("Serial: Sent '%s'\n", cmd);
> +	return true;
> +}
> +
> +/*
> + * igt_serial_readline - Read a line from serial port (until newline or timeout).
> + *
> + * Returns number of bytes in buf (0 means timeout/no data), or -1 on error.
> + */
> +static ssize_t igt_serial_readline(struct igt_serial *s, char *buf, size_t size)
> +{
> +	size_t total = 0;
> +	ssize_t n;
> +
> +	if (!s || !buf || size == 0)
> +		return -1;
> +
> +	/*
> +	 * Read one byte at a time until newline or timeout.
> +	 * VTIME timeout ensures read() returns 0 on timeout.
> +	 */
> +	while (total < size - 1) {
> +		n = read(s->fd, buf + total, 1);
> +		if (n < 0) {
> +			if (errno == EINTR)
> +				continue;
> +			igt_debug("Serial: Read error: %s\n", strerror(errno));
> +			return -1;
> +		}
> +		if (n == 0)
> +			break;
> +
> +		total++;
> +
> +		if (buf[total - 1] == '\n')
> +			break;
> +	}
> +
> +	buf[total] = '\0';
> +	return (ssize_t)total;
> +}
> +
> +/**
> + * igt_serial_read:
> + * @s: serial handle
> + * @buf: buffer to read into
> + * @size: size of buffer
> + *
> + * Reads one line (up to newline or timeout) from the serial port.
> + * This is a line-oriented read, not an arbitrary byte read — it stops
> + * at the first newline character or when the VTIME timeout expires.
> + * Use igt_serial_set_timeout() to adjust the timeout before calling.
> + *
> + * Returns: Number of bytes read, 0 on timeout/no data, or -1 on error.
> + */
> +ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size)
> +{
> +	ssize_t n;
> +
> +	n = igt_serial_readline(s, buf, size);
> +
> +	igt_debug("Serial: Read %zd bytes: '%s'\n", n, n > 0 ? buf : "");
> +	return n;
> +}
> +
> +/**
> + * igt_serial_command:
> + * @s: serial handle
> + * @cmd: command string to send
> + * @response: buffer for response
> + * @resp_size: size of response buffer
> + *
> + * Convenience function to send a command and read the response.
> + * Flushes stale input before sending, sends the command, then reads
> + * one response line. If @response is non-NULL, at least one byte must
> + * be received before the configured VTIME timeout for success.
> + *
> + * Returns: true if the send succeeded and, when @response is given,
> + * at least one response byte was received; false otherwise.
> + */
> +bool igt_serial_command(struct igt_serial *s, const char *cmd,
> +			char *response, size_t resp_size)
> +{
> +	ssize_t n;
> +
> +	if (!s || !cmd)
> +		return false;
> +
> +	igt_serial_flush(s);
> +
> +	if (!igt_serial_send(s, cmd))
> +		return false;
> +
> +	if (response && resp_size > 0) {
> +		n = igt_serial_readline(s, response, resp_size);
> +		if (n <= 0) {
> +			igt_debug("Serial: No response received\n");
> +			return false;
> +		}
> +		igt_debug("Serial: Response: '%s'\n", response);
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * igt_serial_flush:
> + * @s: serial handle
> + *
> + * Discards stale input. Does not touch pending output.
> + * Calls TCIFLUSH to drop kernel-queued input, then temporarily sets
> + * O_NONBLOCK and drains any bytes already readable to reduce races
> + * with in-flight input. Assumes single-threaded access.
> + */
> +void igt_serial_flush(struct igt_serial *s)
> +{
> +	char discard[256];
> +	ssize_t n;
> +	int flags;
> +
> +	if (!s)
> +		return;
> +
> +	/* Discard kernel-queued input; never touch pending output */
> +	if (tcflush(s->fd, TCIFLUSH) != 0)
> +		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
> +
> +	/* Drain bytes already readable to reduce races with in-flight input */
> +	flags = fcntl(s->fd, F_GETFL);
> +	if (flags < 0) {
> +		igt_debug("Serial: fcntl(F_GETFL) failed: %s\n", strerror(errno));
> +		return;
> +	}
> +
> +	if (fcntl(s->fd, F_SETFL, flags | O_NONBLOCK) < 0) {
> +		igt_debug("Serial: fcntl(F_SETFL) failed: %s\n", strerror(errno));
> +		return;
> +	}
> +
> +	for (;;) {
> +		n = read(s->fd, discard, sizeof(discard));
> +		if (n > 0)
> +			continue;
> +		if (n == 0)
> +			break;
> +		/* n < 0 */
> +		if (errno == EINTR)
> +			continue;
> +		if (errno != EAGAIN)
> +			igt_debug("Serial: unexpected read error in flush: %s\n",
> +				  strerror(errno));
> +		break;
> +	}
> +
> +	if (fcntl(s->fd, F_SETFL, flags) < 0)
> +		igt_debug("Serial: fcntl(F_SETFL) restore failed: %s\n", strerror(errno));
> +
> +	igt_debug("Serial: Flushed\n");
> +}
> +
> +/**
> + * igt_serial_get_fd:
> + * @s: serial handle
> + *
> + * Gets the underlying file descriptor for advanced operations.
> + *
> + * Returns: File descriptor, or -1 if handle is NULL.
> + */
> +int igt_serial_get_fd(struct igt_serial *s)
> +{
> +	return s ? s->fd : -1;
> +}
> diff --git a/lib/igt_serial.h b/lib/igt_serial.h
> new file mode 100644
> index 000000000..b460fbf16
> --- /dev/null
> +++ b/lib/igt_serial.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_SERIAL_H
> +#define IGT_SERIAL_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <sys/types.h>
> +
> +/**
> + * IGT_SERIAL_DEFAULT_TIMEOUT_MS:
> + *
> + * Default timeout for serial read operations in milliseconds.
> + */
> +#define IGT_SERIAL_DEFAULT_TIMEOUT_MS 1000
> +
> +struct igt_serial;
> +
> +struct igt_serial *igt_serial_open(const char *device, int baud_rate);
> +void igt_serial_close(struct igt_serial *s);
> +bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms);
> +bool igt_serial_send(struct igt_serial *s, const char *cmd);
> +ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size);
> +bool igt_serial_command(struct igt_serial *s, const char *cmd,
> +			char *response, size_t resp_size);
> +void igt_serial_flush(struct igt_serial *s);
> +int igt_serial_get_fd(struct igt_serial *s);
> +
> +#endif /* IGT_SERIAL_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 074b21fdf..67b57533c 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -123,6 +123,7 @@ lib_sources = [
>   	'igt_msm.c',
>   	'igt_dsc.c',
>   	'igt_hook.c',
> +	'igt_serial.c',
>   	'xe/xe_gt.c',
>   	'xe/xe_ioctl.c',
>   	'xe/xe_legacy.c',
