Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F1F6EB9A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2020 11:41:01 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200430113316.9217-1-priyanka.dandamudi@intel.com>
References: <20200430113316.9217-1-priyanka.dandamudi@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158824684306.7361.5676893188598840257@build.alporthouse.com>
Date: Thu, 30 Apr 2020 12:40:43 +0100
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
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting priyanka.dandamudi@intel.com (2020-04-30 12:33:16)
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Legacy engines for_each_engine* has been replaced with the ones
> implemented in the gem_engine_topology library.

Hmm, so one of the principles for this is that it is testing ABI error
codes, including an EIO from execbuf after a fatal hang. How confident
are we that engine selection will never alter that logic?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
