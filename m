Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7061C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 14:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F48610E219;
	Mon, 26 Aug 2024 14:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gd9tgjo8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E34510E219
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724683034; x=1756219034;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9AS2c63yVJfqdiTjIgjh3poApgZV1OUOAqDeMo6FXhc=;
 b=Gd9tgjo8QVMoyhnAGLt3dRJoSPdHEWqOl+Xg9o5C+wbggL0oGLyQT1BW
 khzXJREh2tJZAMXUXRmtaMR+F3shmr21cOIy5JKkveAvTBztUJ4KNYLtY
 ERQpY+qZP7jlqkANIGlMoiM21CWYcqHwTWjK0jmqlbcKvIrKtCHvfvc27
 lz+kEjc78lzy7quwIQaQUmF2snHLvQG6f26/K4Li+kwcI9jPOOfax55xV
 vMHIBNB87Nss7eFj8j/yymGCBNzjJGYvvdn9VDumlyakUl9Qs9o5G5yRe
 euBpXlN+isjWR69MFYSCZLepYm/Zmq9a9H/1Ff0IGXk8x65+ZnzRGU3P6 g==;
X-CSE-ConnectionGUID: Ls+SsUR7QaiqVunWNOmurA==
X-CSE-MsgGUID: cClOkcpkSf+S1p9KulrbFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26005658"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="26005658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 07:37:14 -0700
X-CSE-ConnectionGUID: jXBFsTsNSkOr3duT2PNjfg==
X-CSE-MsgGUID: g2BQGZeNQM6DRvXZVSvHww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62494613"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 07:37:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 07:37:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 07:37:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 07:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhDA3bAKJ+Dnf3bqnjNswn3AhmFgA6ZCoilTGnmYbgglqBVPq8nB7JKijAKdVmJoLUdF92716dyZ82I0az7G/Bhwkng7n3CNJh0FM99XKsspfdr0kigYgncUqt3aanrgJluLyp1CQrwlKGxhp9kmA538YAQ3MUb2kM9sTjzUtZQ5fSoaitkXmrFbkXTWx6DKKRtIUT/Vc5wSkpul86tODMk0JwAap3bA1mRNQ5IxtQp6psUPRrToc2bFed6czwAq2vyUCkPG500UmiU4nYFv0lHcHu0VpwP3wkz60nBIE1AvckOQf9l6fdBlnPPIXuaKwCvwmWMOeZ0EZLSknAXRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrD/fIumdyxcKGXd+NNrWUz3ALa/NAfGdJcYqnNyFak=;
 b=We0RwMQV0LUGI26o+SBOkYtD1GSMPTLfdifldKfODOXoHg5pzLGB+pR60RTGEocQTensy8bulOmg0r/ivadasqbIX88zla0cuy1E5F/0a4AXrV0EzdEhyf9Nri0Yu5xTT4mWmkMEKZtsP1dqIVNXlcx4IN7TSCtp9tsWpMaSBQncvTWS3eKHl4N/cIm5UPWmXBF6oGFaEhQoClG5vs4moDJDEDzNhxKiSSp7dJoBAzPDWCZEUlgITqMIg/ZpbrSnAuEuTPgHWcBGp6MGYvbVVF43GBddcatNkBXGpPacoqM0/gXDAuldgE9hheJ57zJwD74ju6SHQUaBdjxpKa4EkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:37:06 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 14:37:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
 <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
