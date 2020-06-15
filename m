Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E72C89C88
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2020 10:43:47 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200615051848.24654-1-pankaj.laxminarayan.bharadiya@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <159221779728.2981.5003242667494244561@build.alporthouse.com>
Date: Mon, 15 Jun 2020 11:43:17 +0100
Subject: Re: [igt-dev] [i-g-t] lib/rendercopy: Specify the correct vertex
 buffer offset
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
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Pankaj Bharadiya (2020-06-15 06:18:48)
> We must specify the correct vertex buffer offset as
> "End Offset Enable" bit is not enabled in 3DPRIMITIVE instruction.
> 
> This fixes below fatal error:
> 
>  [FATAL]:
>  ***** **** *** ** * FATAL * ** *** **** *****
>  StateArbiter>Surface State Pointers in the binding table must be 64 byte aligned.
>  Be sure that the binding table is set up correctly. Address found: 6b6b6b6b
>  ***** **** *** ** END FATAL ** *** **** *****

That is nothing to do with vertex offset. That says as it read the
binding table, it dereferenced the scratch page.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
