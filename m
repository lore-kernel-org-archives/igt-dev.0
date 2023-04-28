Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7AB10E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:41:44 +0000 (UTC)
Date: Fri, 28 Apr 2023 13:40:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230428134019.41a3b0f5@maurocar-mobl2>
In-Reply-To: <20230428132808.38b4c452@maurocar-mobl2>
References: <20230424162642.116013-1-kamil.konieczny@linux.intel.com>
 <20230424162642.116013-2-kamil.konieczny@linux.intel.com>
 <20230425083554.smv7oaml4g7e7fd5@kamilkon-desk1>
 <20230428132808.38b4c452@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] Use the new procps library libproc2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Craig Small <csmall@dropbear.xyz>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 28 Apr 2023 13:28:08 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Tue, 25 Apr 2023 10:35:54 +0200
> Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> 
> I would try to confine the procps-ng version check to the helper functions,
> keeping here a logic that would be generic enough to be used with either
> versions, probably using some abstraction, like placing version-specific
> structs like:
> 
> 	#ifdef HAVE_LIBPROCPS
> 		struct igt_process {
> 			struct pids_info *info = NULL;
> 			struct pids_stack *stack;
> 		};
> 	#else
> 		struct igt_process {
> 			proc_t *proc_info;
> 			PROCTAB *proc;
> 		};
> 	#endif
> 
> And adding a helper functions to handle open/close and ID retrieve logic,
> e.g. changing the code to something similar to:
> 
> 	struct igt_process proc;
> 
> 	...
> 	igt_info("Preventing pipewire-pulse to use the audio drivers\n");
> 	open_process(&proc);
> 	while (get_process_ids(proc, &tid, &euid, &egid)) {
> 		if (pipewire_pulse_pid == tid)
> 			break;
> 	}
> 	close_proccess(proc);
> 
> This would make easier to maintain, as newer versions of procps-ng
> may use different implementations too, and the business logic will
> be split from the procps API internal details.

As a generic note, #ifdefs usually makes the code harder to read.

So, I would try to code implementation inside the C source code either
as separate files or, if inside the same C file, as:


	#ifdef HAVE_LIBPROCPS
	// procps-ng (up to) version 3.x
	#  include <proc/readproc.h>
	#else
	// procps-ng version 4.x
	#  include <libproc2/pids.h>
	#endif

	...

 	#ifdef HAVE_LIBPROCPS

	struct igt_process {
		struct pids_info *info;
		struct pids_stack *stack;
	};

	int open_process(...)
	{
		// procps-ng version 3 implementation
	}

	void close_process(...)
	{
		// procps-ng version 3 implementation
	}

	int get_process_ids(...)
	{
		// procps-ng version 3 implementation
	}

	...

 	#else

	struct igt_process {
		proc_t *proc_info;
		PROCTAB *proc;
	};

	int open_process(...)
	{
		// procps-ng version 4 implementation
	}

	void close_process(...)
	{
		// procps-ng version 4 implementation
	}

	int get_process_ids(...)
	{
		// procps-ng version 4 implementation
	}

		...
 	#endif // HAVE_LIBPROCPS

Regards,
Mauro