Subject: Re: [PATCH i-g-t,
 v4] tests/intel/xe_pm: Add tests for suspend without display
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <katarzyna.piecielska@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 26 Aug 2024 11:36:58 -0300
Message-ID: <172468301865.6014.9946879676247551400@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: aca90d98-4916-4d97-201e-08dcc5dc8e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NEpjMWNNdUg4c0ZkejZOZXdiRjBoMlllWGl0Mmo5NHVJbGlBTlFDd014eTBR?=
 =?utf-8?B?cXlBQ3BtdE5VaEdSaVVveG1uc1d2V1pjaEc0YmxHU2xQN2xXVnMybEpGM3NS?=
 =?utf-8?B?NHBybzZQZ1JjNlE1YmpBT1d3NXRYQUZVaWxlWE12Q21nTm9HYWZxQ0FRK1BQ?=
 =?utf-8?B?Q2FEekJBejAveDU3SnlqR2w2Y0pjUzRVUDNhdEJ2cHljU25qVFBjZU5TS2RH?=
 =?utf-8?B?bm1pYzVjZ0lDd2JLQTY4VGJYeDRLQUJtdTF3Nmo0Qms2NHlocEVOaEZ4Zjk5?=
 =?utf-8?B?S1dtcU5OOXRLYmhjb1JpNFNIMkRBTGxPQnJNeURDaXd0YVhOeVgzZGxvVGg4?=
 =?utf-8?B?VlRnbndnYklEd0hYakdueER6T2huRFp1Z2NzUTV3ZnNqZGNWUk5vSE9heVdF?=
 =?utf-8?B?d1NVNWdUdEVUdUFOQjF6SHpiZUJKdVg5SzZRdzU4Zm9PYW5OQVBCQzVKbW44?=
 =?utf-8?B?d3hldkVoVDR4QnVveTdLSC90aGMwcDhRQVhya3BSOXZTRWtTNDhhMk05MG9i?=
 =?utf-8?B?NjZzQzBHR2Z0a3R5b3hFYVJwRzVZM3NndkloV1BlbDFXR1R1T0ZCMjdpNHB5?=
 =?utf-8?B?WkNPc3VZYVkzUURPWStZQXNLWHJ4YnE4OWMrWnZvNFZHNjJic2xSTk1vT3Z0?=
 =?utf-8?B?VHQwb1ZTMjEyNFIxTWYwL1hvcHRuQW8wMVFrTEtJSlBxd2xJdnYwL0c4OUNJ?=
 =?utf-8?B?K3ZBSUk2Z2NuejU1Mi9ya3d4VkpscHZuc3MvSVgwSVNSdW0veG9aSVg2UDYy?=
 =?utf-8?B?UXZBZlNodjdKOWNvcTRHTzVUNjBwd3crTEVrZWFWYTczRVllRWRjTFpXVk9E?=
 =?utf-8?B?VjgvT0JlbEMrSy9QL2huMzk1bzFjMWdxYVc2djFsakZCZ3NuV1EwRzAwV002?=
 =?utf-8?B?RTNJUjRUR3IyMGhNelRKYzYvZ2xsZWVDOG4wUkFVZmF1RGNvb1RYUjUxbjZT?=
 =?utf-8?B?RjB2U0hZdHo3OTdqc2JPNzh3aGlRTG1menJhd0VkaTlKT1I1cXAyU0tUb2Zn?=
 =?utf-8?B?TjBMZ2x2c0hJZVNkVUJCQkhJSzZ5RjNaSUtGemprZWNNK3IxeXQ1TzQzb29t?=
 =?utf-8?B?YmsyVU92ZUZ2LzlQUUhKV1psWVZWNHJLM213QU9VYlF2enl0M0FyWHExZm9T?=
 =?utf-8?B?ZHBnSVdtWURPZHVyNkZwSC9jUUJmYWhpTVF3NjRYV0VRRjF4ZmZQaEZyTVpq?=
 =?utf-8?B?akx1Q3VKYzM0eS9OK3c2enN0R1B0YW5lMVQ0ZWdGMG9oNDR3VjIxMzJ6ZFF2?=
 =?utf-8?B?V05rV2lNOFRoZlBnZGpVQW9JOFJKS0JuZ2tJVGlpNTlheWZKSmFNLytwZmZr?=
 =?utf-8?B?M25DR3hWTFdqZy9iRFFZTzV4eTJQZVFicFdlRDFxT25RZ2d0bUdieWR0NTg3?=
 =?utf-8?B?dXBya3h5TTVMdWwxa1JwcTNTWmZZQk55dVpqY1UxRzhISGhIcWplSmhnM3ZE?=
 =?utf-8?B?YnQ1aDF5cjA0aUY2R1NaRU9aemkrZ1RHb213QjNSYUFOWXBVYmNqSks4ckVT?=
 =?utf-8?B?WWlDLzYwZWtSUnVzcmFsa0d0ZjIzN3pZUnlMZEIrY1dZcXA2bEJMaEJWNTFl?=
 =?utf-8?B?QzdxSHM5Q2xmL0tVdXY2WE9RclY1dVFwaWg3MmtaM1lqclBLM3Y0cXZRRU9N?=
 =?utf-8?B?WW9HRkhLUkpoQW5XcG1TK2RHM1N6NCtneWpJN1lJR2FoK2JCa1d0aE11UjVW?=
 =?utf-8?B?SVcvV0pha2FjMXVqbkxVMHNZMVZ3V1FjUGJOM0tEZTlUMFVSMThtYVZqZHJX?=
 =?utf-8?Q?ZfmzXiCqnUfabbEbBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnV2SGJTWTQ2bWJ6MDdRcnJYYWMwYkFxc2tuakF6V0g4R2VOcWplcEpra01J?=
 =?utf-8?B?Z1JFcWVYNnJHUUN0aXF0LzZsMWhmM0RMbEoybFVKZzA4VVErcmZTOGp0c3lD?=
 =?utf-8?B?U3p2c0oxY0tQQ3Jubzk0NDlpWlB2RngzK3FZaStCeW1tdi8vNmwvTFM4V2tu?=
 =?utf-8?B?eDEwc0piMmQwU0dYQnFVaWp1Nk9LVzVBTFNuNXprenY2RzdhK0tSWGs0U2dF?=
 =?utf-8?B?bjFJbXhydWNKbWQ3Q2JpTE5SQmxkZXZtWW9jSE1sM3phQVVYejdFbVJUL1ps?=
 =?utf-8?B?RWdIa3JXL0RPNEg2VnpOWUVYQ29vc2pmRE4vOUoydjJhand6cFBBQy9kMExW?=
 =?utf-8?B?SFUzUThVUDF4UVdVZ2h4a01JaDFvTUViRG5hYVNYN1l3WStWMTJtbEtQUlZm?=
 =?utf-8?B?ZTNTOFgyYWpGQTVLa3YzYi9KVXBwUlJaR0VTRU5XNjhWSHo0enhBV0tGQlcy?=
 =?utf-8?B?UGNFYkNyRUFBT0hsSG1LM1hXc1R3WkFmZ21EOWpqeGZ2S01aamlpR1Rzam9V?=
 =?utf-8?B?SFVOb05SQTV5dk1XdlBRSlMvam1Xdm9uN3JXUDZhblc2OWVORmxvT3VBVG42?=
 =?utf-8?B?V2NwQnh2bjMxeTl2bEFFTEs1ckRaTmdycndiZ2ZsL0FpTXVKTlY3VE1hVWN5?=
 =?utf-8?B?YXowQWR5a2x0UFMyK3pzaktVT2UrTEZqTjdva0VBWmpDWDNlT0RKSlFFUUkr?=
 =?utf-8?B?SlFOdWhQdEFrUG9hUXRlaXZnRnh6ei92UEFCWUwvOW5Ia25zVFA3dU56YVBa?=
 =?utf-8?B?ZmViZGd0NEhoeXA0eXliOWNIK0J6enpjeS82SW5TWloxaFpCWXZRWEUwMTdo?=
 =?utf-8?B?NnJVeW1uOXFrMU83UG5DcUFmeFNuNlh4N0lkSTNLbFQ5QVdldTlJNU03bVpt?=
 =?utf-8?B?Wm5BQndKOCtTSFRmWjBZY2hwZjY3ZVV4TDE4cnBjNDIrTHlaVmJ3djU5a21L?=
 =?utf-8?B?WDJNWmY4L2NMNUY1VCt3N0JYd2hVWlAxd0t5WW1Uc3lBQ3Q2Sm96K2RSZjBy?=
 =?utf-8?B?dDZxbS9NdE8rVUI5RFMvVEUydGJOZUZ5dFozTlpCSm11aDZlV3Mrd1VKMDJZ?=
 =?utf-8?B?OGVKVzNWRWFyRE1sUE1LaVNueWFNSVhsYWRWc3Y4cktnTEhEcnZSSXFNZXlJ?=
 =?utf-8?B?UUZMZDg5KzE1SHN3TTJ6RFh5OXpqYk5tejFhblA1UW5TODdLSVhFRDVKSHVV?=
 =?utf-8?B?UmQ2cTdFeDc4LzBOeUFCbTN4TXdkUmx2Rk9YR1M5cjFEb0Zod3QvcmZ2emxQ?=
 =?utf-8?B?TXd0SCtlandxbnp6RnA0K0hVemdFNlB2czVsdWUwdW5ZYm9tSW02eUdGQ242?=
 =?utf-8?B?M20vN0hmbGdlUHZueFRqNG5HYjFORmVGNnozeVRxaWtoYnVBcUdqN1ZFU1N2?=
 =?utf-8?B?VURPeTJMK0JsZHg1b3hxbmtmOE1XUVhlbE1hUE9LL3podzRPWnNHUWdDWkEv?=
 =?utf-8?B?V29CS25QZng4L1gvdHJRMEsxOU91dG5jZ1NHcEZsZ1VuOHhTUDdMbW10dzBM?=
 =?utf-8?B?RkhqTG5rbFR2MmpOcUVkVmJ3aXE0L0dHRVRlWGZzM3pNUVhZbVRtaURhd2lj?=
 =?utf-8?B?QmUrV2UwYzhvV2JwSUNjd25SQjFzZmZvQzN3UnRJd3loT0VTTVdEN3JDSDd3?=
 =?utf-8?B?WS94SHBjblh4cHVpYk4vaWtkSzlVaGlScWlSSmNvMXEzNzlTWTZuTC8xWHAw?=
 =?utf-8?B?RG5MdlRkQzUwdHAzd0xaVVJET3ZmbkFBNlBsb09VODZzUWhlcTg0dzk3b0h3?=
 =?utf-8?B?aWdxb3BaZUJ6T0RmUmt2NmUrREQrcDlXeFdOQnNjVUs2SCtCMzVUd1ByOTl4?=
 =?utf-8?B?OFJxczN0OWY2MjczVVhwT0RJbzA4N1kvcVgrZktnOWRGblphRGI5cG1yNzVp?=
 =?utf-8?B?MFRWQndLRHBRYkZraVVHUXdrMmNwK3h1L3hLWTJBelg4QWxsd0pFT29QRXBj?=
 =?utf-8?B?WjNmWVk1VG5sMWNjcVRHR1pINW9HSFpIM0JmVk9iV2JhZGI0Tmw2MjZaeGZY?=
 =?utf-8?B?OUdTamVOL0dobWxvNVlWRy9hbkFJN05NTWdhMlAzYnBMR1FJZGpyMndGNHJL?=
 =?utf-8?B?VjljOERYL0ZQajlGbEQwVWJOeVl5Q1FXMkE1Q2NMNHNiMnVIQnVLcTZKTFdk?=
 =?utf-8?B?bVROT2JlOENvNVdPZmRFWUF2S3M1ZjhVQmZTRTdEamlESWFUZ1gzRzRyUE1m?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca90d98-4916-4d97-201e-08dcc5dc8e9a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:37:05.8467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HeF4Bj1R6TB4C2S54U/W9hey1PnGr+ws8Szwqb6cg7ClrTAhsjKuWJW1lFpW2clE3k1vr81WpKXwG99MWu0Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
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

