Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E86E207
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 11:26:50 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Tue, 5 May 2020 11:26:46 +0000
Message-ID: <BN7PR11MB2705BCA50D5D73A20AF25BDC8DA70@BN7PR11MB2705.namprd11.prod.outlook.com>
References: <20200430113316.9217-1-priyanka.dandamudi@intel.com>
 <158824684306.7361.5676893188598840257@build.alporthouse.com>
In-Reply-To: <158824684306.7361.5676893188598840257@build.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_eio:Replace
 legacy engines with new API
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
List-ID: <igt-dev@lists.freedesktop.org>

Changes has been made in test_inflight ,test_inflight_internal,test_inflight_context and they are executing with new changes.

Regards,
Priyanka

-----Original Message-----
From: Chris Wilson <chris@chris-wilson.co.uk> 
Sent: 30 April 2020 05:11 PM
To: igt-dev@lists.freedesktop.org; Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] tests/i915/gem_eio:Replace legacy engines with new API

Quoting priyanka.dandamudi@intel.com (2020-04-30 12:33:16)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Legacy engines for_each_engine* has been replaced with the ones 
> implemented in the gem_engine_topology library.

Hmm, so one of the principles for this is that it is testing ABI error codes, including an EIO from execbuf after a fatal hang. How confident are we that engine selection will never alter that logic?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
