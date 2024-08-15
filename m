Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56568C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 13:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125E410E3FE;
	Thu, 15 Aug 2024 13:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JjDQs2jK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1BE10E3FE
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723730235; x=1755266235;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=5LxIXTbcRRMzlj/i4SUr9yZLmotBpAaUI+oC+p11NSk=;
 b=JjDQs2jK7tLk8WmfmgZwMG6bPgG692OazrmX7Jbnu1F17VIaFnxDQtn7
 4s/26vOXfz7zc0I46GqY7OwovRjCwuRh3kX2o0MUKXFiVaJf23ypvNpL6
 TZ8uXbntXeFuw6C4VgQ/WTYYflB/+oIlcoHAuF2a5G/TRiiHAoFrJnsy/
 Sbs7+VUUSb8oiIEOWapCpRQFu+sYg+UTuOSgK1dGEiE9OqVTlQ2JRAHb+
 xCRyII39/B/btNAxa57UFKgwWeug/jF12pw4OvlNewCoPdoGyaYWMW8bc
 pFTpel2s77YGBoPIF5/xZBV1ez1FxmQ25wqkejywSRav4OjTmYoKZMSFa A==;
X-CSE-ConnectionGUID: PhqZWrBJTK++CNmDc+yKvg==
X-CSE-MsgGUID: 3iW8JHDXRiipdlzl0cGpew==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="21627818"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="21627818"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:57:14 -0700
X-CSE-ConnectionGUID: RpV9wS2DQwqBWSq7ZA4hjQ==
X-CSE-MsgGUID: PhXQ531hRmqVO4V1uA+rtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59920784"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 06:57:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 06:57:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 06:57:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 06:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SGpi5YDxBDvXZsifj3YgCUL06vaqF2Ilt/8tSmB2v/aJi1HU4wQmyTiShwHJuyvoxTViVCe2PGOQexZ69tSxFw8gRR0tvQMMt3lSvUrpXAj/6jle0GdK6Ax4UzLGs1a4IG7RERUO+Y8a6pTW0Wd5COQpU3bUnYRqnjycXZSJ9reyf7W00SlKKdcVnmnUhwpeuOxWtJ+iWQMy7a/SXgh9T4Xjqq7AveqMdlYak7cDh9dEae/lv8Gn0uTRjfzH2Ercpl2iy/3TdgXh9spEJOaOG6gkCmc+sWUQ7ixxJPu9JYiRyF/puoGGiu764e00wRxu5Ua47vl9kJZxPjq76FSavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ4toBtT/K3g0uAn+a4Qso2+lgoQoOJIdjqnlaeHWMM=;
 b=yQAKIfU3u4+m4sruFaXsgI5jHuXqqzMZSnY7fJC8XsyA4c1lVtuA8xjM5NUSOyo8iFHWot99Gi62iBNZvIIq9nrtYTiSPy3Y7hSe906qL6vXCNCDNvEf13zW2fgVRYrUpR3M/hcZYYnLGl1z7GEPo7a8oQo8pbWJoUDMdbUZHo1qkeU3/simKSn/3xXt7RIdI7MJtBt1cEYKHJHFwDwfFI41JzzSFh/VBTHD+q8Aw13+dh8Fu0Aovn5bn1wd/t+S7tUtbE1ZRS8SCxatx106OdtPeETUCJByBfrFxB+JTARI/7p92xnTm4vRNyQC0t8/tjwOmcxUESQdKIEd3FcEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 13:57:09 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 13:57:09 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240814214705.3718355-2-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
 <20240814214705.3718355-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_core: Add a couple of time conversion
 macros
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 15 Aug 2024 10:57:05 -0300
Message-ID: <172373022553.4082.8676565959536890370@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0138.namprd04.prod.outlook.com
 (2603:10b6:303:84::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: da8c4dc7-6199-4d26-711d-08dcbd322808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWI3VkovQTdNeGZ2RDNBOXAxRmw5NkRmcjJaOGlJZUt5ZzQ3cnN6MWFWbnVR?=
 =?utf-8?B?cWo2Qk94OUR0Tm9vYWt6N0psZEozbVVVRWRaMFA5aFJDMktZR3JuZXB3MEsz?=
 =?utf-8?B?VXRSWlg1ajc1TDFxNTUwOCtHcGNLejBybXpubjl0a0czd0dPOW5zRkhBdndx?=
 =?utf-8?B?Sk5BdUVvZVp4VkxKMElRUkhrRGhWV3FUS3NZMThUelRSMDIzNTVSUGR2ZUVv?=
 =?utf-8?B?cE1uY3NDNlVHSFRWbE84TkJxcTY1eEVjZ05SellCRmM2NzFvV0xpWWZnN0tP?=
 =?utf-8?B?TnF5QVNZUGh6WVZDMzdvWWdlWjUzNnZLdW5OUURXby9Vb3VqVmZPVHFYbVVh?=
 =?utf-8?B?QmhQb01tOHRLRm5Wd1lnd1NLLzZzRmZsMm0reXpjZWwxd0pNZDhrbzZpbzA1?=
 =?utf-8?B?ZldRNlc3QUY5bHNKSXNqei9HZUhPUkJDaXhibHhuQmNhcVhXaFBsd21HSXlq?=
 =?utf-8?B?aE02TFdRRlQ5bVVjOHovRXNic3htYzJCU0IraGNkZzZjVjF6WitaV1lmYmdI?=
 =?utf-8?B?QWdhQzFFK3gzbkNNRkR3bzI4dDlBbGhrRTdEbUxqL2E0NEFsRksxSXFseU1T?=
 =?utf-8?B?M2s5dlpOTXpVYm56bHNxK3ljb3Y5V245UFFhRERMUW5yS0hsbDcwVGJDT0Jq?=
 =?utf-8?B?czh6V2gzTzduYmwrcTlWR3lDZ3FONk9IaDdqVGVkQkd5a0wxZGtEbnlqT05L?=
 =?utf-8?B?NzZ0S2cyWGZKM1lLeGk2NE16djFpdXJoMEs1RDJ3QmpsdzZFY3FtbS9IZ28z?=
 =?utf-8?B?Rnd5c2d0VzYyUDUrM0tPUk12TUorcnRsa29rL3IrTzROQXZUd0xIVVBHZVFt?=
 =?utf-8?B?cFA2SjhMTGhEK01oZm1WS2N3UVp0UzIxQ2V1bGRFSG03SVJiRTBRZG1Bdith?=
 =?utf-8?B?VlV2eWNGTzJvYlpuUkFFVXhIKzFFY0tzdG5waHZIRXRlaFJ0Yi96VVZkQ05x?=
 =?utf-8?B?MTlrQlo5UlhmSUJsU3gyMTFhWmx5R0h5Z0JPYTljVmpwejR1cVlyWUZHbFhk?=
 =?utf-8?B?RFhhak55RnF5SDQveElWeUt3b1dvSGE3VHY4KzdMME9GenFQZnBYRHFvTEtZ?=
 =?utf-8?B?c24xa0xmOTNlbmk4OHd6UGVTeE9DbDcvaHJ2TnIvaHZIaUZXdVpqUE1WZWxY?=
 =?utf-8?B?TzMzMFhNTHAvZHJyN2dGL3hYcGxPMHJGUU9kRk5NZk5VV3NFWEFHMUcwREd6?=
 =?utf-8?B?RUQ3RjhXOHUzdDltRVBacHFCclVDRDFvNSt1am02eEF4bjdpNXlxM0pNalB6?=
 =?utf-8?B?Mkhmbi9Edkg3Zm85M2hxUUtwVnZ6KzZkMUpPZnRFRzJqMmRNYmRELzU4d1JI?=
 =?utf-8?B?dEp1TTV5ZGRZS09ud2ZaanBBcTdNYTUwNnlnMFczRWhvVTk1Mjk4OUVmUEtq?=
 =?utf-8?B?d21sbkVOaG0yR21KK2lQMmp6REtzelNGR2srbnlLNlVqS0FzSkdIajV4WlA4?=
 =?utf-8?B?ZVI4aFpjR2lrdXhwdHZ1WFVGMC9oZVBndHJocGlOVjlSNHlnRmVLVURMME1S?=
 =?utf-8?B?NFV3TEtwMFhDK0J3ZFZOaVA1dEU3eU9iZDM5UStUYkVZbk5CcE9pbCtzeURU?=
 =?utf-8?B?dlZkYUJxOVdVeWJoWWVTRHZObGhic2U1ckY3VVZVV0tUM2RaaGtBVkxEQVlN?=
 =?utf-8?B?RTl6QzNVOGF1cGJkbk9tYmJZcDIwejJFUUU2QmdUZnk5ejZDVEtlamdrT3dH?=
 =?utf-8?B?cCtTQVFWTFJqQWx0YWc0aDlnbmFmSldRUU9GaHlvbUdGMjVualVEaDlaZHl5?=
 =?utf-8?B?dHBCL3czaSs1LzUvUXNFVjRuVVNYTHBmQUNSSllQTUh3QjVnbWFBSm5JWHFq?=
 =?utf-8?B?TDVXUHJyaG10NzNRYjMzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZ3aktzdk5RcDJ4R0o4ekszMDZRNkVheDNjVzQxcHlzZDdZMVJxY3NwTUtJ?=
 =?utf-8?B?U1hsOWtGVjYzTDhuZ212b0JNc1lTWEw3eTN3QzZ5Kzhhb011Q3VyYnIyNEhJ?=
 =?utf-8?B?RmZBT0h1NmlIbXlhZVU3YVdzblExeWYrLzB2amVsUGhaa0wxYm5IK0o2UVVM?=
 =?utf-8?B?OTIvRms1NUFyZFVxL0hJQ1UydHVyclp0TmJnQi9PNXBENGpRcUtLTUM3Vkc5?=
 =?utf-8?B?RDM0cnlEbGMySDFnN0plMVQyTlg0VUdCc1BLeDRESlFYQ2NwZ0RCcjUrYWtV?=
 =?utf-8?B?NW5TY2ZPbGNJK1p4aGNybThMeW96WWhsYXd6VWE2VzhUNkxKOXpiYW9sU2hY?=
 =?utf-8?B?WmNhdy81c3pMWkhCQjgxZVAzNUREQVlQWjhpT2dtSy9OM1NIZEdZc0ltakl1?=
 =?utf-8?B?K3NnRXlZMVFpYjdreGJqVFhOMmpGWEVmamJMcFhyN0QrMEppbWNMZnlUeDlK?=
 =?utf-8?B?akhVbFdXbmoxZ2htWVo1STBMNStPSHZhd24rbG1CVllLNnVrTEVkenR2cVBO?=
 =?utf-8?B?RjlWYzhSTkd1cnZla1dibjQxSFFxSU44dm04TmluM29GMEp3cThCSEVJdXJU?=
 =?utf-8?B?VG9GMXBISzlvTUJvQnBVRnRvRnMvZFpYcDE3Tk1ramhYcUtsd3Z6Zy9ZVnZQ?=
 =?utf-8?B?RWF2SVFDUHRRdFVpWXh4cUNQNUlzck1IdTg0MjNSUjQ2clJyMXdBckJDL0tj?=
 =?utf-8?B?TXpxa3pwRHBsdkZVU0xlT28yL2JucGw5bk95cGlNTHRqYzZXbWltd1VETjVE?=
 =?utf-8?B?WGxpWkhCdmhkd3l0ZFBhNUFwZVpqOU5rdVRuQ21zU2U0MXhCL3ZQcWh2TkF6?=
 =?utf-8?B?SmdSc1RtbTBJaHE3a1BHRUhJTnViM0RMTGRJeEZQTGM5K2h0elRuM0lkZHlO?=
 =?utf-8?B?Um5zQXNlWjdKcWYzWGVEWWpCVnhtTkFBYVdRclA2aTBITXNMVEphNmpUMXcv?=
 =?utf-8?B?bHZVcWwrZW8zbzhBUUZNMXE5clkxSVhqRGhkaktFa0F0ZHZ6azV2S0xJdXU0?=
 =?utf-8?B?YTFnWkdmRDZTSlJRSFRPckRWbWN3ZUVJUG1tOVZyRlVqSVlqa2MxM0kxNjI4?=
 =?utf-8?B?NEZldGJleXVnbkhHc0xreXBmdnVzeHFqVERDcExkdWNiN21OSWp1YzYwTjNW?=
 =?utf-8?B?eklrR2lNUlB2elRwRUEzU3V5cmlFdGt5Q1FGSm15dk51WURGcTIxWTIvZUM1?=
 =?utf-8?B?OC9KeWlNZTY1NDY0OFcyOXdZL0hnZHRreVlJOUI2U3U0bGJvM1dicmt5eXdW?=
 =?utf-8?B?RjZ3U0NrelYxZTN6NVI0QnU2ZXJVc3hSclpuTTJHbXp2azlpTGNieXVQREtj?=
 =?utf-8?B?QldiRk1aaFhCOWExUDNSam9VbExleFNkb0JQTHJFSGVYZ1IrbjAvbTF5Q3Mx?=
 =?utf-8?B?aFJ2ZVVROEgvR0xHcFFZZVZlSlIvbDZWUkFMUTI1VFpOWFFhTWd5dHNWbVFG?=
 =?utf-8?B?WWpiWUxZTkdSRGVJZWVENUY2QVVndy83bUJGQnJtNmFqdXZ2WVJxV2hnWUlI?=
 =?utf-8?B?cE0xVGwyWjFWaVpDRXdKTmtBN1ZBUTJkaFlaZktxaVMvYjJYZm5LUkFVZWdK?=
 =?utf-8?B?d1NaN3VueXNZaThhNWRSK1pXa1RLU3FabERqbEpIdzJuVTBJRWRvczFsY3ND?=
 =?utf-8?B?clc5NHlnc2gvOGFEWWc5bVlHeGNIckhhTVUrdWkzY2o1dW5ycXVURkhpOXY2?=
 =?utf-8?B?U3hMVXBlTW15cVRxQXJ4Znk2dXNDcGJBcStpQ084VjZYc1ByMGdyUWhETjZX?=
 =?utf-8?B?a29tL2xSRTFVeVFOcjhpdzZmSDVGT0sxcHdLQnVlcW9ySjM3SGNqT3d3aDdX?=
 =?utf-8?B?clpHemFJcm40UW5Sa0dxNW9pWGp5RUtxeHRvcHZjTHZick1ZZUxBNHZDMkk0?=
 =?utf-8?B?NkM2a0ZVY1pqRVlNNVg4a1dOb3BhSDNLcDVZRzlKNzBZTDk3YlE0ZDVEMU5i?=
 =?utf-8?B?dDZ6RW9rYk5WZ25PZ1p4TWdUUFM1VlFQZ2M5OE1UaGpIdDZjSUFhQWNJVGdK?=
 =?utf-8?B?ZzZQelVyR040WFlyamNZQjRVaUVwUnhZbkl4YjZwLzRld3JuVko1S2kzV1Vo?=
 =?utf-8?B?QnpablU1SHFyOFNrSXFMb09Dc1VTa1lMQ0t1MlcvdnNIU3V2WGU0bE1GYlds?=
 =?utf-8?B?ZEZJeUliTElBVjVYNm1HUVlFVnNnL1ByaFVXb0ZDOGhLNmk5YTRETmVLaWQx?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da8c4dc7-6199-4d26-711d-08dcbd322808
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 13:57:09.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQHPF7TsTScwcOo7k+2JJleGrVSk/7lK705zVUqP7DBH5g9Fu0YS07OurtH4rtcj54jxjz4Yd2UJmtApvFgHoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6614
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

Quoting Lucas De Marchi (2024-08-14 18:47:04-03:00)
>NSEC_PER_MSEC is defined in a few places: move it to a shared place
>and make it build on top of USEC_PER_MSEC.

S-o-b?

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> lib/igt_core.h                    | 2 ++
> tests/intel/gem_ctx_persistence.c | 1 -
> tests/intel/xe_exec_sip.c         | 2 --
> 3 files changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_core.h b/lib/igt_core.h
>index c83bcbaba..74fa0ed49 100644
>--- a/lib/igt_core.h
>+++ b/lib/igt_core.h
>@@ -1509,6 +1509,8 @@ void igt_kmsg(const char *format, ...);
> #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
> #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
> #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
>+#define USEC_PER_MSEC (1000u)
>+#define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
>=20
> #define for_if(expr__) if (!(expr__)) {} else
>=20
>diff --git a/tests/intel/gem_ctx_persistence.c b/tests/intel/gem_ctx_persi=
stence.c
>index 8d4a874d4..974444cf1 100644
>--- a/tests/intel/gem_ctx_persistence.c
>+++ b/tests/intel/gem_ctx_persistence.c
>@@ -122,7 +122,6 @@
>=20
> #define RESET_TIMEOUT_MS 2 * MSEC_PER_SEC; /* default: 640ms */
> static unsigned long reset_timeout_ms =3D RESET_TIMEOUT_MS;
>-#define NSEC_PER_MSEC (1000 * 1000ull)
>=20
> static void cleanup(int i915)
> {
>diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
>index f99726761..ea1770cd6 100644
>--- a/tests/intel/xe_exec_sip.c
>+++ b/tests/intel/xe_exec_sip.c
>@@ -31,8 +31,6 @@
>=20
> #define SHADER_CANARY 0x01010101
>=20
>-#define NSEC_PER_MSEC (1000 * 1000ull)
>-
> static struct intel_buf *
> create_fill_buf(int fd, int width, int height, uint8_t color)
> {
>--=20
>2.43.0
>
