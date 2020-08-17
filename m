Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C176E0BF
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2020 12:18:07 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200817120149.17083-2-mika.kuoppala@linux.intel.com>
References: <20200817120149.17083-1-mika.kuoppala@linux.intel.com>
 <20200817120149.17083-2-mika.kuoppala@linux.intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 17 Aug 2020 13:18:03 +0100
Message-ID: <159766668315.667.5488235683272966428@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/gen7_exec_parse: Test lrm/lri
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, igt-dev@lists.freedesktop.org
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Mika Kuoppala (2020-08-17 13:01:47)
> @@ -117,8 +119,10 @@ static uint64_t __exec_batch_patched(int fd,
>         execbuf.batch_len = size;
>         execbuf.flags = I915_EXEC_RENDER;
>  
> -       gem_execbuf(fd, &execbuf);
> +       ret = __checked_execbuf(fd, &execbuf);
>         gem_sync(fd, cmd_bo);

__check_execbuf() makes the sync redundant.

> +       if (ret)
> +               return ret;
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
