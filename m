Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5F7D7877B
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 16:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD9710E9D8;
	Thu, 21 Nov 2024 16:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KwcZSBuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237910E9CB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732205365; x=1763741365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ch+mHQcZSCW1+B4b5IX4/kgiXNMRnKlBRCbOvbxIKcQ=;
 b=KwcZSBuSLWoDaYZmEEULbvUHkRuT8+S3cavqt2Jh+yzEouvqH6zqtSjm
 X7kDjpzHQxgGcod4pYKQUjk8m8b+rXT4fkgEsfzHU0bv0+dz6NI1S+gYv
 /Pt8E+RvJWmhK17XhESg2/G/so3xet2ATzt/Z/meeYIoUB4EpqV8v3I6u
 o7N/f/2LFWQYZrEApIuzN24Q/9gjnL6mRQTp1cMQP3Mu5VZqDT5fh3lr8
 0WP6b1fi2j0Y9QHMvK//nUgtzkwSOqPSRWKGLfnti0MZPiH0cHd/YvMA+
 SPXiUBagRu/bjT7i3q6DIJa8TvGJJcFYpWmzm7yAljTVJnzZrQJkLwj/l w==;
X-CSE-ConnectionGUID: /bHAL8kwSzyTwGilDk7obA==
X-CSE-MsgGUID: kEiRVclDTv2MoBn1K4Oecw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32444374"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32444374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 08:08:51 -0800
X-CSE-ConnectionGUID: 5kM4MwUlTxeFEVD0b0ECMw==
X-CSE-MsgGUID: Bh6zUymLTUGrgovTpEtDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="90417542"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 08:08:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 08:08:50 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 08:08:50 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 08:08:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W31aHdu0y3sEal+8MSV4f1aS1tcBmk+xE8qpSOyoHWnyVLDZ897fARVd8jIGMIn/gm0tPBoJ9Ynx5GB++Sy4DOlsfvdvKRjiwEdU2wjX3ynjHdJh1oWlppapIsBA2D0fB9OyOIiZtJeUxKNk+mf3MmID9qKm/Qh6Zb/oQstYv1tJ4khtBK6Z5/FjJucp+Uv/MTZelQ6XFQobG4jCa1IQfZ0uR0oSRx5d5Y2FjM96siz2RfSpzzP3wN42yTQ5DAxpHZaS9eHpvkO/VsA8obkTkvcwXvE5mE/UoP1PT4ZeCrJyQUhMJSx+8fmBYGIoajlzrF87M5PwM9VY+PXNWUmmag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUiTzT0RUwZSFzZ0gCPWmghVhM4hLhByAjta3T9OiaA=;
 b=cloyvc83eu9MwOj76mI3UsqrjqJis4X9t1RJnA8P60PVRgLxL2tRQfeNl+4rEhc17Vb5FDEeZZrJnnb2i5nKHmwTl2HP4UwFcIIoVsS82AwPQT7HU4ARfTKqXQ2yZCWHNXjpxs4i/BjG8G8kjvDdyfp6gRsmKGxdvF/ZvizYXYZFYSpm7o5wJ7Becatupwt4FCzWyxGHdwP667uEI/5oR0S8+WAz3NsTrjsjns3g3BxXaPSnpc9eiMZZmPTljJTxIwkMDdznQezlcnjESuFvsR+uNWbLM/7MpM6YT4+3/GDxZPkaSjBg9ersYBGUvhq76N2DpObZwASXpMSQLIpFsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 16:08:46 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%3]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 16:08:46 +0000
Message-ID: <119dcb83-dca7-446f-bd0b-d028c76f54c5@intel.com>
Date: Thu, 21 Nov 2024 17:08:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/4] lib/gppgu_shader: Add write D32 to ppgtt
 virtual address
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <christoph.manszewski@intel.com>, <jonathan.cavitt@intel.com>,
 <mika.kuoppala@intel.com>, <dominik.grzegorzek@intel.com>
