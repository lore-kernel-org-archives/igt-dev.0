Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113F06E135
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Dec 2020 08:15:13 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Fri, 4 Dec 2020 08:15:03 +0000
Message-ID: <899d5b123777447dae328207e2d35f05@intel.com>
References: <20201202091747.409-1-nidhi1.gupta@intel.com>
 <160690139620.2037.12501279123485164291@build.alporthouse.com>
In-Reply-To: <160690139620.2037.12501279123485164291@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] Check for available outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks for the review Chris, what I am trying to do is to execute 
subtest only on the available output not on all, as all the tests which 
I grouped together are dual display tests so I merged them together , 
can you suggest some way to achieve the same if not using dynamic subtest?


-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: Wednesday, December 2, 2020 3:00 PM
To: igt-dev@lists.freedesktop.org; Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; Latvala, Petri <petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Check for available outputs

Quoting nidhi1.gupta@intel.com (2020-12-02 09:17:47)
> From: Nidhi Gupta <nidhi1.gupta@intel.com>
> 
> In kms_cursor_legacy will test all the pipes defined in IGT which is 6 
> weather the output is available or not.Later it has to be analysed and 
> discard it as valid skip.To save this time updated in test to first 
> check the available outputs and then execute the test.

There needs to be much strongly guidelines on when to use dynamic.
Subtests by another name is not ideal.

These are definitely not all the same test, labelling them as minor variations of the same theme is ridiculous.

You are trying to work around a "problem" caused by another tool.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
