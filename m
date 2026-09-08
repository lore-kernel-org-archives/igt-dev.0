Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A56C79FA0
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 06:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AD010E070;
	Tue,  8 Sep 2026 06:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhrmSoTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBABC10E070
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848345; x=1820384345;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKCcXlMD3YZFctY46v0dYtV2KDJzQZ3+P0OdpoSDHGw=;
 b=IhrmSoTSnr/46OphTFcloqovjNO3etxUKQa300OYgfp7asXEcFH7RGlK
 cpY7FmPoPd4iXyz7mCGryjydb3AfvXDAiAJDu5A7oFNcVufclofWvoZoZ
 r4gL/KDONOlGW54ET2zBeOBOhG/Xin1HFtUdDbLHc9jPOU77kfJPrBW/P
 4mwQL/7wlmJOUfTAB23+WauX+DTs64J+pmFmtWfNLa7Y9SLucyQUHr0GA
 98jIuPxzvs+DtRDAJnxJ2HuQbd7RG9DFIvt8CfLkZV+Yb2PeXrv09aoV7
 l96YLW0jSJEvcZTb0OOvr5RrQwYaILewOLunT1Nr8+bb6I/HbYmpf1nfa A==;
X-CSE-ConnectionGUID: 5mquT0aMT8OIYM4aJRJzqg==
X-CSE-MsgGUID: x9nv/iJKTwSkoHVG1+9fWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100399452"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="100399452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:19:04 -0700
X-CSE-ConnectionGUID: nbiW1PCuSISXrvc9a2+7EA==
X-CSE-MsgGUID: gSR17uApREKcjQupM2OQiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="269573642"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:19:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:19:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:19:02 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKvCy5psKf82RTiNPmTyQ/ab3+SJ2uiSS6o+FGtyP5AUFMAMW+kB0DfdegjVz97j/pPE3/tKUcvw+niQO3jaoWwZDuUMUylb29bT8BdJHVMoiHh6LLEzNt7BFlCt5B4G91VvhqQ+tOukQne4OFCbw5S8mO14gHBF502T/WzOwxLfu6LcftwjwcG5NvgGcI2Gfigl3p3rMXgyXzF7CUJ5Z4J/j56i9NRJB10l91Waf2gtfbMyGQ6ow4MzsbyDZ3TFcR7fU0K6O9cs0ekORzXaPkcEQOH0Iq9Um7Pib0tgg6qVcjVnG/6oNdEAvohs25dE47T7SCo5YHoTWwrkTp2OsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a32VzIPkyeU7ztrTMPkN5Xy3RSJYwMKk4+KOR3zdZc=;
 b=OZiXMJUoZxlgHZTXsYfHBAmGov7nHRKaKWvTnDYb+MJ/FRTQt5etGYShwfUhy7MKZ4M35PyfIWgEILupUdsXfy9qH0ENukJAqPnbktZA5p11mwPQZmJSJ5WpG79p0sD0dV++8XKY0LMUyk9QyOw7ozF6pGqiaNEdGq44bVA0gS2zxEJAv8W6chYiWb1lcpKH3FUGdL2/THJ9wna/zCNQH5guWCYL2ATCqSSz9IZAZh5cXVA5kLLUMgwTJwRGId/CUBvEJUFbxN2RDiAQMVqLm0S7jpqShUBjQc3F1Y/C4L/zg62EE+LlNa6g2gMIE6z8EnHdV6w6FUK3qByJamlAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CH9PR11MB9925.namprd11.prod.outlook.com
 (2603:10b6:610:345::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 06:18:57 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::9323:8d2:64e0:4c7b%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:18:57 +0000
Message-ID: <c2d4a44b-a209-4c8c-80ec-4c8cda31a5dc@intel.com>
Date: Tue, 8 Sep 2026 08:18:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pat: skip the write-through
 checks without a WT index
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <zbigniew.kempczynski@intel.com>
References: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
 <20260904085650.98553-3-sujaritha.sundaresan@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260904085650.98553-3-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P191CA0026.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::31) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CH9PR11MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: 111f657c-2eba-4b43-aa43-08df0d71109c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 2UeLxphxzrHbtU5hOMfil259WQR518+NkQvAx9rT7VtokZtTtNs3iHO+5xGN3YBMxid3cBY/x+EMSGfWYcG5nFuk321Dw5NWjxLKd729kocxJg61XmBtlTrCv4GZIuhJm53R1IqfEFC7tMeZM1+Zle4+qASkH4Zgc6nXjqIJkSLwvyKIefZfXL+SFv1BEidbzy5jpiMdrY8aQH1GAm3td9/aT7yLV0Cf/eKY/WuFEQZIhtp46YcjL+W0tdSzDuhYM4XkZWyUKGDon/JPywjvU3aSUAND0j+t+d8o6z/DOt5V2YPf1LiDLhoUxiCd5u5EMRrgKLc3y5ileln6njP8StO7ZztaF0QdUBa8ag4EqtqA5af27oSULEmC/ktXDdLN9guhf484mHZV26U/tWJo8H9wQacjHVcjantiDKW4XNEYX3mmJVLnHd7TJsYm+MLcU+xn/tOuewyrzjk0sbp2lBCA3B7odbqA899p33huZcfqnxrkRoVcyY0GQx2bNlVvFisA8Q3Oz7+WoCzqiVPxayAapMu2Pfm5BKcgrP8Robnnv7mRm4yEz67Hrw1F9EeqJkeb5VgGxPsA7rUNC0MWHZB5BsQbPOgV6dAS7LL0zgA7Xlt5qtO908+YLVdKxmojooLIXl5jtd47GoqCAiDKW/eMDeKeVr/steaVpuytxMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2YvUWV0MDdncHJsZ0hKajg1eTBxaUNhaDJnZjJJeTUxeHUxR3I1OUU2VDg0?=
 =?utf-8?B?anN2WWpsd1NxMXZMUm1pRnZVVTFWK3pWbUxNelkyTUZYSVZwN2dNeVRwUnIz?=
 =?utf-8?B?amNOdm4rclNpTHhHL2RHRHR3R3A1NmMrK1BBUWZPSEtvNC9Ud2ttY3BlNlFk?=
 =?utf-8?B?UGhTZkhLQ3RxT1UybUJJTnFDNlZQaHRSbXdCWnlEZzZjSXZobjlQRGNvK21u?=
 =?utf-8?B?WVd2elJXNFVLbC9DVUhlOGdnSUxzWFQyaGxqNG8rQklaSUFsL0hwUGRwUkFv?=
 =?utf-8?B?dWJTUW1FRUlxUUR5ekpzZ3pMM0J3M0psSWNBbG1UWmxUc2xCd3BtaHlmanE1?=
 =?utf-8?B?a2VUUnNEZlI2Yk80S0d4Tk5rYzEyK0Z3K2JPR2FXeTd6SnlwNGlUQTlVRFVT?=
 =?utf-8?B?ZjAreHdUcmNGWkhORDNsQjR1VUZmek5CMmtubWh0Unc4a2RRVkJzWHVWSjdu?=
 =?utf-8?B?c001RjhjVmlaM0RpaDZHcXVGVS9Dak1RK1p4b01YcjBvamZrUU1OUlFuQTdC?=
 =?utf-8?B?OVoreElZUlQyNThCaFJvM0FFcGNhcXhmQ1cxZ2lhS1N2V1FtV3BDT1lscUlR?=
 =?utf-8?B?ejNvdXZ1UisxbytEaFIzT0xHVlJOdUs4ODJsQjd0bkhhayt2eVRmWnVyUUVJ?=
 =?utf-8?B?c0RiYTAwSlFRZUJzc0tNZVVxZkxqWWJhODR6ZkV3d2JITU0vMk0vSE41YnR1?=
 =?utf-8?B?M2lyZXQwellWaDJJNmNKNjJpTVUreEE4VDJjaHpUbWtZNmNNbmhMY2U0b1dN?=
 =?utf-8?B?MHY5V1FxalN0SzRrazdPc3p6UnNpTkduN1ZWZ25wbThPZWRSKzJiV1gxQ0Rz?=
 =?utf-8?B?aENiQWlqVjBVM2NtWjNqNzZWbWwybWtpWlpUb2hSUXNmQ08rM3lQNnhUYVp6?=
 =?utf-8?B?aHJqeG83azlQMzUyTjM0aXBlS1k3YjNieldxY1htMHZXeWNIWnV4M3gxS0FY?=
 =?utf-8?B?UThtRzl0YldPQlJ2OEczeTdRZWVRZ1BYM1BLZU5wVnhtQUJzd2diWVgvM1dN?=
 =?utf-8?B?WTBVbVdaVTEzemVyMlQyeTRqd1d1TytZOWNvZ09TeWxKR3ZZNm5BU0RDV1hK?=
 =?utf-8?B?MVM4NXBwbGRkcjkyQUdtckRLSVF3TmRsWjNnUU5IeEluc0ppbStYSmZGUGNJ?=
 =?utf-8?B?QU4yOGI5M2dhSkR0U1FQaWE2aU13ZWsvWG5oNnlTS0dnUjFRemRJdkJWMmwy?=
 =?utf-8?B?eXNmSXo4VTFKemw0LzRCNGw4Y3F5MHc0eGNGZk9wNHJuNjJLNG01blM5NWhK?=
 =?utf-8?B?ajZPYVZBZmR1RWtENGMvT1NyZHZTVWIxTWNwTFpWMFl2VzlsazdFQ2R3cDNH?=
 =?utf-8?B?WkdyMHY5RC9WOFlqbmZkT3EvMXhuRjhiRURuWS9jNnRMdkVSRzI1dFpKaFlG?=
 =?utf-8?B?S3ZKTDM3ZHpCOHJ5T1pBQ2lCTzdrOXR5NG9mYkx1QXF5MTRBdGVFNWVKRURG?=
 =?utf-8?B?RzNQOGdiN1JIRmFkSGR2RXhGUVRsUnh5dittS1kwYjJ5TW4zY3RrSXV6bW1x?=
 =?utf-8?B?UGd4NjBSTW9kRit0UnlSVU9uYWYxYThNOWR4dk9nM29acVdFS2pEdnJXNzVN?=
 =?utf-8?B?dUhlWnptbFQ1SmplRUxEdGNVNXg4alMwaU5kTkRaeUp4OHNVRjIxS0p5ZVNj?=
 =?utf-8?B?WmdXcVEybUpUTWJjb1JzaE00QlNwK2RiVTJXMWNqb0srYnVYMUZnZ2IxRkRE?=
 =?utf-8?B?RlNSeHlmTlN6T0ZqbmpSTTd1K25JMlZKRUJlS2hFMml6WUJxNnhtZlJhSzM0?=
 =?utf-8?B?d1A4c1hUamtzZEd5WnltUkx2OE9KMk41b3p1VndQMlRQTWxqZW41ZUxaMHBs?=
 =?utf-8?B?anR6NTA5clRMOFFPNVU2UG1BQS9jc3R1U3hzUEY4K1lZY0hFS2RTTUVTK0Z1?=
 =?utf-8?B?V2NYK2taQTg0WW84TTFSOVJITDU1TWFHQnMxcWd5MTQwSkJGVGFSWkEvZDk5?=
 =?utf-8?B?UGNteHV6ZDJvZUlBZ25FbC80emF1WUhkdStrUnRVWGVmc1RreVhwbVlWMzE3?=
 =?utf-8?B?ODdaTlBJZzRYQXNsTHZ6bytOdTVoV0xjMXZlNkczL1lVRHdWM3VrY1ZxY2pr?=
 =?utf-8?B?VUVtNTlCclZRSFhXTlo0dkZVUzdmd1F5aEkrWFJ4ZUo4TlNLdnIrYlQ1UHVH?=
 =?utf-8?B?NnBwandyUFBZSGh1NEx2MHhPbk82d2cvU21mcVJwcVdJR2o3R3A4dUtiYkFD?=
 =?utf-8?B?UXlVRVBtS3pWK1VKb3JYM0ZHMnBUZ1hLT0REZUVicEY3QlRCYWhneFFncnhF?=
 =?utf-8?B?b3djV1l4ZUc3Mm51Z255TnlXSjdzOWxGWTdqMFhXS0dHL1V3Y2JtL1owMmxJ?=
 =?utf-8?B?MDNqMlNVWEdPKzA3cHpTbGlwTGVRRFJtUk1sc0lVN2d2WEptREVBUT09?=