References: <20241121122230.451423-1-gwan-gyeong.mun@intel.com>
 <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241121122230.451423-2-gwan-gyeong.mun@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0001.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::16) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcc8b77-a676-4547-8d7c-08dd0a46c71f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmN4SXZocUlzdlRvRHIxb0RNVjIxR2pmZnc2M1hPckFBd1R4SkZxZDVCYlZZ?=
 =?utf-8?B?VzdFY3VPL3pkNnVmSHNUdXhlK2JLWG5PVUZKZkFySUE3RzRIS0Vpa2M5dHhT?=
 =?utf-8?B?SzJJRGMxeUhseHNkY1psOTVqOUZvdytIR2pURXQxemFTRW1jdEtnemo2WVVv?=
 =?utf-8?B?dWpuNng1WHdXUDdxclZPWGx5dFFIQ1J2WEhudHZBT1NCdFVheThEZ29Saisr?=
 =?utf-8?B?T0RYZDhqaWlqR21Jb2MvZ1o1ZFBHVGFvcGhONzlvK0h5a24zeDd3OU95dXBY?=
 =?utf-8?B?aThKRThZRkVqZ0hHTXdac3RuSWptRFdLeWpud1RUWjQrYW5hcHhGLy9iVE55?=
 =?utf-8?B?UFBEenozY1Z6d2djZlFuVEZ3RTc1aDZ1emVHVGh2Q1J1QXA0UUQ5d1BaeHc4?=
 =?utf-8?B?eW5XbGVSUC9QVldKblpwb2pncElrQXdiNTd4KzlnUytpQ2JOQ1FxdFdKTnRp?=
 =?utf-8?B?Mk41QWtKelVlUjVzbnpIVHVBZ243elg0Q213eDJzeVh1Q0hiMU04VDZod01C?=
 =?utf-8?B?TmxFYTJpcmhOV256Mk1RU3dSYWJKeXRoY3ZVVWJZOFhVKzRsUG1tTFoxekV5?=
 =?utf-8?B?ckovaGJiVU5iaURhcFgvdEo2TEs2ZzZWOHY2L1pXV2hNMDZiSExETGo5TXkr?=
 =?utf-8?B?cFFtZmZMVkdpMGZFVDl4eU5rRzc5Tm02VzJBMkI2QUF0VFRJZUhINi8zRjdk?=
 =?utf-8?B?Z1gwSW1OTDdGM0FzZUc0VlZaZWN4V1g4Uytmdko5SGw5bVpFQ2xqWlFDVnh3?=
 =?utf-8?B?RzFQWkhOd1NILzVhSkFuYjkxSHhYUVBYbTVnMG16UVpmTXVIOUpDcHNML00w?=
 =?utf-8?B?c2VqQ2V4bWIwT2FxMzdLdy9BU0Z6MENxbWsvNnBtaUMrOThQRWlpWGRtZCtZ?=
 =?utf-8?B?NFV5Q0JCNDRrdTBubG9nUStNZkJYVklxOHhHUXJ2SXRpSjNieEJ1d25iV00v?=
 =?utf-8?B?RXdoTDB4a1g0aElsNnFYeDE3TVFxN3RmcGx1L0prN0ptU2VqbzZIcFJBZVk2?=
 =?utf-8?B?NEZESmNhODJxenZLalJiM1Exa1h1Q2JSa0VFdDB4eHpRYnZ2MWI3V3VGRk1Z?=
 =?utf-8?B?US9Qc0ZsU3BuRW1kRHBOYXZEV2c0SklDTTZtSTNTKy8xQ0VZUzVhWG1iK3ZV?=
 =?utf-8?B?eFBCbXA3RWxQenV0dVdmZ0xMNTNRL0JNYU9FdW55cnBNb3hpUU42NHl6Q280?=
 =?utf-8?B?R040RzdUazVPSGpTSVJlOUNtRUNqN0hIWHFZL1M1aEtJaGpsa3ZCYjBSYW1V?=
 =?utf-8?B?eFNqUnA2cTV0Vy95TVc3SFhISkVCK3g1M2Rmb01jOGxOeUxFZ2NIUkJUT2k4?=
 =?utf-8?B?WGtBSTI4U1REVGFBV1BkalVYNzFVclJMYW55VHp0RWIySW92aFpJd0YrWktW?=
 =?utf-8?B?d3B1VndxS2loK1VKNnZ0SjU2YTIzMTNYTHQyK2pyWnowNkt2ZDlJeUdZLzFr?=
 =?utf-8?B?SUk3bGI3Y0tDV2JKTGtpdGZ1V3Y1UmZabk94OEJGYjNKTWZ3N1hvMXc0aUFm?=
 =?utf-8?B?NHdNVmlUR05pZHQ3enFmZTJnYVFaeFBHY3RtcWt2alRRRkw3c1B0NTYxeFIv?=
 =?utf-8?B?MW9rVkJUc0xWZjRtVWNqODB2dGFYZjdNcnJqYjRnakRSUlZHSG50aDNFbEp4?=
 =?utf-8?B?QVVxTlk2cVhBbnY3ZVFkM0NaR0swbittd2F4ckhUWlRXeEQvL2UrL3J5Ryta?=
 =?utf-8?B?NHVnbUh4cTR3UjdhbmE3ZDVwaXJDd1ZXU3hSdVk1S0RNVGxCUENTcDJtaEgz?=
 =?utf-8?Q?sK/j+yC5ijp9nRHDcQ+dcntl3p67zoGeIvkT6jh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUpGdFpMZlVyazBxUmYrNjJETTRtZkw0UGw0MkgwNjM2RHF1WFBidmpJS1Iy?=
 =?utf-8?B?VWd6QUpIS1MvQ1Z3ZmVHbTl0RE4rVXl2U0NOOEE0cVB1czIremdYVFFJRk5k?=
 =?utf-8?B?VGliejZGQzZ0QkhsbjVUb0NaR1ZrM1ArNkQrdW4zVlZqOC9qblkwOE5sZ3Zn?=
 =?utf-8?B?RUxCQlAwVW40ejhoVDl1TFRJL2tOUS9Xa25QRm9KZ3J6cDhJR0hvMU5jR0tO?=
 =?utf-8?B?cHNMK2k4d1VpanpVNlgrd3pVQXlGUVVQZUpNK2puMXAvZk5oY0kyQTZQWjVJ?=
 =?utf-8?B?dlF4WFpxV3AwcDJOYnV4bGVVU1NOakJEK0ROa0t6cEJWUm15VmNaZ1lHOEhs?=
 =?utf-8?B?UmtWK1lJYU0wUmx0Ky9JT0pBYjlUY05aYkJrcHJOY081aFRDRzR6a1UrS0Ji?=
 =?utf-8?B?NTBJOFhTeHdWWWprblEyaERTb1FsdHVWTXpDRG5DSkpBbHNxazVKODFzWW9k?=
 =?utf-8?B?SjBSZVJqdHNGc0trUDFjc2NJNTgrNlZQNklRZExKay9CTC9Xem1lZlNpNjFL?=
 =?utf-8?B?aTRmWmd3MkQwS3I0ZkVteEExWmttdUVMdHQ1M1E4STFMMEFMTmRzenFnTHBZ?=
 =?utf-8?B?eks0M2R2TUlybVNHZWcvMktNR2RXdW10NldjYUQvQTZtRG1HaitQL2FLRUtQ?=
 =?utf-8?B?UWdjZEhySjZGbEd2eG8wZ2owSkVLb1JaTmVEQkdRN3BRZXhoak4vNjBCbFAx?=
 =?utf-8?B?OFBqMDZwSGtsd051MFdjT0dEbTRPV01OeGtKN1JqT0QxQlpkVVNQTmR0RTdL?=
 =?utf-8?B?V3dCYU1KVk5Xc0dmak80ZGsxc2VnemlFYlZVNVdwNHdBSC9pazFIV3o1VlRK?=
 =?utf-8?B?UFN2dFRCV3VpWUNEMjRra2s3VERQdVdjWkttNXFDamc4dmR0SFBVdGFiV2kv?=
 =?utf-8?B?REVva1ZXalJhbEZLNXlPSFlYd0hSZGpVZU9BYzB6N0xoRzRHWDNseFdmMXFm?=
 =?utf-8?B?TUtrcklRVjVPRVIzNVdtYUpibnE2SVg1aFhTMFlRZmFhMGw2cVFhNFdCZFBx?=
 =?utf-8?B?K2tzQTY2NlREd0ltUTRwT0JaWlorVWlQbW5KM3RndjR6NVdHWG5Rd3VUbnMv?=
 =?utf-8?B?a3B5YTRqTDlkQzBFTDU4VFBQQmJJSWcxd05GTHZ2OWM1SDlzcUk0bS9leUxM?=
 =?utf-8?B?MWNhT1JQY1NOTnlDV0xsMXFRZG9wNGhCY2RQK0w3UDdDV0J1clNBWEUwUC96?=
 =?utf-8?B?dDVud1RENXg4OWZ0MWp4V21XdUxncWtESVlpdlcyeElTSmVqQ05MdzNNZ1pI?=
 =?utf-8?B?TnZGelRSdDd0Nm1lS1ZEV0FmSHJrM1pqbktnRFYzVnB5VnF3ZkpuT1k1ZG9H?=
 =?utf-8?B?U093MW9LdlA1MUdCWDJxenhraGg5SnJUczI0NDU2R0tQQ3Z4RXF0QkFpK1Jp?=
 =?utf-8?B?OFB1bStXVE5NdjFoWmVKcGo2bjQ2ZDJWdnBaU0dqNkozbE10NlV5TzBPdGRl?=
 =?utf-8?B?VUFGVzFaSnNicFZhMFNUMmZ4aGNqRUdIbnEzWEU1a3BKOWRJSzZLMkFiUGZO?=
 =?utf-8?B?emNpQ3VMaEg2RE5EVHdlQjVxYmZKSU1YaTlrQXhDQXZzcUtsaXFHRXhzRkxk?=
 =?utf-8?B?ZHM5UVAwbTdpMUcyUEVtbVczb25ja0VCWlBTN2xMbFRXSks1NWp4SmtyMGpa?=
 =?utf-8?B?bElObG9IalcxVThudU1LUVRSaEFaK3BZYTNCbkpTTmw2QWpUTXcxY2pwN1Ra?=
 =?utf-8?B?S0NoR3VoSGhjVkowVzFGSFI0SXVoK25GcXdOUHhaNnlhSkcyUUZFTHpzRk1i?=
 =?utf-8?B?bGFneTRwSWVYVzVVdzV1Q1RQUkRLeUV4R1lDUkJEVy9FbDVWS0ZSUCtXMmdX?=
 =?utf-8?B?UkgrK0pFWFBkYlFXeGxkeTdLanBma2Ira3FEY3dpb0hoZnk3WXZ5T01yMjkw?=
 =?utf-8?B?OUpka1cvVXV0b0hYcVlhVGFaRC9PVm84ODlHc1pJKzRLMXV4eHpvMkRVVFVD?=
 =?utf-8?B?OUQ1ZEN4UnFlWkIvdXRWZjlvMHN1VXpiY3NxdUpVSWsveGN6cDZja3p5ZzRT?=
 =?utf-8?B?NUZTcDZHM2huczJQQTVyS0pzbUVZdzdxampLOVNlcnFDS0lrOW1GVW8xZ0Nx?=
 =?utf-8?B?TUcyQzRTa1AyRTkra2ZoVStIM05CWnJMUURodGFDSTBVTThTTDFTTjludUFa?=
 =?utf-8?B?cC9DVitMQU1sNzJ4RnhhYllVMzFXVkI1dU9UU0hrSEdpYW14WThycmk1VEcy?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcc8b77-a676-4547-8d7c-08dd0a46c71f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 16:08:46.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obuZ3Ith+1H1uQlwHM9SzEYsEylNDlORZ7eHxTD3uy2k+jN8u1/L4hmZNC49vDjZNINP+QBhwspEwVCqCQP/4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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


