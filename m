Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CED5C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 09:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE0910F6AF;
	Wed, 24 Jan 2024 09:19:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99B710F6A9
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706087966; x=1737623966;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WWlsJASqiLjRiVkxzo2U8lox+zMfYlaaPiRkXQWPlDg=;
 b=ImYjEkrgzH6lHfQrJUJ8w4PMIwaisnu0N+c8I0U415jYnKgpN8UebtrC
 JTNN+QDRhqgVDfFH7GECo4lGmqePxNnYI0s1DvGdAMhLNv9TC5yjcDmQh
 XwyHTBRw3Y/1PPeq30+w+hfy1kc2OQwWK44+i3nOnhO2PxGR2sWeH4wic
 D46A81N0MxCgQsEeNyLgRYs2MrjWFscWVrXXSNNRV/YkUHRQ7Wi/We6G9
 v88LI+mB/TqFIJKwb1pcPckVQuEz/1IsgrwV81htgOr2xyDinglh/rtxc
 E7RuEDQFyirUJobvwuv3LuFR6iUhnKEjU6hGAKZxpf0T4suGT/A65DtZp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15313813"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15313813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 01:18:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820392640"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820392640"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 01:18:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:18:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 01:18:43 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 01:18:43 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 01:18:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOc76rcfCEmAboeJmY0T30sCB98VAcSjtMI5ttmO1DKYQJFBi53r8iIy+Ab5HpCHakGm0nZezEV1ybTUxgTpFvyZixr4dBbwFtQq4OcekYTMpJAdg2/K0BMzAH12s0hVVAhuIWqzAo9dh0fDHbiTRJYezCPrLwqn6sesI2W33iZYkjuUmfmtrNj5DQk5m7SDvwBt2CwM2p39lidlv7CvidQ2TPxGhvYEjIIhI4Ktryj1+UCDxuHn5JH0ZPBkJs0gGE+YxdVhIiT6pEMyY1hkGa2MqyA/unEmyDHMrWQVMw0w2PfD6DZw+PfG2wAMwD9AtUlt749oo8BK/mGeuHWjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8YHt0Gdmtl6qBMI5zvKVxVx/p9UqvnkIty07fXF9Ss=;
 b=P1IcC6wH0D0KWPMl9PaWSdZyrvzTQ58VTkpJ9Ngrhgizyc/SjdXS2BLI9JRxBYMGaO8KinKkLWklm+YRLt8puAhCo5/+35+hcQLERXYKO24LKc8+pIFbfxdCGRSMEe0ixZWk6aMLchjGa1WDPO5PqerbXGqEBSIck34sGYh4sEMC1oKlX+hZR38e7m2x/1dwl0W+L2qj3MOChGdDmFwj89EnwqvtdX4aeofrrDO0YFsEexblIXO+RPoNS9RoVYGZIlZwS1/ncfOdQUljosaTHTQxqoBqPjuGEdnQNiVuJaFuNXCXkNL8JG3lhP03OduwouID6bjiSmCCFdp42X7ILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5726.namprd11.prod.outlook.com (2603:10b6:408:164::23)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 09:18:41 +0000
