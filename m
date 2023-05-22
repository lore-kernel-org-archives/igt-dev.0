Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226AD10E05A
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 05:28:00 +0000 (UTC)
Message-ID: <948b1464-c716-caa1-3022-a2705568d9d5@intel.com>
Date: Mon, 22 May 2023 10:57:41 +0530
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-7-bhanuprakash.modem@intel.com>
 <20230518185810.6bmmdgmni5uif3c2@zkempczy-mobl2>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230518185810.6bmmdgmni5uif3c2@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 06/20] tests/i915: Close the fd before exit
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

Hi Zbigniew,

On Fri-19-05-2023 12:28 am, Zbigniew Kempczyński wrote:
> On Tue, May 16, 2023 at 10:20:44PM +0530, Bhanuprakash Modem wrote:
>> Close the file descriptor before exiting the test.
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/dmabuf_sync_file.c        | 3 +++
>>   tests/drm_read.c                | 3 +++
>>   tests/i915/gem_barrier_race.c   | 3 +++
>>   tests/i915/gem_basic.c          | 3 +++
>>   tests/i915/gem_concurrent_all.c | 5 +++++
>>   tests/i915/gem_ctx_engines.c    | 4 +++-
>>   tests/i915/gem_ctx_exec.c       | 3 +++
>>   tests/i915/gem_ctx_freq.c       | 3 +++
>>   tests/i915/gem_ctx_shared.c     | 3 +++
>>   tests/i915/gem_eio.c            | 3 +++
>>   tests/i915/gem_exec_alignment.c | 3 +++
>>   tests/i915/gem_exec_balancer.c  | 3 +++
>>   tests/i915/gem_exec_endless.c   | 3 +++
>>   tests/i915/gem_flink_basic.c    | 3 +++
>>   tests/i915/gem_userptr_blits.c  | 3 +++
>>   tests/i915/gem_workarounds.c    | 3 +++
>>   tests/i915/i915_pm_rps.c        | 3 +++
>>   17 files changed, 53 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
>> index 25bb6ad75..cfa73117b 100644
>> --- a/tests/dmabuf_sync_file.c
>> +++ b/tests/dmabuf_sync_file.c
>> @@ -380,4 +380,7 @@ igt_main
>>   		     "operations.");
>>   	igt_subtest("import-multiple-read-write")
>>   		test_import_multiple(fd, true);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
> 
> I think this is handled by igt_types.c:igt_cleanup_fd()

I am not 100% sure, I think we need to declare the fd as "igt_fd_t(fd)", 
then only igt_cleanup_fd() will takecare of it.

Also, as it is a good practice to close the fd before exit, still I can 
recommend to use drm_close_driver().

- Bhanu