W dniu 21.11.2024 o 13:22, Gwan-gyeong Mun pisze:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
> Create a function that adds the capabilty to write an dword size at a given
> ppgtt address with a dword value. Use an Untyped 2D Block Array Store
> DataPort functionality of XE2+ with A64 flat addressing to direct accessing
> an entire ppgtt address space.
>
> For the write to succeed, the given ppgtt virtual address has to be bound.
> Otherwise a store page fault will be triggered.
>
> v2: Fix the function name to be more clear. (Andrzej)
>      Use lower_32_bits() / upper_32_bits() macro (Andrzej)
>      Drop unused code
>
> Suggested-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Co-developed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   lib/gpgpu_shader.c          | 94 +++++++++++++++++++++++++++++++++++++
>   lib/gpgpu_shader.h          |  2 +
>   lib/iga64_generated_codes.c | 23 ++++++++-
>   3 files changed, 118 insertions(+), 1 deletion(-)
>
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 4e1b8d5e9..d9da35895 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -803,3 +803,97 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>   	", 0x807fffff, /* leave breakpoint exception */
>   	y_offset, value, 0x7fffff /* clear all exceptions */ );
>   }
> +
> +/**
> + * gpgpu_shader__write_a64_dword:
> + * @shdr: shader to be modified
> + * @ppgtt_addr: write target ppgtt virtual address
> + * @value: dword to be written
> + *
> + * Write one D32 data (DW; DoubleWord) directly to the target ppgtt virtual
> + * address (A64 Flat Address model).
> + *
> + * Note: for the write to succeed, the address specified by @ppgtt_addr has
> + * to be bound. Otherwise a store page fault will be triggered.
> + */
> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
> +				   uint32_t value)


