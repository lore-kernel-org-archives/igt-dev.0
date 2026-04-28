Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4EEFF885D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 03:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDB110E0A4;
	Tue, 28 Apr 2026 03:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTM0YeO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9785E10E0A4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 03:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777348668; x=1808884668;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q1wlEAFiQ6ZunvryV3a0wt8bEsjlU6j9l8X35lpG0i8=;
 b=MTM0YeO6FvQT+NvkZ2Njk4J4STbyDqo83FjTdcw7A9Vm1z7XUy1cBP8a
 ymtNXJN61rq2a6f688IvppwJCBk1Dt04VIMvme+GafOkx5AiIp5yZb9h/
 W+utS/ErqpyQFVutppyVTzFJ8aKjbIpg+orpVRug5WtfFmojudKtWsGn5
 Vz+Ky7aqdGuG24LM2WHV+S3v8X+l/M6zjXQ1IfuUzgI5UehisOxfIm+Ko
 fwJSF0xPHz09cgWC1+mddbRiPqDlxDaPYUZtIIl+L62xGymApCdJo9APo
 +zGhOU9gmUmLSVahjWrsg/BgbpE7pv37ZBs8SIv/qdzcq7eVGFFC7bAmn g==;
X-CSE-ConnectionGUID: 2KtFARDMTtaqHBAqUZeIdg==
X-CSE-MsgGUID: WuXu1FIETE+Qi+TMgJNgZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77278178"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="77278178"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 20:57:47 -0700
X-CSE-ConnectionGUID: WlAfjtOFSkKeebkcNaODjg==
X-CSE-MsgGUID: SGPsuZLaRBCvxy31K6alcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="232955071"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 20:57:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 20:57:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 20:57:46 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 20:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbFBj4SEQGtZiNOy+kN2YvG8ed9XiDCBYhEgVhNQwtbo0CbCdxQywmmFXUp2UuL4UO1+tlOL0BiR+PI9vbnv+ZiH+WjZGI4JdW5zkXz+FcmUpP3ptDn4FAroFnoI2H7MWz/ONYRjC/y3Oottaio3V7hNhZj8FJtkLgp+Zn+SvQw5HvWQXUS/y+JibY3ZVJasbnUC9vEUboFgEcaZXbtfk8wAeymryLHhPPcrJim2CAHKvWAsn9UXldjL/Zvj+qS2XwoVDGONdoEcClqMkKXwlVVv48uXQaASrauvKDG9qM7tS+03tIfMN0THgTEWxdTrU8UpVoGv4Bs5o6TCIMVHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmeJP4yEiOf5qWt74ec8BhDXEMU0DFJZwSUP4LRatCA=;
 b=ExdJ7gV/uh8FPiwlsHDA4vjkqyctWX9QRTH98jlceqdNrsIq4AQIxoqNyX7RbPXYSUtxz37HUXWPwyF98HoYnPQF2BhPL97MUGGMbZOJfy/gm1f4QRJG+gDuLG+/vTZ06MG5CYO01PxIcIxtbO2+JX/9FazNSJArfeCi9DTTuo/G5Dvdr5Li9fWGZIbehf5XG9G2MzQZjgFhL8anYwujT6Ii8ppbAchdau/5fwpck0s0lABs3Q/NP1u+CdFZgqxVEczeL+uz8fTyF/A70SpPRAYIMiKmzbqrIyVYtTfyRcLL6rEyoUKDBcCzD2mdZalc1lv2C9DYtKLM1sMQVFNpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Tue, 28 Apr
 2026 03:57:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 03:57:42 +0000
Message-ID: <e9388540-8fa6-497f-a0ce-941c321bea8c@intel.com>
Date: Tue, 28 Apr 2026 09:27:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/8] tools/intel_vbt_defs: sync intel_vbt_defs.h
 with kernel commit 1b85a9b04681
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <karthik.b.s@intel.com>,
 <ville.syrjala@linux.intel.com>, <jani.nikula@linux.intel.com>