Received: from BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::62d3:1fdc:8d92:7c80]) by BN0PR11MB5726.namprd11.prod.outlook.com
 ([fe80::62d3:1fdc:8d92:7c80%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 09:18:41 +0000
Message-ID: <969cdec6-1b12-4b3b-9b68-51aabd7e796c@intel.com>
Date: Wed, 24 Jan 2024 14:48:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: add new test to
 validate force bigjoiner
Content-Language: en-US
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20240118161847.1001234-1-kunal1.joshi@intel.com>
 <20240118161847.1001234-3-kunal1.joshi@intel.com>
 <57317e40-9c36-42c6-bf2c-dfef86377e4d@intel.com>
 <CY8PR11MB68893AACF5F28CD7C675237DDA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <CY8PR11MB68893AACF5F28CD7C675237DDA7B2@CY8PR11MB6889.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::22) To BN0PR11MB5726.namprd11.prod.outlook.com
 (2603:10b6:408:164::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5726:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 358b5788-c1d6-420b-ad52-08dc1cbd74ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0TKxQtJnT4s7zXc5D2kmzKWp3qTD8KKpAOjfKOlt0I4PDO0pFZHu8JKMM2nXD6jKx/ZXNensmqIIcKftTVl0kb5/1AN+39RMllIAk8TKVhLF/49rqYJXhI6ZSh9k5uK5Q/PzHgQ42fKrMipxeoWahksD3yUOKeDf7Peq/HdLXcARbY4rFpZYHni0T+maJj0/2udNz7hm7Y58xTAppOl9FOZE1YEmEn7YrkcOl4j8nJylaAV/VFLFX38PWVF9vp/ckyWvsu15Lj2EOyTopyzwLNR+ZlEdRXjDbc7bfEjM6SEuVMVRV3QM1MW5f6OfQY7cdaBtaP49S/++MWDXJ2tbCrwZydloj+i7ky2aRlq96aP0oOWrgOKTWJfngjK89I+B0Q6jEIEittjHeAPNXZC5f5etJfMnlCSGozK/8U/GmJFgYRtCk/kE2lxNTdq9VAU5HBK1APDmGXZahObQtKH3GkZxCAXvWezw6wefKVWUxisYLe1TBRWLAJj80H7sytZ3xSURhu72Y+HQBuPfeyYNHkudBqRk9CZ1CyG9dGVbaSvoWNBtNZfbX4OTQGnplk18utVmjysXlRPynR3vwDeiZLHzfNLpzSTN2VI/8dUHFyJx25BwsxGkfUlcnqhKWgzd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5726.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(8676002)(4326008)(8936002)(31696002)(38100700002)(82960400001)(41300700001)(2906002)(86362001)(36756003)(15650500001)(54906003)(5660300002)(66556008)(66946007)(66476007)(110136005)(2616005)(31686004)(316002)(107886003)(6512007)(6506007)(53546011)(6666004)(6486002)(966005)(478600001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkRUN1RnRFJkcEFWbElBRDNpMHJ4WGdJaCtLakxId096TTdxZWZCZGVSVjVK?=
 =?utf-8?B?ZStLZndMZGxURDRqTGpIMXBmMnJRbXc0U3FaYzFhaE0zUDIzWWJiTzVudFIz?=
 =?utf-8?B?akFwQlFTWmpJZnVuNytDQ21mMWRjWGFVdEhVVThWeloxWjE2eWFPb1BZNGdS?=
 =?utf-8?B?Zi9kcVdGNnlQWFFwUXJTUmtRY0ltSkNOQjZhOVJxRlJlNEVzWXRRbks4NnV1?=
 =?utf-8?B?bHc2VmFqU0tTR3FnWCtldGpzMWdlb05WYmlMRjZUVVN5QkRSQzliMXFXaW9F?=
 =?utf-8?B?WTZGQVk2aDZvbmIvcG5Lb2FpYVQ2RDNlZXRwSnpwMXVmOTRWVEpVNFJ2cmsr?=
 =?utf-8?B?NWpEb3FCY2hsTWtGUDlDUkk5ZmNWbU40TnIwb0VCbkYzVVlRWXluc2N2RE53?=
 =?utf-8?B?TEFxMzhXZFMrWUhCaUxMS3AvTitqM01kcC9vak1wTTJSNHlxTndtMkhyV2hR?=
 =?utf-8?B?RU5sRUVPQzZmeDBnL1JZU0VsMWtVNUFyMmpabFk1UXBScTFQd09SRWJXRC9J?=
 =?utf-8?B?L1BoTmdhaHYyT0d1TFp4bkVSTll5ZkJRV3JReXZ4dklOUDVCS2J4dG9xR1hk?=
 =?utf-8?B?YkFFdVlKZUhBVDZTU21aK2VuZjNxUFNaQ3k1eUlnbUNCT2srZkI3L0lHTmhr?=
 =?utf-8?B?cENvZVhqRkhjc1c3cys5UG1NUmZjNDBSVGtTWkFIcG5CQ3NlN00yWkNsYXlw?=
 =?utf-8?B?dGRVM1ZmaWFydmJuVmkwREhlYXdzM200citYOWxaN01vdkRtREprUHpod1Nq?=
 =?utf-8?B?ZXFjOXVvR1VjU3RlRk5ieDFOOTc5cFF4Mm9OYWJhTVhJZVlBNEdCc2dneE94?=
 =?utf-8?B?L3czSFRobDNQLzl2OUZNUFpVaGVvQ2pmWHoyUTMzN0VCOGdxVUI3NG9rc1dY?=
 =?utf-8?B?WTI3S2V5Y3RsZDJCU0tUbUVSbFI2WjRMeUEzYy9SeEE5azNJSjZxOGY5OE9s?=
 =?utf-8?B?Y29nVGFXTnJwRDcvS1hkWUpvbWZMdGVmbjloSFl2SWFISEdJVThEUkFaaEts?=
 =?utf-8?B?eHhNTWN3bHVzTElESXY2L3hVSi9DZktnYXc4c0J6ZFpUaE44QmQ3cHVMazN3?=
 =?utf-8?B?WTAxb0F2ckhKalowK1VCTHVod0d0Tm9xbGJTOW9KNmdpUGNmcjY3UE5NTFd5?=
 =?utf-8?B?Y3pPM0hkYnAyblRpQkxzTFBKaXNvQmwyYUJ2MFVyYnNIQ2JObGNvT2dZRjUx?=
 =?utf-8?B?OGZWd2pyaWFXTEF4MU5qeEcyb3poM1BlakRXdWJWTnZxYXhuY1RLWmRBc3Uw?=
 =?utf-8?B?NnlleXV1ZVgrUm1mQlRhbmdNcXQwbFNYT3BsWkFtREp3ekFlZ3BMK2dqM2lP?=
 =?utf-8?B?WmlHNWFDWU5YazFCUFBuOGswT1NNK29NNE9mZkswWmJ2K0RmdTJMV3J4MXhm?=
 =?utf-8?B?RFM2cFNXSVdrYnlqalViSTZqb0N4M09pSWpFUXRyMmRaUU5MUk9TMVFoS2VI?=
 =?utf-8?B?NDYxQzhhZ3pyNWp1SVl3aHZ3OUsrMFJkeWdpVG5uL21rR0o5SGRxMTZxbWxr?=
 =?utf-8?B?YXRZSVBSOXU5L3Z4SVRZS0gzb3VYbGJaRTJ6YU1wQXVPK3FLaWdHWTJtNit6?=
 =?utf-8?B?amtYVHgzdWQrYS8zbjFJNDdwUTNWVS9LcjhvczRrUWp0SVcxRlB0bUdna29N?=
 =?utf-8?B?UGxvV3NwQWowT09OeW5mbW90YzBFZ1dIZjZYSEg4T3lLUHJ3VGNXZkVHNHd5?=
 =?utf-8?B?NTRxWTl4WVNRcU1QMzhTR3N5Vzgrem0zcGoyT3E5ajE1M3o3T1BCSENLZE94?=
 =?utf-8?B?b1JlYm5lQ1FSeFg0U1VDYVVmYytvNHAvY0Y4TFhDOG9nQzd0bVZzOVFVM2Vw?=
 =?utf-8?B?ZlpVVHpOVWhRR1U4SGZTVHQxQ3RDYXFzRFIrMVdtL1RLbGNQWXkxMzBEeThi?=
 =?utf-8?B?ODRwbEtBSDQyN0RITUZFU3JJRy9IcTFLK3B2cDcxOVo1V3JOb0RJQlY3Y1Bt?=
 =?utf-8?B?UDFwb09pWFMzTnpEdkdZZkc3NWtTWUhvWmMxbUNKZVcxYjVlNWMxWkdMM3Jt?=
 =?utf-8?B?M3lINzYyQTQ0WEtWUmNsZGVDaldHTnBtK21PZG96TmdXWjZyNzVqNXcrMldQ?=
 =?utf-8?B?bUlJTnZ6Uk1IZHdxd2c0aUJiVWc3d3QySDRMR3FqRlJNb09vVmYzTk9sWUlZ?=
 =?utf-8?B?ZVNXdDd3NThpYnkvYy9NYTdRNnYrVldXUGo2WEFqMTlSMWJMRjZSMGpJa2Ri?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 358b5788-c1d6-420b-ad52-08dc1cbd74ac
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5726.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 09:18:41.5438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soabRVTa/SjKz5eCdCgejoMvDkFuuMmB2A8KLD7/6wXXzCP/KkT9W7cNMvByVXHCaQO4HcvFltwoo1OPUjqMM8p1sfdJXCqOV021b2reeiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
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

Hi Kunal,

On 24-01-2024 01:55 pm, Joshi, Kunal1 wrote:
> Hello Bhanu,
> 
> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Wednesday, January 24, 2024 1:25 PM
> To: Joshi, Kunal1 <kunal1.joshi@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: add new test to validate force bigjoiner
> 
> Hi Kunal,
> 
> On 18-01-2024 09:48 pm, Kunal Joshi wrote:
>> Earlier bigjoiner was enabled only for below cases
>> a) for mode having hdisplay > 5k
>> b) if clock requirement were higher than 1 pipe could handle
>>
>> https://patchwork.freedesktop.org/series/124730/
>> With above series we can force bigjoiner without such constraints.
>>
>> Cc: Swati Sharma <swati2.sharma@intel.com>
>> Cc: Karthik B S <karthik.b.s@intel.com>
>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>    tests/intel/kms_big_joiner.c | 92 +++++++++++++++++++++++++++++++++---
>>    1 file changed, 86 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/intel/kms_big_joiner.c
>> b/tests/intel/kms_big_joiner.c index aba2adfbe..bc1c49023 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_big_joiner.c
>> @@ -46,8 +46,10 @@
>>     *
>>     * SUBTEST: 2x-modeset
>>     * Description: Verify simultaneous modeset on 2 big joiner outputs
>> + *
>> + * SUBTEST: force-bigjoiner
>> + * Description: Verify bigjoiner on non bigjoiner outputs by force
>>     */
>> -
>>    IGT_TEST_DESCRIPTION("Test big joiner");
>>    
>>    struct bigjoiner_output {
>> @@ -67,6 +69,23 @@ typedef struct {
>>    
>>    static int max_dotclock;
>>    
>> +static void force_big_joiner_on_all_outputs(data_t *data, bool
>> +enable) {
>> +	igt_output_t *output;
>> +
>> +	for_each_connected_output(&data->display, output) {
>> +		/*
>> +		 * Force big joiner on output
>> +		 */
>> +		igt_assert_f(igt_force_bigjoiner_enable(data->drm_fd, output->name, enable) >= 0,
>> +			     "Failed to %s big joiner for connector %s\n",
>> +			     enable ? "enable" : "disable", output->name);
>> +		igt_assert_f(igt_check_force_bigjoiner_status(data->drm_fd, output->name) == enable ? 1 : 0,
>> +			     "Failed to force big joiner on output %s\n", output->name);
>> +	}
>> +	igt_display_commit2(&data->display, COMMIT_ATOMIC); }
>> +
>>    static void test_invalid_modeset(data_t *data)
>>    {
>>    	igt_output_t *output;
>> @@ -107,6 +126,53 @@ static void test_invalid_modeset(data_t *data)
>>    	igt_assert_lt(ret, 0);
>>    }
>>    
>> +static void cleanup(data_t *data, igt_output_t *output, struct igt_fb *primary_fb, igt_plane_t **primary) {
>> +    for_each_connected_output(&data->display, output) {
>> +        igt_output_set_pipe(output, PIPE_NONE);
>> +    }
>> +    force_big_joiner_on_all_outputs(data, false);
>> +    free(primary_fb);
>> +    free(primary);
>> +}
>> +
>> +static void force_bigjoiner(data_t *data, int simultaneous_bigjoner)
> 
> Instead of writing the new logic, let's try to utilize the existing infra. All we need to do is Fix the logic (force bigjoiner) to identify the selected output as bigjoiner supported.
> 
> - Bhanu
> [Kunal Joshi]
> The existing logic is to test valid big joiner outputs, this test aims to force big joiner output on
> non bigjoiner output.
> 
> So would prefer to add a new test for this behaviour. Please explain if you think otherwise.

Existing logic:
- Iterate all connected outputs
- Check bigjoiner capability (We need to tweak this logic: to force the 
bigjoiner & check the capability)
- Add the output to data if it is a bigjoiner capable
- Run the test using available outputs in data

By tweaking the above logic, we can re-use the existing functions to 
test the force-bigjoiner.

Please let me know if you need more information.

- Bhanu

> 
>> +{
>> +	int no_of_outputs;
>> +	drmModeModeInfo *mode;
>> +	igt_output_t *output;
>> +	igt_display_t *display = &data->display;
>> +	enum pipe pipe;
>> +	struct igt_fb *primary_fb = malloc(data->n_pipes * sizeof(struct igt_fb));
>> +	igt_plane_t **primary = malloc(data->n_pipes * sizeof(igt_plane_t
>> +*));
>> +
>> +	igt_display_reset(display);
>> +	pipe = 0;
>> +	no_of_outputs = 0;
>> +
>> +	force_big_joiner_on_all_outputs(data, true);
>> +	for_each_connected_output(display, output) {
>> +		mode = igt_output_get_mode(output);
>> +		igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 0.0, &primary_fb[no_of_outputs]);
>> +		igt_output_set_pipe(output, pipe);
>> +		primary[no_of_outputs] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +		igt_plane_set_fb(primary[no_of_outputs], &primary_fb[no_of_outputs]);
>> +		igt_info("Using (pipe %s + %s) to run the subtest with mode %dx%d@%d.\n",
>> +				kmstest_pipe_name(pipe), igt_output_name(output),
>> +				output->override_mode.hdisplay, output->override_mode.vdisplay, output->override_mode.vrefresh);
>> +		no_of_outputs++;
>> +		pipe = pipe + 2;
>> +		if (pipe >= data->n_pipes || no_of_outputs >= simultaneous_bigjoner)
>> +			break;
>> +	}
>> +	if (no_of_outputs != simultaneous_bigjoner) {
>> +		cleanup(data, output, primary_fb, primary);
>> +		igt_skip("Can't test all outputs\n");
>> +	}
>> +	igt_display_commit2(display, COMMIT_ATOMIC);
>> +	cleanup(data, output, primary_fb, primary); }
>> +
>>    static void test_basic_modeset(data_t *data)
>>    {
>>    	drmModeModeInfo *mode;
>> @@ -257,24 +323,27 @@ igt_main
>>    			j++;
>>    		}
>>    
>> -		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>> -
>> -		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> -				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>    	}
>>    
>>    	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>>    	igt_subtest_with_dynamic("basic") {
>> +		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>    		for (i = 0; i < data.n_pipes - 1; i++) {
>>    			data.pipe1 = pipe_seq[i];
>>    			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
>>    				test_basic_modeset(&data);
>>    		}
>> +		igt_remove_fb(data.drm_fd, &data.fb);
>>    	}
>>    
>>    	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>>    		     "when the pipe is active with a big joiner modeset");
>>    	igt_subtest_with_dynamic("invalid-modeset") {
>> +		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
>> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>>    		data.pipe1 = pipe_seq[j - 1];
>>    
>>    		igt_display_reset(&data.display);
>> @@ -323,11 +392,15 @@ igt_main
>>    					test_invalid_modeset(&data);
>>    			}
>>    		}
>> +		igt_remove_fb(data.drm_fd, &data.fb);
>>    	}
>>    
>>    	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
>>    	igt_subtest_with_dynamic("2x-modeset") {
>>    		igt_require_f(count > 1, "2 outputs with big joiner modes are
>> required\n");
>> +		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> +				      DRM_FORMAT_MOD_LINEAR, &data.fb);
>> +
>>    		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
>>    		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
>>    			data.pipe1 = pipe_seq[i];
>> @@ -335,10 +408,17 @@ igt_main
>>    			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
>>    				test_dual_display(&data);
>>    		}
>> +		igt_remove_fb(data.drm_fd, &data.fb);
>> +	}
>> +
>> +	igt_describe("Verify bigjoiner on non bigjoiner outputs by force");
>> +	igt_subtest_with_dynamic("force-bigjoiner") {
>> +		for (i = 1; i  < valid_output+1; i++)
>> +			igt_dynamic_f("%dx", i)
>> +				force_bigjoiner(&data, i);
>>    	}
>>    
>>    	igt_fixture {
>> -		igt_remove_fb(data.drm_fd, &data.fb);
>>    		igt_display_fini(&data.display);
>>    		drm_close_driver(data.drm_fd);
>>    	}
> Thanks and Regards
> [Kunal Joshi]
> 