Nice name, could be even gpgpu_shader__write_a64_d32, to follow spec 
convention.


> +{
> +	uint64_t addr = CANONICAL(ppgtt_addr);
> +	igt_assert_f((addr & 0x3) == 0, "address must be aligned to DWord!\n");
> +
> +	emit_iga64_code(shdr, write_a64_dword, "				\n\
> +#if GEN_VER >= 2000								\n\
> +// Unyped 2D Block Store							\n\
> +// Instruction_Store2DBlock							\n\
> +// bspec: 63981									\n\
> +// src0 address payload (Untyped2DBLOCKAddressPayload) specifies both		\n\
> +//	the block parameters and the 2D Surface parameters.			\n\
> +// src1 data payload format is selected by Data Size.				\n\
> +// Untyped2DBLOCKAddressPayload							\n\
> +// bspec: 63986									\n\
> +// [243:240] Array Length: 0 (length is 1)					\n\
> +// [239:232] Block Height: 0 (height is 1)					\n\
> +// [231:224] Block Width: 0xf (width is 16)					\n\
> +// [223:192] Block Start Y: 0							\n\
> +// [191:160] Block Start X: 0							\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f (pitch is 64 bytes)			\n\
> +// [127:96] Untyped 2D Surface Height: 0 (height is 1)				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f (width is 64 bytes)			\n\
> +// [63:0] Untyped 2D Surface Base Address					\n\
> +// initialize register								\n\
> +(W)	mov (8)			r30.0<1>:uq	0x0:uq				\n\
> +// [0:31] Untyped 2D Surface Base Address low					\n\
> +(W)	mov (1)			r30.0<1>:ud	ARG(0):ud			\n\
> +// [32:63] Untyped 2D Surface Base Address high					\n\
> +(W)	mov (1)			r30.1<1>:ud ARG(1):ud				\n\
> +// [95:64] Untyped 2D Surface Width: 0x3f					\n\
> +//	   (Width minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1) 		r30.2<1>:ud	0x3f:ud				\n\
> +// [127:96] Untyped 2D Surface Height: 0x0					\n\
> +//	    (Height minus 1 (in number of data elements) of			\n\
> +//	    the Untyped 2D surface, it represents 1)				\n\
> +(W)	mov (1) 		r30.3<1>:ud	0x0:ud				\n\
> +// [159:128] Untyped 2D Surface Pitch: 0x3f					\n\
> +//	     (Pitch minus 1 (in bytes) of the 2D surface, it represents 64)	\n\
> +(W)	mov (1)			r30.4<1>:ud	0x3f:ud				\n\
> +// [231:224] Block Width: 0xf (15)						\n\
> +//	     (Specifies the width minus 1 (in number of data elements) for this	\n\
> +//	     rectangular region, it represents 16)				\n\
> +// Block width (encoded_value + 1) must be a multiple of DW (4 bytes).		\n\
> +// [239:232] Block Height: 0							\n\
> +//	     (Specifies the height minus 1 (in number of data elements) for	\n\
> +//	     this rectangular region, it represents 1)				\n\
> +// [243:240] Array Length: 0							\n\
> +//	     (Specifies Array Length minus 1 for Load2DBlockArray messages,	\n\
> +//	     must be zero for 2D Block Store messages, it represents 1)		\n\
> +(W)	mov (1)			r30.7<1>:ud	0xf:ud				\n\


Shouldn't this be 0x3:ud now, for dword ?

Beside those details:

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> +// src1 data payload size							\n\
> +// Block Height x Block Width x Data size / GRF Register size			\n\
> +//	=> 1 x 16 x 32bit / 512bit = 1						\n\
> +// data payload size is 1							\n\
> +(W)	mov (8)			r31.0<1>:uq	0x0:uq				\n\
> +(W)	mov (1|M0)		r31.0<1>:ud 	ARG(2):ud			\n\
> +// send.ugm Untyped 2D Block Array Store					\n\
> +// Format: send.ugm (1) dst src0 src1 ExtMsg MsgDesc				\n\
> +// Execution Mask restriction: SIMT1						\n\
> +//										\n\
> +// Extended Message Descriptor (Dataport Extended Descriptor Imm 2D Block)	\n\
> +// bspec: 67780									\n\
> +// 0x0 =>									\n\
> +// [32:22] Global Y_offset: 0							\n\
> +// [21:12] Global X_offset: 0							\n\
> +//										\n\
> +// Message Descriptor								\n\
> +// bspec: 63981									\n\
> +// 0x2020407 =>									\n\
> +// [30:29] Address Type: 0 (FLAT)						\n\
> +// [28:25] Src0 Length: 1							\n\
> +// [24:20] Dest Length: 0							\n\
> +// [19:16] Cache : 2 (L1UC_L3UC)						\n\
> +// [11:9] Data Size: 2 (D32)							\n\
> +// [5:0] Store Operation: 7							\n\
> +(W)	send.ugm (1)		null	r30	r31:1	0x0	0x2020407	\n\
> +#endif										\n\
> +	", lower_32_bits(addr), upper_32_bits(addr), value);
> +}
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index c7c21c115..18a4c9725 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -85,6 +85,8 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>   			       uint32_t y_offset);
>   void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
>   				      uint32_t y_offset, uint32_t mask, uint32_t value);
> +void gpgpu_shader__write_a64_dword(struct gpgpu_shader *shdr, uint64_t ppgtt_addr,
> +				   uint32_t value);
>   void gpgpu_shader__label(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump(struct gpgpu_shader *shdr, int label_id);
>   void gpgpu_shader__jump_neq(struct gpgpu_shader *shdr, int label_id,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 6638be07b..e97bcf042 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>   
>   #include "gpgpu_shader.h"
>   
> -#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
> +#define MD5_SUM_IGA64_ASMS a1ee0173014ab4cda3090faeca1cbae1
>   
>   struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -79,6 +79,27 @@ struct iga64_template const iga64_code_gpgpu_fill[] = {
>   	}}
>   };
>   
> +struct iga64_template const iga64_code_write_a64_dword[] = {
> +	{ .gen_ver = 2000, .size = 52, .code = (const uint32_t []) {
> +		0x800c0061, 0x1e054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e054220, 0x00000000, 0xc0ded000,
> +		0x80000061, 0x1e154220, 0x00000000, 0xc0ded001,
> +		0x80000061, 0x1e254220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e354220, 0x00000000, 0x00000000,
> +		0x80000061, 0x1e454220, 0x00000000, 0x0000003f,
> +		0x80000061, 0x1e754220, 0x00000000, 0x0000000f,
> +		0x800c0061, 0x1f054330, 0x00000000, 0x00000000,
> +		0x80000061, 0x1f054220, 0x00000000, 0xc0ded002,
> +		0x80032031, 0x00000000, 0xf80e1e0c, 0x00801f0c,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 0, .code = (const uint32_t []) {
> +
> +	}}
> +};
> +
>   struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>   	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>   		0x80000966, 0x80018220, 0x02008000, 0x00008000,
