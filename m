Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E4710EBE9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 17:57:42 +0000 (UTC)
Date: Wed, 29 Mar 2023 19:56:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230329175650.w6lrwqhdaktz67lu@kamilkon-desk1>
References: <20230327133155.2428454-1-mauro.chehab@linux.intel.com>
 <20230327133155.2428454-12-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230327133155.2428454-12-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 11/11] xe/xe_noexec_ping_pong: document
 subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-03-27 at 15:31:55 +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Use the SUBTEST tag to add the subtest's description to the
> IGT test plan documentation.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/xe/xe_noexec_ping_pong.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
> index dc14f8cf3f2d..367671883a28 100644
> --- a/tests/xe/xe_noexec_ping_pong.c
> +++ b/tests/xe/xe_noexec_ping_pong.c
> @@ -20,20 +20,22 @@
>   * Category: Software building block
>   * Sub-category: compute
>   * Test category: functionality test
> - */
> -
> -/*
> - * This test creates compute vms, binds a couple of bos and an engine each,
> - * thus redying it for execution. However, VRAM memory is over-
> - * committed and while there is still nothing to execute, an eviction
> - * will trigger the VM's rebind worker to rebind the evicted bo, which
> - * will in turn trigger another eviction and so on.
>   *
> - * Since we don't have eviction stats yet we need to watch "top" for
> - * the rebind kworkers using a lot of CPU while the test idles.
> + * SUBTEST:
> + * Description:
> + *	This test creates compute vms, binds a couple of bos and an engine each,
> + *	thus redying it for execution. However, VRAM memory is over-
> + *	committed and while there is still nothing to execute, an eviction
> + *	will trigger the VM's rebind worker to rebind the evicted bo, which
> + *	will in turn trigger another eviction and so on.
> + *
> + *	Since we don't have eviction stats yet we need to watch "top" for
> + *	the rebind kworkers using a lot of CPU while the test idles.
>   *
> - * The correct driver behaviour should be not to rebind anything unless
> - * there is worked queued on one of the VM's compute engines.
> + *	The correct driver behaviour should be not to rebind anything unless
> + *	there is worked queued on one of the VM's compute engines.
> + * Run type: FULL
> + * TODO: change ``'Run type' == FULL`` to a better category
>   */
>  static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
>  {
> -- 
> 2.39.2
> 

