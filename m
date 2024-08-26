Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD74DC5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 22:10:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C3E10E1EC;
	Mon, 26 Aug 2024 22:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePxfDWJb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D985710E1EC
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 22:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724710243; x=1756246243;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zQsk7ZN8HLpdEtBwOIr4GJE2HynJEu97vM3kFmRZDuA=;
 b=ePxfDWJbtl8YhHtBslKGUxMW2EvwrZbofKxqmbiUioz3r7YqvgNAh1ct
 dHmFlB/aKiCRZ0k6QR/83YYb9ru+z5WdFAYaTkZmkDAtVbWqVB0B/V32o
 xssQZb+QAczLcItSEqjIyOo7Mn3hpLhM0MporK4ms0eLQ1SqP4qmlEU8m
 RdGPmJbx5H+1oaSQWJDynJQdB+bCc/ynjprN1Xyj32FZcfQErN63cTngs
 cf/S1xYjQPwuax0lr2QoppM6WInNd2X+2IU+zSOp8Ng5gmfhJg0Xn9DaB
 s1NCuzlNQ21bIJEBIntlF85/umQbr41+N5TcIjKLDUrSazyxrLn/LC2vB Q==;
X-CSE-ConnectionGUID: X3V/PWTWQSyB9IqbGwsgNw==
X-CSE-MsgGUID: pThHy6Q/RomFuCPsx3IddQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13224741"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="13224741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 15:10:33 -0700
X-CSE-ConnectionGUID: bJBac7XdSLORdqKTkXcfWw==
X-CSE-MsgGUID: GhjJCCaQRGC+q8qdnSyp/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="100151152"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 15:10:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 15:10:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 15:10:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 15:10:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 15:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb2/0ZCOCZa0OTz0/z0edB04kVD9nm2hu6enFxuRC7aTkIM35lUR7f0JWjwBUkXcwy+gWzf7CsX45M3wErfoFfoasxSvRkkTdJb2+/ltG/qFHM0wEmROUkzPS5RtZgs+iV5HQRV1oEQhQ1jSRcJUDm3rI5PD3+/pJ4x1ygEOhWGZyrfjAsNPRbnwK0G72ucW4kpkWk/4N/IiAwG8fO/BeHtGIhl7TEiS2INrr9MyziuqrY4xj0Z89DKA3cRz9UMqM3uErxiM1JwhTfAWqQuplFQxkOFJCP+LF2pBCY2fL6sshTqppUmV8YBu8zMIbhMxCB/W32t1XpFfL4d14h9q8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7cQtq//9VsZHEupijVvwjf2GYyvSJpGFTplaO89zDs=;
 b=TvDrbNIHDsKO1QdvoLM7nMhCkZ7C2vxq1MAI1GaOO8XMnjSUteF8rZiBPgteRFK3/3uBm9dmInSgb9hU5WZAFzQwnMvE/Vo+KcnQdzU8+o1pW9snfPUOSdk02nRGh7P7r/2HdMhAnMPHShJ4yIlomy2IFKlVHC6fW4kI9+mZSUYbMA0PXMA+Khtit9d2ypBI+/STZ9s6ZcklejXURGuEzXjn+v5cDzZ7PZVsgQFFG+jqG6ZIzLRfWL094jh+9/JINp1xM9YcuQVoJnkfGHS8ZTPlIghJxI5ww8YpPyPks2xGpj9aRz2Cx82lYaHFZ6G9aWjbEoa7mP8nj6i4bRLzSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7288.namprd11.prod.outlook.com (2603:10b6:8:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 22:10:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 22:10:29 +0000
Date: Mon, 26 Aug 2024 17:10:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_drm_fdinfo: Extend mercy to the
 upper end
Message-ID: <fr4mb3ekn3dprmrbcuwb6qvpnn6boodnla7c43rgaqvs743dcw@schycxlcy4mm>
References: <20240824212437.1167757-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824212437.1167757-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:303:6b::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 212ec643-4a0b-4cbb-6198-08dcc61be587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWZpSnJldFpYaHF2L0J6SjVXSEJWakNqNjZ3bVYwOHdGc2YvZWFuVlozcUpR?=
 =?utf-8?B?bU1Ka3ovVnArK3RPOHFNL29hRVBrTk9OdkZVK0k5c21ITlg0VnRHTVJhQ0FI?=
 =?utf-8?B?amFGOFF6MHBHZDhNeDJVeCtNcFMycE9CRWMzT0w0ajJ1TG9GYjN1enFvWmw2?=
 =?utf-8?B?amhxSHRvQWJhSEZxdmovUHBRaFZkeUo2NVh3dFlpM1MrWUlEU2RScExWS1lW?=
 =?utf-8?B?MTVmSXBUZ3IrMngyN2lDK3A5QUR1Rk5oaTBXb3Z4NGFNZkU2MjRxRlhYZ29Q?=
 =?utf-8?B?TkgzRE1tVDIvdVdCYmdFZk5YVTRYV05meFdkUlczcTdhQ0x2bFd5Qm5SR09q?=
 =?utf-8?B?QzIzb0gyU1k0ZTVlc2diR0t5RFUyZEx5dk1HdGVJWldWRDM5ZGk4WHZsaEpp?=
 =?utf-8?B?THJkbTcrUGhCTEh5OFdLR05SVVpYOXU1YUw3WUhURzhjVkFiRURESWVjWGJC?=
 =?utf-8?B?enFVLzc3VWVOZWZXMGNQd1pYL1pzM2U1Rk42dWpkbnN2dFJ0U1hPZTVuazRN?=
 =?utf-8?B?R1ZSdW4yMUUxamUrS1hES2lxQ25sSWQzbGF2YkpQN1pvZjNoV2R6VWtsK1VH?=
 =?utf-8?B?aGhqeUxVaCtOWXZCSG9MejIwMThCakE1N1NJWVlodytMdkNzc21MSVROVGtH?=
 =?utf-8?B?dlVzNDJ1S2pvdG5UbVk5eTBzWFlIOGtEcEhEZ3pCbUlQcnVSS1Aza0I0Qm40?=
 =?utf-8?B?V3R1d0hCYXFtNXYveHY2RUJvdkZLVjg1cHBmdTJxU2NVUmJEWFRPcWo4YzF2?=
 =?utf-8?B?N2c0eEtlejQ4WERBMmQ5eU5FakJWbmZRSVQrT0tWT1lWQ3NsNEtlaGM5RHNJ?=
 =?utf-8?B?US9hUVR1WWdIV3hjTVg0U2hTZ0tHcWVRV3VXNUUyZTlNTFVHdkxFazhvTkdV?=
 =?utf-8?B?YnozQkRWdktSeUFHb09VSWMyYlp4eFRIbVBITWtQUmZScjNRQ1I2bmovMHMr?=
 =?utf-8?B?VnNCYzh2dWp1N1ZYcjhlMVRTZ3Q4VUkvMHlkY3lTOWF5ZDBFdUF1czlJU21w?=
 =?utf-8?B?RGJwVlZYZE16eHZpN1ZYRklLdjByYkVHUW5nL3l5elpoL09UeWxUaXQyTDNo?=
 =?utf-8?B?T3c4K0RiNTc1T0dPbkhEcVk5OFVXT0YwOUE2SS9xV09ZMG5XMGV2Y1Jxb1JU?=
 =?utf-8?B?WmZQQ0FZaHFTaUtqZi9va24xcXNiclUxZkUxQ3gwdVZzRk1UdHJobUdPRHo2?=
 =?utf-8?B?ZnQ4a3hHR1RRa0RVYURYUjdTRDN0dEFJb0QzcHI2K3lJQ2g4TzdMWkpTSFdq?=
 =?utf-8?B?N0VyVUxGcmpsRFZpK1hDMnB2dm12T0VDRmFlV1hYdEt3YnNMV2M1ajAzSm9u?=
 =?utf-8?B?WlBsaVdySitNcjJPTlVKeXJYVCt0S084enhJRE1vSWNoeC9kc2k1dEFFUVU5?=
 =?utf-8?B?bStNVVJON3cxQWx1SVRZdDZPQjUvYitCV1dYNWlOYnpyalcwaDNtNkhwZXNB?=
 =?utf-8?B?cEhHQmhpbFhrUEU5Z1hobFZJQ3VDTUZ1TGQvODZWMC9zcEtNUzJOWlFWQjRZ?=
 =?utf-8?B?TU1MVnFGZUJTTlBUaGEzOGw2dmh2ZmpFRTUxb3lCT094aUNaSVQrOS9LaE1Y?=
 =?utf-8?B?MXB2eDhnMWlqZ2lhVFFVQldGc2VVek8zbWxKOVU5cTVnd3R4K2JJcVZHNDFk?=
 =?utf-8?B?MzVLaitzelFYMUcvc0NXMDVXR3dVRTB0bWJLYXNEcEN4aUtIbFRFVDg1dks2?=
 =?utf-8?B?VWFxLzEwSDF4ek1LLzNPRmlWNjBRK1JPby82dVNSODhtV1ZiZ0dabDdMbEhX?=
 =?utf-8?B?anM4YXBkV3puUXFNVjR1K29JcXhrMkZaNWJjVWhHdVg4cjl6cXVzckVvTUFi?=
 =?utf-8?B?SjNPM1U5aDVxS2ZMMjI3Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0hRN3U3WTVVTlJjYkRnS1l0OHc2cUxCOEp4WkJyVThteTVVZTFQMEc1Nldp?=
 =?utf-8?B?K1dvbDB3N0JzZmdaSnFWOGNLKzA3M0MweEk2anhsTnBBNXY3bUpCN2VVeE1N?=
 =?utf-8?B?bXpZKzk3LzBKcGFtenE4TGNLaURqMnhMcnRXYS8ySGtodXdIYTBTWmdVak1l?=
 =?utf-8?B?bHdEZnFSTnpIQmxKbnloeENuaGordnlzV0RtSEV4OG5nNmh3QTl5U0JNTndD?=
 =?utf-8?B?WFc2S1pvTEcvK0lwVVkySW16Z0M0UFhDVGdDNWNKOTBWVzBOVnhLSXlMYUpQ?=
 =?utf-8?B?ZTNmenNyY1l3L3hGbHQ2U3ZYYWZPd3pqUXdRV25NMkZpdEcyVEwxUzl5WVE1?=
 =?utf-8?B?blM5a3lOOTR5NDRUZ0RoSVJ0ZDhjQlNpbGdES1E0bnNRSjlzYmhlMVhXQnFm?=
 =?utf-8?B?TFJyVHBySXdyaWJYdTdzU21PRE1zVlZJYmtRdjI1TUVrRHBiQXNIaWlra3hE?=
 =?utf-8?B?OWp0OEw3S2xYdXoxOTBjNG90QVNoeEZMckZ0UVBOaXFoUzBja2FKOEtERm10?=
 =?utf-8?B?Wit2TjNkU1k2NUlmb0FmY0N6UC82OERabkVFU1ZYUXJZVE0rdnhxd1pCK2Yz?=
 =?utf-8?B?YXdTQWtRWFNuajZPVUhhbVhmSzBkVmJuQlA2cUw2bThiWWNYcC92am1hUlBH?=
 =?utf-8?B?dmh2Qk1LV3ljdFhRYmhmT3orUk1pYkNZdnpRZi9WdDR5aUg5R1FOMzRjYnRk?=
 =?utf-8?B?ekVON2ZBTWVQdUltanJtamt0NktUMndMdmlLMHJVY25mcTRpdkpCUS92UStj?=
 =?utf-8?B?dE1pN1MzMXo4V1lwOUFzb2FabVhhYnNNYUtESFpDalVob1NBU2lGZ00xbmdx?=
 =?utf-8?B?L3hGSmN4cU1Za0VnOHlhSHR1SVNZMWZtb0xCS002Y2VNWW50Rnk1dmhNTXZH?=
 =?utf-8?B?dzRtNVlIY1pwSHJoQzI1TVpGeVk3cHJudDdndEhWVWRrN1lQRjM3ZVVwT0No?=
 =?utf-8?B?VkxRL1FIZ0FHRzAxaVVmQXNLbS9wRjdrVjhaeVhZTEUvOXpHQUZaWFByV2RT?=
 =?utf-8?B?bk9sMk9RYWNTdFJ4UVg0MDMrZStPaGtlY0Q3RDFMUWVneEZCRnYxNk5hUW12?=
 =?utf-8?B?VDZBeTl2dEpwazI3d2tLUk9MVElqM1h0c3pKWHlQZEcyUjlldk10UTZYeTh2?=
 =?utf-8?B?bGE3ZjRLN09QWkc0eDlHSnNNbUdidXB3M1V2ci8rS2ZkbG1IZFByVGhYbFdF?=
 =?utf-8?B?OVA1WkFLbkdKc2UxczZSUUpVayt6clpxM2lWQU1SNEEvK1ZYTE1Vd2w4T0FC?=
 =?utf-8?B?cVpXUnNLOVR6dkFuZVFvMi9qeSsyNnpBN2xENFlNUitNZlVwTWNnVmJPQWVq?=
 =?utf-8?B?eTFjaG53MlBSZUd3a1Y5ZWZBc0lDRjJ4bXBveVBpTENobXd4WWdWL0hHZWZh?=
 =?utf-8?B?eGpyNnQ4V3FHT2xXekxPbzh6S3poRlVkdERyUGJ5cDR4b3lXVVljSWRIVmVw?=
 =?utf-8?B?dVNvVjk1Qk9aZUNJejNnR3BtUzlKRnk1bkpKRzMwblpJSUNoSEVoWHVyMlhO?=
 =?utf-8?B?eTlKWW9PbS9xMHRBbkYxR0NTS3FuUzJHZGhmOWVwc1pxeHlCeFR5VFB5Mi9q?=
 =?utf-8?B?U1piRWhiVXZwZVAwQlZOVzZQMmYwUk81MzZtdUZSbE8za2ZjODdtNnRGMU1D?=
 =?utf-8?B?RFFKQk1Mc2hZV1V1VjJMalB4Vy9hWVczdEFWaTljZTFEVUJLYmRFUmxrOTdM?=
 =?utf-8?B?VG5ZTXpaUFE3eHNQM2ZYblpKWm0wdG9rNklRd0hmT0t4akRLWTNsYkhFSm5a?=
 =?utf-8?B?YmZFN3E2NFlvc3dQVFlZWVdVajJxVENERlkyMTJBMjc2RkRqdCs3RVpZMlRr?=
 =?utf-8?B?cHFEd05udDZYaFk3RFE3bUJxeXdXVXdMTmtxNE9RbzBRdVVWNDVPaW5iOHpz?=
 =?utf-8?B?LytWVlBFSmp4dmZzdzhSeXNxQXFHLzBRblNNVW1ZYmd5dW5sbUhLNVNSdnZs?=
 =?utf-8?B?eEhXeFdzNGk4ZklqTFcwTld1anBFek5zWUgydWpVdWNWdjBmcGZGaDNlRUpN?=
 =?utf-8?B?Y1I2QUxqOUNiZlRmL0h5bE1wbGdBL0FWQ2RDYVQ5ckdiekQremtpY2s0YXVs?=
 =?utf-8?B?Uk1xQlphZlhWeVU1NnZGUjBEZUJUTEpmYVgrWVZUc3lLUis4K0NUMjhIbElq?=
 =?utf-8?B?ZmwrUkxwT0xRRmpWb3JTY3RrNkkwa3FuMlNtUEx2WlR4cU1DTytUUUR3YWpy?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 212ec643-4a0b-4cbb-6198-08dcc61be587
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 22:10:29.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAMwx70fbMmE7oTplATcR77b9ByAgR8WiCv/D3YZeVfJsWpn5wxVJvJ6MUQbwGOCj14QSs9w68tg4roNwZp3zyZuDZqs5UZYWliNwG3p6nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7288
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

On Sat, Aug 24, 2024 at 02:24:37PM GMT, Lucas De Marchi wrote:
>When we are processing the fdinfo of each client, the gpu time is read
>first, and then later all the exec queues are accumulated. It's thus
>possible that the total gpu time is smaller than the time reported in
>the exec queues. A preemption in the middle of second sample would
>exaggerate the problem:
>				  total_cycles	      cycles
>	s1: read gpu time		|
>	s1: read exec queues times	|		*
>					|		*
>	..				|		*
>					|		*
>	s2: read gpu time		|		*
>	-> prempted					*
>	...						*
>	s2: read exec queues times			*


tldr: it seems the problem is between reading the total_cycles and
cycles for the *1st* sample. See below.


Considering one case in which it failed:

(xe_drm_fdinfo:9093) DEBUG: rcs: sample 1: cycles 19487844, total_cycles 20099857555
(xe_drm_fdinfo:9093) DEBUG: rcs: sample 2: cycles 29302671, total_cycles 20109533601
(xe_drm_fdinfo:9093) DEBUG: rcs: percent: 101.000000


Looking at the kernel code, it seems like I misremembered it.
Merging kernel and igt steps, the timeline is more or less like below:

	start and wait xe_spin for each class
	sample1: read exec queues times
	*
	sample1: read gpu time
	stop and wait xe_spin for each class
	sample2: read exec queues times
	sample2: read gpu time

So it seems the [*] is actually the critical point. Looking for trace
in which it failed:


     xe_drm_fdinfo-9657  [000]  2056.317942759: bputs:                xe_drm_client_fdinfo: XXX exec_queue time {
[a] xe_drm_fdinfo-9657  [000]  2056.317954843: bputs:                xe_drm_client_fdinfo: } XXX exec_queue time
     xe_drm_fdinfo-9657  [000]  2056.317955038: bputs:                xe_drm_client_fdinfo: XXX gpu time {
[b] xe_drm_fdinfo-9657  [000]  2056.317968871: bputs:                xe_drm_client_fdinfo: } XXX gpu time
     xe_drm_fdinfo-9657  [001]  2056.821949987: bputs:                xe_drm_client_fdinfo: XXX exec_queue time {
[c] xe_drm_fdinfo-9657  [001]  2056.821964764: bputs:                xe_drm_client_fdinfo: } XXX exec_queue time
     xe_drm_fdinfo-9657  [001]  2056.821964999: bputs:                xe_drm_client_fdinfo: XXX gpu time {
[d] xe_drm_fdinfo-9657  [001]  2056.821982168: bputs:                xe_drm_client_fdinfo: } XXX gpu time

Considering the deltas from the CPU perspective...

[b] - [a] == 14028nsec
[d] - [c] == 17404nsec

Considering cycles vs total_cycles delta above and considering a ref
clock of 19.2MHz for this platform, the error is in the order of
2685nsec. Worth noting that it would be worse if [b] - [a] was higher
since exec_queue would be ticking while we wouldn't have collected the
first gpu_time. In the second sample, in theory the exec_queue clock is
already stopped so any error there counts to the other side, making it <
100%. Much more likely as it depends on us starting to read the second
sample.

With a little more debugging and making the gpu write the timestamp on
each loop (by adding write_timestamp=true to the spinner):

DEBUG: rcs: spinner ended timestamp=9817720
DEBUG: bcs: spinner ended timestamp=9755785
DEBUG: vecs: spinner ended timestamp=9653024
DEBUG: ccs: spinner ended timestamp=9722776
DEBUG: gpu delta: 0
DEBUG: rcs: sample 1: cycles 19513436, total_cycles 130596422980
DEBUG: rcs: sample 2: cycles 29331470, total_cycles 130606141449
DEBUG: rcs: percent: 101.000000
CRITICAL: Test assertion failure function check_results, file ../tests/intel/xe_drm_fdinfo.c:488:
CRITICAL: Failed assertion: percent >= 95 && percent <= 100

29331470−19513436 == 9818034, which is reasonably close to what was
written by the gpu until the last loop, 9817720. It wouldn't make any
sense that the total gpu time was delta_total_cycles == 9718469 since
it's less than what the gpu wrote while running the spinner.

With that, I think it makes sense to consider the error on both ends.
We could invert the reads in the kernel side to read first the gpu time
and later the exec queue ones, but this would still be subject to
errors.

One improvement we can make is to start writing the timestamp and
checking that the time reported for each exec queue via fdinfo is:

	time_fdinfo ~ timestamp +- error

Lucas De Marchi


>
>In this situation, using the line numbers:
>
>	total_cyles == 6
>	cycles == 8
>
>In a more realistic situation, as reported in CI:
>
>	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 1: cycles 29223333, total_cycles 5801623069
>	(xe_drm_fdinfo:1072) DEBUG: rcs: sample 2: cycles 38974256, total_cycles 5811276365
>	(xe_drm_fdinfo:1072) DEBUG: rcs: percent: 101.000000
>
>Extend the same mercy to the upper end as we did to the lower end.
>
>Long term we may move some of these tests to just check cycles by using
>a timed spinner and stop relying on the CPU sleep time and timing on the
>fdinfo file read. See commit 01214d73c209 ("lib/xe_spin: fixed duration
>xe_spin capability").
>
>Also, this matches the tolerance applied on the i915 side in
>tests/intel/drm_fdinfo.c:__assert_within_epsilon().
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tests/intel/xe_drm_fdinfo.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>index 4696c6495..e3a99a2dc 100644
>--- a/tests/intel/xe_drm_fdinfo.c
>+++ b/tests/intel/xe_drm_fdinfo.c
>@@ -484,7 +484,7 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
> 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>
> 	if (flags & TEST_BUSY)
>-		igt_assert(percent >= 95 && percent <= 100);
>+		igt_assert(percent >= 95 && percent <= 105);
> 	else
> 		igt_assert(!percent);
> }
>-- 
>2.43.0
>