> 
> --
> Zbigniew
> 
>>   }
>> diff --git a/tests/drm_read.c b/tests/drm_read.c
>> index 36dc623ed..e989e7bfb 100644
>> --- a/tests/drm_read.c
>> +++ b/tests/drm_read.c
>> @@ -311,4 +311,7 @@ igt_main
>>   
>>   	igt_subtest("short-buffer-wakeup")
>>   		test_short_buffer_wakeup(fd, pipe);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
>> index faeec3617..46273ab55 100644
>> --- a/tests/i915/gem_barrier_race.c
>> +++ b/tests/i915/gem_barrier_race.c
>> @@ -153,4 +153,7 @@ igt_main
>>   			break;
>>   		}
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
>> index 3dd790c6c..4e063febd 100644
>> --- a/tests/i915/gem_basic.c
>> +++ b/tests/i915/gem_basic.c
>> @@ -117,4 +117,7 @@ igt_main
>>   	igt_describe("Verify that closing drm driver is possible with opened gem object.");
>>   	igt_subtest("create-fd-close")
>>   		test_create_fd_close(fd);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
>> index fb3b5f5d8..0bf46c0a2 100644
>> --- a/tests/i915/gem_concurrent_all.c
>> +++ b/tests/i915/gem_concurrent_all.c
>> @@ -2015,4 +2015,9 @@ igt_main
>>   			}
>>   		}
>>   	}
>> +
>> +	igt_fixture {
>> +		drm_close_driver(fd);
>> +		drm_close_driver(vgem_drv);
>> +	}
>>   }
>> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
>> index b87a21fa4..3daed16a0 100644
>> --- a/tests/i915/gem_ctx_engines.c
>> +++ b/tests/i915/gem_ctx_engines.c
>> @@ -633,6 +633,8 @@ igt_main
>>   			independent_all(i915, ctx);
>>   	}
>>   
>> -	igt_fixture
>> +	igt_fixture {
>>   		igt_stop_hang_detector();
>> +		drm_close_driver(i915);
>> +	}
>>   }
>> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
>> index 20fa1159e..40a373ab6 100644
>> --- a/tests/i915/gem_ctx_exec.c
>> +++ b/tests/i915/gem_ctx_exec.c
>> @@ -546,4 +546,7 @@ igt_main
>>   		gem_context_destroy(fd, ctx_id);
>>   		put_ahnd(ahnd);
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
>> index 18e736c73..ce4c0ba55 100644
>> --- a/tests/i915/gem_ctx_freq.c
>> +++ b/tests/i915/gem_ctx_freq.c
>> @@ -213,4 +213,7 @@ igt_main
>>   
>>   	igt_subtest_f("sysfs")
>>   		sysfs_range(i915);
>> +
>> +	igt_fixture
>> +		drm_close_driver(i915);
>>   }
>> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
>> index 8629992e8..77a210d03 100644
>> --- a/tests/i915/gem_ctx_shared.c
>> +++ b/tests/i915/gem_ctx_shared.c
>> @@ -1088,4 +1088,7 @@ igt_main
>>   			igt_stop_hang_detector();
>>   		}
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(i915);
>>   }
>> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
>> index 81e55e165..18eec0413 100644
>> --- a/tests/i915/gem_eio.c
>> +++ b/tests/i915/gem_eio.c
>> @@ -1126,4 +1126,7 @@ igt_main
>>   			intel_allocator_multiprocess_stop();
>>   		}
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
>> index 5059572f1..ddddad533 100644
>> --- a/tests/i915/gem_exec_alignment.c
>> +++ b/tests/i915/gem_exec_alignment.c
>> @@ -546,4 +546,7 @@ igt_main
>>   		prio_inversion(fd, SHARED);
>>   	igt_subtest("pi-isolated")
>>   		prio_inversion(fd, ISOLATED);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
>> index 1c655e583..df16f8bec 100644
>> --- a/tests/i915/gem_exec_balancer.c
>> +++ b/tests/i915/gem_exec_balancer.c
>> @@ -3482,4 +3482,7 @@ igt_main
>>   		igt_subtest("nohangcheck")
>>   			nohangcheck(i915);
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(i915);
>>   }
>> diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
>> index 77719de83..f895c6783 100644
>> --- a/tests/i915/gem_exec_endless.c
>> +++ b/tests/i915/gem_exec_endless.c
>> @@ -367,4 +367,7 @@ igt_main
>>   			intel_register_access_fini(&mmio);
>>   		}
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(i915);
>>   }
>> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
>> index 2620bc55d..e9b915082 100644
>> --- a/tests/i915/gem_flink_basic.c
>> +++ b/tests/i915/gem_flink_basic.c
>> @@ -188,4 +188,7 @@ igt_main
>>   	igt_describe("Tests flink lifetime by referencing from multiple descriptors.");
>>   	igt_subtest("flink-lifetime")
>>   		test_flink_lifetime(fd);
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
>> index baba7cf3c..056c7a7ac 100644
>> --- a/tests/i915/gem_userptr_blits.c
>> +++ b/tests/i915/gem_userptr_blits.c
>> @@ -2703,4 +2703,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>>   		igt_require(has_userptr_probe(fd));
>>   		test_probe(fd);
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>>   }
>> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
>> index ae544adbc..7462dc600 100644
>> --- a/tests/i915/gem_workarounds.c
>> +++ b/tests/i915/gem_workarounds.c
>> @@ -339,4 +339,7 @@ igt_main
>>   			}
>>   		}
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(device);
>>   }
>> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
>> index d4ee2d58a..f2374aff0 100644
>> --- a/tests/i915/i915_pm_rps.c
>> +++ b/tests/i915/i915_pm_rps.c
>> @@ -959,4 +959,7 @@ igt_main
>>   		waitboost(drm_fd, true);
>>   		igt_disallow_hang(drm_fd, hang);
>>   	}
>> +
>> +	igt_fixture
>> +		drm_close_driver(drm_fd);
>>   }
>> -- 
>> 2.40.0
>>
