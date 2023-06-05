Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EF910E288
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 10:46:45 +0000 (UTC)
Date: Mon, 5 Jun 2023 12:46:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230605124640.451c5cb2@maurocar-mobl2>
In-Reply-To: <20230602082721.7818-7-dominik.karol.piatkowski@intel.com>
References: <20230602082721.7818-1-dominik.karol.piatkowski@intel.com>
 <20230602082721.7818-7-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 6/6] Fix drm_mm build error
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri,  2 Jun 2023 10:27:21 +0200
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> Quick workaround for drm_mm documentation causing compilation error.

NACK.

This is actually a runtime error at drm_mm:

	$ ./build/tests/drm_mm --list
	Received signal SIGSEGV.
	Stack trace: 
	 #0 [fatal_sig_handler+0x17b]
	 #1 [__sigaction+0x50]
	 #2 [igt_kunit+0x55]
	 #3 [main+0x2a]
	 #4 [__libc_start_call_main+0x7a]
	 #5 [__libc_start_main+0x8b]
	 #6 [_start+0x25]
	Segmentation fault (core dumped)

I'll reply to this thread with two patches addressing the issue.

Regards,
Mauro