References: <20260427124607.3115567-1-ankit.k.nautiyal@intel.com>
 <20260427124607.3115567-6-ankit.k.nautiyal@intel.com>
 <20260427144130.uiqrfekvsovvzknm@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20260427144130.uiqrfekvsovvzknm@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: 8731063b-5808-4c5e-78dc-08dea4da4be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: RIbT5Q4Q77+9MTgecpTT8fbTob1/ncDTHinGYxPLR6i1jk04jS2h3adGL7ykmT5VZN/pGHhpzLOaHjefDtNCZExWOSjcmzvKQuhd7ZZQPdQtIogauqWXVix7/7Z85ff+vYyq1Z2arOPGz4jyNG141lpcwiUhdjsr1Rdg0OkSs2ycjgbpXtZBRK5KzSm6ewpNc0Qm+l5YTylU9mbSekfh50biZUekb8ZrrknbxMXAk5tkGwZUkpLZZsC8RRtAMmFT4sNHg0cwq4ZEVe+qO5ssUY2pIjZN2IpiOJEbT3j1fB+RRoddOWF6G0ftve1wT1+AWQhdkWw4rWcGfAwLTctPFufMRN4BH1wLRBa7A197hnLlEhSwfNJynQ/YxSve+PXsuhHZBrPYBojYYWcnC3SZZonAliUqpBkZb5kh280JJqrTORaUdsUTUmcSJ13viSG1XTQqpzUH0CYyWyLnZYK76GJ5cAPPgsT+9qS/Ac/utmnIoZVvXQ2Ir3FEHEWepWAv+V3o5mL2xjM27eIhu7+cogUU06qgC9NRl0J1rWhXOLWKzg1dB3IjuCaGPtDkeHNsYtDhV6n9GVR+fe9MpukFKzwqSCO3VoV0T3NUtwb+z8Kg0CiAs/p5p/xJ50Ry5fDgOioM/VPQVHrfyXEM7guHCTJ/626om25ksxnUWV++/OnZrqKtUW4iFNIj9yXQPOzcxv7mBlkXyx81V9uN6fFdE3Q+jseaCwZNV3SBfcq9j0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdaVjZhMm01d0JKZ01NanhIaWNqc1NiZCtCWDNPV21VcllHeTljalg0V3Q0?=
 =?utf-8?B?MWloU0ppRG00YXc1RUVRajNSV3NnWkZkRnRnWSt1NCt4eFVPVEQrQWJWbG1W?=
 =?utf-8?B?cDN4U1VxK1dHc1FmWlpaMmd4YWxaTjFEb0JhQVY0ZVZiYlZ1bWNhcTF4bXE5?=
 =?utf-8?B?WUFiNjVrb24xNzJyWkFYazhsNHhWakxVdjh2SlR0b3pHMC9MaUhib3cxaE1y?=
 =?utf-8?B?c3FieG9Ka3ZBNitWcHY5Ukp5ZlhHZkQ1cEtUbU9MNExMR0t1Z2xaejhQQ042?=
 =?utf-8?B?bVd1UDRSNVhFV1FoZjJTT3U5RmtJdHBIbCtqenNULzkyeWJXUnppN05pMUNk?=
 =?utf-8?B?YnhldjdIbkpPRURsTVJvK1B1VmJuNDZGdjhBRG44WVF2VU9TVFJqWk12aVRv?=
 =?utf-8?B?QTBGbmhjNW93emx3RHl3UktUS0pmMXRWOUhBTHdkSEZxZkY3WSt1cWZ6VjV3?=
 =?utf-8?B?VWJyVUtYajkxODIzeiszSjRlWnRBYjA0dW1KU01GLzZ4Vkk5ekhqRjk0Z2tj?=
 =?utf-8?B?Tkg4WWhCQlhGSitidzdYTnVvcHgrL1FCdFJZaGs4RDZWT3JWME82QnN1dU0x?=
 =?utf-8?B?dTNXMWhpTldGdUozYTNvTGJBKzVkU09SZlY3TStyR2plVlVmMXJjNFBSWWRD?=
 =?utf-8?B?bkMwTFNibFlnZmg4WFM5cnhPUmFDcUJZYk9DZTJGbmVUNVYydmhKcS95RXhX?=
 =?utf-8?B?Ty82VG01eVdOc0dyRjRYYTFQQW9rdXBqU0tGbktXalV3ZEVwVlRjczNoNmtM?=
 =?utf-8?B?YVNobk9lUE5uUGhMeTBxcTV2RExGL2N1azcrL1FXbyt6dEwxTTBBVnVFeWJv?=
 =?utf-8?B?VDVDNlRIcW44Vk9TMnJnRFdCYlBZT3dJR3dNTGhFM29rbEhjMzkrR1lITnBx?=
 =?utf-8?B?U0R3Y0xoTWRvcVVZNUMwY2RGeDVqWmZQRlU0R3JLSUJyRWsySEhCL2JXbVNB?=
 =?utf-8?B?ZEJEaVluVk1IdjNEdTN6QlU1UGZZZHg1MjUzSWxMbkRyZmRQdnF3V1BJMVVC?=
 =?utf-8?B?Qkp3Qksxc3hIaGhIU3EzTVJ3cXo2aVV1NzF4eU5KTmR6RkJ6ek5PVjIxeTZw?=
 =?utf-8?B?Ry9XTHJUSXBWMk5sRGN5bUxVSG9UYkpMUHRsTk9aNjRjNFFHb2lpRVMvWHJt?=
 =?utf-8?B?VkpRTUthTWhQcVh3TG5WTlZLK2NURU1qeTFhVGQyd0p1dlJZbTRKVnhYOVE1?=
 =?utf-8?B?VkgyUVduclo4K2g5QkkxNFZqd1c2azJOZWJacXBzMTB6NFpzbHdraDFxMnJE?=
 =?utf-8?B?UlVLb2k1VzhkOTcyaWdJMEZjRzRBaGdZd2JzTjBaK25qWTFxY2ZaUll1R2Zu?=
 =?utf-8?B?WW5ZTGNJcDN3NjBoOXVRcng3QWNQZlZ4YitKRjY4SWpWK1A1V1FuR0NINVhq?=
 =?utf-8?B?akQyRm1LVEpsc2NEN3BMR1F6SFQyc3plOXFEbjZibWZBc0xkUXJkQVB1S1By?=
 =?utf-8?B?cEpXZDNrbnFaS1RZRUdzbEo1NDRRc1hRNksxcStQTEFUQlBrb1ZSbDRwMGpD?=
 =?utf-8?B?WHY4M0M0RklKcU4zclpKQm5GbXVJdlVyUlFIUFJGakxRM2hQbStyU1ZFTzBQ?=
 =?utf-8?B?dlYxUFpqbXQxWVZNWU8rQ2tGS05ld3lwa3c2R0szTlVUai9ySEliK2dmV2tw?=
 =?utf-8?B?dlc2ckJwU2NqaklQQVR6YTIvalR4blNMOGFOUTllcGZmRVd2eTdTUGttZHA5?=
 =?utf-8?B?ME1YWkZ2cm1GbjVrSndFZ2lMRjZUczM0SGVnQW9VREx5am5ydy8rVzJYM0NB?=
 =?utf-8?B?SVE5NWhrc0djd0EzaVJMdDhEZnd3TlQyUW5MU2dVbnpna0UvaFNrNGd1cEk1?=
 =?utf-8?B?cm8rcVZFNDI2elNrY2ZhL0lIazloSllISXUrZEtCTlJLV2I1eFZTb3EzVTQ1?=
 =?utf-8?B?ek5RMmdWZVduV2VpTkZRMDNJejB3Z1dzSi8wVmR1WDd1MU9nT00zdG5pVzZW?=
 =?utf-8?B?R1BHNUNVM3hhbGFabVBCTDB2ZHhVTGQ1TXVvbGN2WFk1OHlkN2FIc1VSQmVI?=
 =?utf-8?B?S1QxeG9KR1AzYVZuNFNvdHFZUlFZRGt0djFpRWo0YlZGa01iLzJjRTZHaUFU?=
 =?utf-8?B?Y01mY2kyaUpQd3Vhc29UMzZNSXRMeEVZYisyR0hzKzA2TXkrQ244eFAzUk9J?=
 =?utf-8?B?L3dDWU5iN0t6cWJhSkNlc1pmZnZpSTRTYWxhaDg2MWxZTFB4ZEpoL3RDTDIz?=
 =?utf-8?B?OXJCYUNDRUhUTWdNaHVFZnBmK0U3WUNXdFgyemlDY05mWkxGS2dGS05kS1FI?=
 =?utf-8?B?R25xMXUxZHUxUmVSNHV0NFBDdzdEV01CSFRUTWJtcHZKVk0rVXJHQWNudlp5?=
 =?utf-8?B?b0JoaHRPTEdJLzhvWDJyMHZjQ3lPMHpqQS9ZNjQ4QXBMT3pOOHE3MTJlNTBn?=
 =?utf-8?Q?eMbutrePP/9fJegw=3D?=