Quoting Lucas De Marchi (2024-08-22 18:01:19-03:00)
>On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>>Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>>Hi Sujaritha,
>>>On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>>> Add tests to validate basic execution suspend/resume cycle
>>>> without display module to rule out display related issues
>>>> from the suspend/resume stack.
>>>>
>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>
>>>> v3: Rebase
>>>>
>>>> v4: Change commit name/header (Kamil)
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>>> Acked-by: Katarzyna Piecielska Katarzyna.piecielska@intel.com<Katarzyn=
a.piecielska@intel.com>
>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> ---
>>>>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>> index eee89428c..1623a56c7 100644
>>>> --- a/tests/intel/xe_pm.c
>>>> +++ b/tests/intel/xe_pm.c
>>>> @@ -17,6 +17,7 @@
>>>>
>>>>  #include "igt.h"
>>>>  #include "lib/igt_device.h"
>>>> +#include "lib/igt_kmod.h"
>>>>  #include "lib/igt_pm.h"
>>>>  #include "lib/igt_sysfs.h"
>>>>  #include "lib/igt_syncobj.h"
>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>   * Description: suspend/autoresume on %arg[1] state and exec after RP=
M
>>>>   * Functionality: pm - %arg[1]
>>>>   *
>>>> + * SUBTEST: %s-without-display
>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>> + * Functionality: pm - %arg[1]
>>>> + *
>>>>   * arg[1]:
>>>>   *
>>>>   * @s2idle:        s2idle
>>>> @@ -681,6 +686,7 @@ igt_main
>>>>          struct drm_xe_engine_class_instance *hwe;
>>>>          device_t device;
>>>>          uint32_t d3cold_allowed;
>>>> +        const char *opts;
>>>>          int sysfs_fd;
>>>>
>>>>          const struct s_state {
>>>> @@ -757,6 +763,34 @@ igt_main
>>>>                                            NO_RPM, 0);
>>>>                  }
>>>>
>>>> +                igt_subtest_f("%s-without-display", s->name) {
>>>> +
>>>> +                        if (!drmModeGetResources(device.fd_xe))
>>>> +                                return;
>>>
>>>This should be skip or save it (as global?) and run test on headless.
>>>
>>>> +
>>>> +                        xe_for_each_engine(device.fd_xe, hwe) {
>>>> +
>>>> +                                igt_debug("Reload w/o display\n");
>>>> +
>>>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>> +                                igt_assert_eq(igt_xe_driver_unload(),=
 0);
>>>> +
>>>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe wit=
hout display\n");
>>>> +                                igt_assert_eq(igt_xe_driver_load("ena=
ble_display=3D0"), 0);
>>>
>>>This param was renamed to probe_display, see
>>>https://patchwork.freedesktop.org/series/137096/
>>>tests/intel/xe_module_load: Rename enable_display module param
>>>Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>>
>>>+Cc Lucas
>>
>>And disable_display=3D1 might be more appropriate, because probe_display
>>would simply skip the probe for display?
>
>Good point. For platforms with display, is it expected that suspend works
>if DMC is not loaded? Otherwise we will actually have to touch display
>to disable it to be allowed to suspend.

Well, for s2idle (s0ix for intel), DC6 is required, which in turn
requires the DMC.

For s3, I'm not really sure what DC state would be required, but I would
assume that we would need the driver to put the display in a low-power
state, so disable_display=3D1 seems to be needed here. Someone with more
experience could chime in to confirm this.

--
Gustavo Sousa