X-Exchange-RoutingPolicyChecked: J2rRuxf1odbfOythoLTCjHbBoC56hlLLbht/NvIEYSnZV4/AcbpagiFW0cpjLdeLi9RVLTiYE7nrW6m70VRZlOKpLc4ZPV+xFzsnb8e3iMwN/CGY4sn7UP8ebzkeeQ22iIq+6W/tjROW+qYW3nKJ+QpNwWb9NE4R6zAGMZxdE+nwPuM96vvuRvWFdJ7L1WqD/uo5RrVPST1+yejbsibrdGLYFH6qDbez9SP5YdRCevTQo7uHMyZ4Jk2e7C9ZZ2PBcFXqIeAyuB5jDFQP/BZvHXAegzkxSGMbeoeLrxCrlKGjO2tqtfFs2bS0OxdoKdz64cPTD5DxHwI5XhiohDX+3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 111f657c-2eba-4b43-aa43-08df0d71109c
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:18:57.4475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpL/D48MN39pp5w7XTZBbJ31UcM/2tyBztsf9/kuRsRa6X4xay6TMeciaeKKDAhqci/hoE4WxHNOvcbiMGwiUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9925
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

W dniu 4.09.2026 o 10:56, Sujaritha Sundaresan pisze:
> On platforms with no write-through entry in the PAT table
> intel_get_pat_idx_wt() hands back the UC index, so userptr-coh-none,
> pat-index-all and l2-flush-opt-svm-pat-restrict each repeat their UC
> check under a "wt" label and report coverage they do not have.
> 
> Gate those three on intel_pat_has_wt() so the write-through checks only
> run where a distinct write-through index exists. Platforms which do have
> one are unaffected.
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
>   tests/intel/xe_pat.c | 38 ++++++++++++++++++++++----------------
>   1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 9dd4ffb69..060e65aa0 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -86,10 +86,11 @@ static void userptr_coh_none(int fd)
>   				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>   				   intel_get_pat_idx_uc(fd), 0),
>   		      -EINVAL);
> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
> -				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> -				   intel_get_pat_idx_wt(fd), 0),
> -		      -EINVAL);
> +	if (intel_pat_has_wt(fd))
> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
> +					   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
> +					   intel_get_pat_idx_wt(fd), 0),
> +			      -EINVAL);
>   	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
>   				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
>   				   XE_PAT_IDX_XA_UC, 0),
> @@ -323,6 +324,7 @@ static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
>    */
>   static void pat_index_all(int fd)
>   {
> +	bool has_wt = intel_pat_has_wt(fd);
>   	size_t size = xe_get_default_alignment(fd);
>   	struct intel_pat_cache pat_sw_config = {};
>   	uint32_t vm, bo;
> @@ -339,11 +341,13 @@ static void pat_index_all(int fd)
>   		      0);
>   	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
>   
> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> -				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> -				   intel_get_pat_idx_wt(fd), 0),
> -		      0);
> -	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
> +	if (has_wt) {
> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> +					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> +					   intel_get_pat_idx_wt(fd), 0),
> +			      0);
> +		xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
> +	}
>   
>   	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>   				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> @@ -413,10 +417,11 @@ static void pat_index_all(int fd)
>   				   intel_get_pat_idx_uc(fd), 0),
>   		      -EINVAL);
>   
> -	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> -				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> -				   intel_get_pat_idx_wt(fd), 0),
> -		      -EINVAL);
> +	if (has_wt)
> +		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
> +					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> +					   intel_get_pat_idx_wt(fd), 0),
> +			      -EINVAL);
>   
>   	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
>   				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
> @@ -878,9 +883,10 @@ static void l2_flush_opt_svm_pat_restrict(int fd)
>   					0, DRM_XE_MEM_RANGE_ATTR_PAT,
>   					intel_get_pat_idx_uc(fd), 0, 0), -EINVAL);
>   
> -	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> -					0, DRM_XE_MEM_RANGE_ATTR_PAT,
> -					intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
> +	if (intel_pat_has_wt(fd))
> +		igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
> +					      0, DRM_XE_MEM_RANGE_ATTR_PAT,
> +					      intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
>   
>   	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
>   					0, DRM_XE_MEM_RANGE_ATTR_PAT,