X-Exchange-RoutingPolicyChecked: KhmfeAwHJAehcbGTZcQ/V55YLkUFQPdnR8rXVcgV9zlLcvMn8xMmmP3Q/pJZ1ekoIT6IFmReZ9HpiRzkP7gu7+CEBBvBxzscfC2qtHK/X6tb0HBKjeI4lWib1hx3GvkQYqq0liHSMnVYWja15DvzrBFnIbHLqbspmOEBtkgKzfjkZRsxfKJIfXr1wRi7eYCirWmF7OQgbjcZmpC3MbfSFNyF2GWP9lqgxh42+q5vD8STSi5/wCKtQN3u+u/s96WoVFq0LmrshjaguJbMiztZJ9jmtsa5dFKJeuOwb2K4Sl7hSFfbSh9LLYiO7RTsnOy4UDJWW6ttw2vofA9x7VUd7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8731063b-5808-4c5e-78dc-08dea4da4be0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 03:57:41.9671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fsut7yXJt4pgBJSPY6Ye4CgikdVexNbJ+8rhlm9t+/eZ2ZvOaRIOVCZ05GT9I61UxRUyRIVH3b5tIH+qBmOCD+lEMvBMU5OpC9/uiu89UsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
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


On 4/27/2026 8:11 PM, Kamil Konieczny wrote:
> Hi Ankit,
> On 2026-04-27 at 18:16:04 +0530, Ankit Nautiyal wrote:
>> Synchronize intel_vbt_defs.h with kernel commit:
>>
>> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> Please squash changes into one commit, with desccription like:
>
> Synchronize intel_vbt_defs.h with kernel up to commit 1b85a9b04681,
> this will bring up following changes:
>
> 1b85a9b04681 ("drm/i915/vbt: Add edp pipe joiner enable/disable bits")
> 203c7904f2d8 ("drm/i915/vbt: Add fields dedicated_external and dyn_port_over_tc")
> 4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")

Thanks Kamil.

These commits were generated using Jani’s sync script, which 
intentionally produces one IGT commit per kernel commit touching 
intel_vbt_defs.h.

If the preferred style here is a single squashed commit instead, I can 
squash these and resend.


Regards,

Ankit


>
> imho you coud keep r-b from Karthik.
>
> Regards,
> Kamil
>
>> ---
>>   tools/intel_vbt_defs.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> index 57fda5824c9c..0dc13d080e8a 100644
>> --- a/tools/intel_vbt_defs.h
>> +++ b/tools/intel_vbt_defs.h
>> @@ -1109,6 +1109,7 @@ struct bdb_edp {
>>   	u16 edp_dsc_disable;					/* 251+ */
>>   	u16 t6_delay_support;					/* 260+ */
>>   	u16 link_idle_time[16];					/* 260+ */
>> +	u16 pipe_joiner_enable;					/* 261+ */
>>   } __packed;
>>   
>>   /*
>> -- 
>> 2.45.2
>>
